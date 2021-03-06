local EluasticaAbstractFilter
EluasticaAbstractFilter = require("eluastica.filter.abstract_filter").EluasticaAbstractFilter
local EluasticaFilterTerm
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    name = "term",
    setRawTerm = function(self, term)
      return self:setParams(term)
    end,
    setTerm = function(self, key, value)
      local t = { }
      t[key] = value
      return self:setRawTerm(t)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, term)
      if term == nil then
        term = { }
      end
      _parent_0.__init(self)
      return self:setRawTerm(term)
    end,
    __base = _base_0,
    __name = "EluasticaFilterTerm",
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
  EluasticaFilterTerm = _class_0
end
return {
  EluasticaFilterTerm = EluasticaFilterTerm
}
