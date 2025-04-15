class_base = imp './base.class.coffee'
{
  req_get,
  req_post
} = imp './utils/req.util.coffee'


#[private]
function verify(self, token)
  wait req_get self.url.whoami, token

#[private]
function get_self(self, token)
  wait req_get self.url.user('me'), token

#[private]
function login(self, username, password)
  wait req_post self.url.login(username, password)

using namespace std::ns ->
  export default class AuthAPI extends class_base
    user = {
      token: null
    }
    login(username, password, token)
      if token
        if verify @self, token
          user = get_self @self, token
          user.token = token
          user
      else
        data = login @self, username, password
        user = get_self @self, data.response.session
        user.token = data.response.session
        user
    
    login_as(username, password, token)
      @set_user @login username, password, token
      @user

    set_user(user)
      @user = user

    set_token(token)
      if verify token
        @set_user get_self @self, token