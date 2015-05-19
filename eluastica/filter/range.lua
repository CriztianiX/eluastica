local EluasticaAbstractFilter
EluasticaAbstractFilter = require("eluastica.filter.abstract_filter").EluasticaAbstractFilter
local util = require("eluastica.util")
local EluasticaFilterRange
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    name = "range",
    addField = function(self, fieldName, args)
      self._fields[fieldName] = args
      return self
    end,
    setExecution = function(self, execution)
      return self:setParam('execution', execution)
    end,
    toArray = function(self)
      local merged = util.array_merge(self:getParams(), self._fields)
      self:setParams(merged)
      return _parent_0.toArray(self)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, field, args)
      if field == nil then
        field = ''
      end
      if args == nil then
        args = { }
      end
      _parent_0.__init(self)
      self._fields = { }
      if field then
        return self:addField(field, args)
      end
    end,
    __base = _base_0,
    __name = "EluasticaFilterRange",
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
  EluasticaFilterRange = _class_0
end
return {
  EluasticaFilterRange = EluasticaFilterRange
}
