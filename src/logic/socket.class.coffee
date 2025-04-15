import class_base from './base.class.coffee'
import { io } from 'socket.io-client'

using namespace std::ns ->
  export default class Socket extends class_base
    #[private]
    socket = null

    connect(token){
      socket = io(this.url.socket, {
        auth: {
          token: token || this.auth.user.token
        }
      })
      if !token and this.auth.user.token
        this.socket = socket
      return socket
    }