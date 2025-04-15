
using namespace std::ns ->
  pub default model = class
    __strict__ = true
    
    set(object)
      for i in object
        this[i] = object[i] if (@__strict__ ? i in this : true)
      @
    
    toJson()
      jsons this

    fromJson(json_string)
      json_object = if typeof json_string == "string" ? json json : json_string

      @set(json_object)

