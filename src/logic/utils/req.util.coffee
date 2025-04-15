
#[private]
function req(method, url, token, data)
  unless url
    throw new ReferenceError("URL can't be null")
  curl(url, {
    url,
    method,
    headers: {
      'Content-Type': 'application/json',
      [if token then "token" else "notoken"]: token if typeof token == "string"
    },
    body: jsons data if data 
  }).pipe (r) ->
    content = await r.text()
    try
      return json content
    catch(e)
      return content

export fn req_get(url, token)
  req('GET', url, token)

export fn req_post(url, token, data)
  req('POST', url, token, data)