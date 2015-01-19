local EluasticaParam
do
  local _obj_0 = require("eluastica.param")
  EluasticaParam = _obj_0.EluasticaParam
end
local p
do
  local _obj_0 = require("moon")
  p = _obj_0.p
end
local EluasticaRequest
do
  local _parent_0 = EluasticaParam
  local _base_0 = {
    name = "request",
    setMethod = function(self, method)
      return self:setParam('method', method)
    end,
    getMethod = function(self)
      return self:getParam('method')
    end,
    setData = function(self, data)
      return self:setParam('data', data)
    end,
    getData = function(self)
      return self:getParam('data')
    end,
    setPath = function(self, path)
      return self:setParam('path', path)
    end,
    getPath = function(self)
      return self:getParam('path')
    end,
    getQuery = function(self)
      return self:getParam('query')
    end,
    setQuery = function(self, query)
      if query == nil then
        query = { }
      end
      return self:setParam('query', query)
    end,
    setConnection = function(self, connection)
      self._connection = connection
      return self
    end,
    getConnection = function(self)
      return self._connection
    end,
    send = function(self)
      local transport = self:getConnection():getTransportObject()
      return transport:exec(self, self:getConnection():toArray())
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, path, method, data, query, connection)
      if method == nil then
        method = EluasticaRequest.GET
      end
      if data == nil then
        data = { }
      end
      if query == nil then
        query = { }
      end
      if connection == nil then
        connection = false
      end
      _parent_0.__init(self)
      self._connection = false
      self:setPath(path)
      self:setMethod(method)
      self:setData(data)
      self:setQuery(query)
      if connection then
        return self:setConnection(connection)
      end
    end,
    __base = _base_0,
    __name = "EluasticaRequest",
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
  self.HEAD = 'HEAD'
  self.POST = 'POST'
  self.PUT = 'PUT'
  self.GET = 'GET'
  self.DELETE = 'DELETE'
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  EluasticaRequest = _class_0
end
return {
  EluasticaRequest = EluasticaRequest
}
