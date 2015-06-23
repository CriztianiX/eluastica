local EluasticaAbstractQuery
EluasticaAbstractQuery = require("eluastica.query.abstract_query").EluasticaAbstractQuery
local EluasticaQueryMatch
do
  local _parent_0 = EluasticaAbstractQuery
  local _base_0 = {
    name = "match",
    ZERO_TERM_NONE = 'none',
    ZERO_TERM_ALL = 'all',
    setField = function(self, field, values)
      return self:setParam(field, values)
    end,
    setFieldParam = function(self, field, key, value)
      if not self._params[field] then
        self._params[field] = { }
      end
      self._params[field][key] = value
      return self
    end,
    setFieldType = function(self, field, typee)
      return self:setFieldParam(field, 'type', typee)
    end,
    setFieldOperator = function(self, field, operator)
      return self:setFieldParam(field, 'operator', operator)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, field, values)
      _parent_0.__init(self)
      if field and values then
        return self:setParam(field, values)
      end
    end,
    __base = _base_0,
    __name = "EluasticaQueryMatch",
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
  EluasticaQueryMatch = _class_0
end
return {
  EluasticaQueryMatch = EluasticaQueryMatch
}
