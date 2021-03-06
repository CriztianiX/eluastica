import EluasticaAbstractTransport from require "eluastica.transport.abstract_transport"
import p from require "moon"
util = require "eluastica.util"
http = require("socket.http")
ltn12 = require("ltn12")
cjson = require "cjson"

class EluasticaTransportHttp extends EluasticaAbstractTransport
  name: "http"
  _scheme: 'http'

  exec: (request, params) =>
    connection = @getConnection!
    url = connection\hasConfig('url') and connection\hasConfig('url') or ""

    local baseUri
    if not util.empty(url)
      baseUri = url
    else
      baseUri = @_scheme .. '://' .. connection\getHost() .. ':' .. connection\getPort() .. '/' .. connection\getPath!

    baseUri = "#{baseUri}#{request\getPath!}"
    query = request\getQuery!

    jsstr = cjson.encode query
    source = ltn12.source.string(jsstr)
    response = {}
    save = ltn12.sink.table(response)
    jsonsize = # jsstr
    h = {
      ["Content-Type"]: "application/json",
      ["content-length"]: jsonsize
    }

    ok, code, headers  = http.request{
      url: baseUri,
      method: 'GET',
      headers: h,
      source: source,
      sink: save
    }
    
    if not ok
      return "execpion " .. code

    jsonObj = cjson.decode(table.concat(response))
    return jsonObj

{ :EluasticaTransportHttp }
