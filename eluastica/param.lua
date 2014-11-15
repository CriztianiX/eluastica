local moses = require("eluastica.moses")
local EluasticaParam
do
  local _base_0 = {
    _params = { },
    _rawParams = { },
    toArray = function(self)
      local data = { }
      data[self:_getBaseName()] = self:getParams()
      if self._rawParams ~= nil then
        for k, v in pairs(self._rawParams) do
          data[k] = v
        end
      end
      return data
    end,
    _getBaseName = function(self)
      return self.name
    end,
    setParam = function(self, key, value)
      self._params[key] = value
      return self
    end,
    getParam = function(self, key)
      return self._params[key]
    end,
    getParams = function(self)
      return self._params
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "EluasticaParam"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  EluasticaParam = _class_0
end
return {
  EluasticaParam = EluasticaParam
}
