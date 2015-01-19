local EluasticaTransportHttp
do
  local _obj_0 = require("eluastica.transport.http")
  EluasticaTransportHttp = _obj_0.EluasticaTransportHttp
end
local EluasticaTransportCreater
do
  local _base_0 = { }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "EluasticaTransportCreater"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.create = function(transport, connection, params)
    if params == nil then
      params = { }
    end
    local cnt = false
    if type(transport) == "string" then
      if transport == 'Http' then
        transport = EluasticaTransportHttp()
        cnt = true
      end
    end
    if cnt then
      transport:setConnection(connection)
      for key, value in ipairs(params) do
        transport:setParam(key, value)
      end
    end
    return transport
  end
  EluasticaTransportCreater = _class_0
end
return {
  EluasticaTransportCreater = EluasticaTransportCreater
}
