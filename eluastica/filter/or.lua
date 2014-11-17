local EluasticaAbstractMulti
do
  local _obj_0 = require("eluastica.filter.abstract_multi")
  EluasticaAbstractMulti = _obj_0.EluasticaAbstractMulti
end
local EluasticaFilterOr
do
  local _parent_0 = EluasticaAbstractMulti
  local _base_0 = {
    name = "or",
    _getBaseName = function(self)
      return 'or'
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "EluasticaFilterOr",
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
  EluasticaFilterOr = _class_0
end
return {
  EluasticaFilterOr = EluasticaFilterOr
}
