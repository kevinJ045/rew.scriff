import class_base from './base.class.coffee'
import { io } from 'socket.io-client'

using namespace std::ns ->
  export default class Socket extends class_base
    #[private]
    socket = null

    connect(token){
      socket = io(this.self.url.base, {
        extraHeaders: {
          token: token || this.self.auth.user.token
        }
      })

      socket.connect()
      
      if !token and this.self.auth.user.token
        this.socket = socket
      socket
    }