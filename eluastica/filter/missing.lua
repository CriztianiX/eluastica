local EluasticaAbstractFilter
do
  local _obj_0 = require("eluastica.filter.abstract_filter")
  EluasticaAbstractFilter = _obj_0.EluasticaAbstractFilter
end
local EluasticaFilterMissing
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    name = "missing",
    setField = function(self, field)
      return self:setParam('field', field)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, field)
      if field == nil then
        field = ''
      end
      _parent_0.__init(self)
      return self:setField(field)
    end,
    __base = _base_0,
    __name = "EluasticaFilterMissing",
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
  EluasticaFilterMissing = _class_0
end
return {
  EluasticaFilterMissing = EluasticaFilterMissing
}
