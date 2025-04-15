import url_map from "./data/constant/url.const.coffee";
import AuthAPI from "./logic/auth.class.coffee";
import Socket from "./logic/socket.class.coffee";


export create_api = ->
  api = new (class Scriff)
  api.url = new url_map
  api.auth = new AuthAPI(api)
  api.socket = new Socket(api)
  api