local EluasticaAbstractQuery
do
  local _obj_0 = require("eluastica.query.abstract_query")
  EluasticaAbstractQuery = _obj_0.EluasticaAbstractQuery
end
local EluasticaQueryWildcard
do
  local _parent_0 = EluasticaAbstractQuery
  local _base_0 = {
    name = "wildcard",
    setValue = function(self, key, value, boost)
      if boost == nil then
        boost = 1.0
      end
      return self:setParam(key, {
        value = value,
        boost = boost
      })
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, key, value, boost)
      if key == nil then
        key = nil
      end
      if value == nil then
        value = nil
      end
      if boost == nil then
        boost = 1.0
      end
      _parent_0.__init(self)
      if key ~= nil then
        return self:setValue(key, value, boost)
      end
    end,
    __base = _base_0,
    __name = "EluasticaQueryWildcard",
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
  EluasticaQueryWildcard = _class_0
end
return {
  EluasticaQueryWildcard = EluasticaQueryWildcard
}
