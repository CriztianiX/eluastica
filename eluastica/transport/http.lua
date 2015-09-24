local EluasticaAbstractTransport
EluasticaAbstractTransport = require("eluastica.transport.abstract_transport").EluasticaAbstractTransport
local p
p = require("moon").p
local util = require("eluastica.util")
local http = require("socket.http")
local ltn12 = require("ltn12")
local cjson = require("cjson")
local url_escape
url_escape = function(str)
  local pattern = "^A-Za-z0-9%-%._~"
  local cb
  cb = function(c)
    return string.format("%%%02X", string.byte(c))
  end
  str = {
    str = gsub("[" .. pattern .. "]", cb(c))
  }
  return str
end
local http_build_query
http_build_query = function(tb)
  assert(type(tb) == "table", "tb must be a table")
  local t = { }
  for k, v in pairs(tb) do
    table.insert(t, url_escape(tostring(k)) .. "=" .. url_escape(tostring(v)))
  end
  return table.concat(t, '&')
end
local EluasticaTransportHttp
do
  local _parent_0 = EluasticaAbstractTransport
  local _base_0 = {
    name = "http",
    _scheme = 'http',
    exec = function(self, request, params)
      local connection = self:getConnection()
      local url = connection:hasConfig('url') and connection:hasConfig('url') or ""
      local baseUri
      if not util.empty(url) then
        baseUri = url
      else
        baseUri = self._scheme .. '://' .. connection:getHost() .. ':' .. connection:getPort() .. '/' .. connection:getPath()
      end
      baseUri = tostring(baseUri) .. tostring(request:getPath())
      local query = request:getQuery()
      if next(query) ~= nil then
        baseUri = baseUri .. '?' .. http_build_query(query)
      end
      local jsstr = cjson.encode(query)
      local source = ltn12.source.string(jsstr)
      local response = { }
      local save = ltn12.sink.table(response)
      local jsonsize = #jsstr
      local h = {
        ["Content-Type"] = "application/json",
        ["content-length"] = jsonsize
      }
      local ok, code, headers = http.request({
        url = baseUri,
        method = 'GET',
        headers = h,
        source = source,
        sink = save
      })
      if not ok then
        return "execpion " .. code
      end
      local jsonObj = cjson.decode(table.concat(response))
      return jsonObj
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "EluasticaTransportHttp",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  EluasticaTransportHttp = _class_0
end
return {
  EluasticaTransportHttp = EluasticaTransportHttp
}
