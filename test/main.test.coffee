import * as Scriff from "../main.coffee"
import * as conf from "conf"

using conf::class("auth", token: ""), (conf_class) ->
  using Scriff, (Scriff) ->
    _token = conf_class.get('token')
    if _token
      Scriff.auth.login_as(null, null, _token)
    else
      username = input 'username: '
      password = input 'password: '
      _token = Scriff.auth.login_as(username, password).token
      conf_class.set('token', _token)

    Scriff.socket.connect()