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
local EluasticaAbstractTransport
do
  local _parent_0 = EluasticaParam
  local _base_0 = {
    setConnection = function(self, connection)
      self._connection = connection
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, connection)
      if connection == nil then
        connection = false
      end
      self._connection = false
      if connection then
        return self:setConnection(connection)
      end
    end,
    __base = _base_0,
    __name = "EluasticaAbstractTransport",
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
  EluasticaAbstractTransport = _class_0
end
return {
  EluasticaAbstractTransport = EluasticaAbstractTransport
}
