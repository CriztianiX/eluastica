local EluasticaParam
do
  local _obj_0 = require("eluastica.param")
  EluasticaParam = _obj_0.EluasticaParam
end
local EluasticaTransportCreater
do
  local _obj_0 = require("eluastica.transport.creater")
  EluasticaTransportCreater = _obj_0.EluasticaTransportCreater
end
local EluasticaConnection
do
  local _parent_0 = EluasticaParam
  local _base_0 = {
    name = "connection",
    getPort = function(self)
      return self:hasParam('port') and self:getParam('port') or EluasticaConnection.DEFAULT_PORT
    end,
    setPort = function(self, port)
      return self:setParam('port', tonumber(port))
    end,
    getHost = function(self)
      return self:hasParam('host') and self:getParam('host') or EluasticaConnection.DEFAULT_HOST
    end,
    setHost = function(self, host)
      return self:setParam('host', host)
    end,
    getTransport = function(self)
      return self:hasParam('transport') and self:getParam('transport') or EluasticaConnection.DEFAULT_TRANSPORT
    end,
    setTransport = function(self, transport)
      return self:setParam('transport', transport)
    end,
    getPath = function(self)
      return self:hasParam('path') and self:getParam('path') or ""
    end,
    setPath = function(self, path)
      return self:setParam('path', path)
    end,
    setEnabled = function(self, enabled)
      if enabled == nil then
        enabled = true
      end
      return self:setParam('enabled', enabled)
    end,
    isEnabled = function(self)
      return self:getParam('enabled')
    end,
    getTransportObject = function(self)
      local transport = self:getTransport()
      return EluasticaTransportCreater.create(transport, self)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, params)
      if params == nil then
        params = { }
      end
      self:setParams(params)
      self:setEnabled(true)
      if not self:hasParam('config') then
        return self:setParam('config', { })
      end
    end,
    __base = _base_0,
    __name = "EluasticaConnection",
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
  local self = _class_0
  self.DEFAULT_PORT = 9200
  self.DEFAULT_HOST = 'localhost'
  self.DEFAULT_TRANSPORT = 'Http'
  self.TIMEOUT = 300
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  EluasticaConnection = _class_0
end
return {
  EluasticaConnection = EluasticaConnection
}
