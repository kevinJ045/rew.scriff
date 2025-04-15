import { create_api } from "./src/main.coffee"

Scriff = Usage::create 'scriff', (cb) ->
  api = create_api()
  cb(api)

Scriff.Make = -> create_api()

module.exports =  Scriff;