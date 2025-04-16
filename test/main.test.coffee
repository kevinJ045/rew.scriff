import * as Scriff from "../main.coffee"
import * as conf from "conf"

using conf::class("auth", token: ""), (conf_class) ->
  using Scriff, (scriff) ->
    _token = conf_class.get('token')
    if _token
      scriff.auth.login_as(null, null, _token)
    else
      username = input 'username: '
      password = input 'password: '
      _token = scriff.auth.login_as(username, password).token
      conf_class.set('token', _token)

    socket = scriff.socket.connect()

    socket.on('chat:new', print)