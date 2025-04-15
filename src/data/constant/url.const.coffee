import const_map from './base.const.coffee'

using namespace std::ns ->
  export default url_map = class extends const_map
    base: "https://scriff.onrender.com" # "http://localhost:3333"
    
    login(username, password) "#{@base}/login/#{username}?pwd=#{password}&notokensave=true"

    api(url) "#{@base}/api/#{url}"

    user(username) @api('users/' + username)

    get whoami() "#{@base}/whoami"

    get socket() "#{@base}/socket.io"

    remote(username, id) "#{@base}/svr/#{username}/#{id}/34501"

    join(...paths) paths.join("/")
