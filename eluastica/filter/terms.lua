local EluasticaAbstractFilter
EluasticaAbstractFilter = require("eluastica.filter.abstract_filter").EluasticaAbstractFilter
local EluasticaFilterTerms
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    name = "terms",
    setTerms = function(self, key, terms)
      self._key = key
      local values = { }
      for _, val in pairs(terms) do
        table.insert(values, val)
      end
      self._terms = values
      return true
    end,
    addTerm = function(self, term)
      table.insert(self._terms, term)
      return true
    end,
    toArray = function(self)
      self._params[self._key] = self._terms
      return {
        terms = self._params
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, key, terms)
      if key == nil then
        key = ''
      end
      if terms == nil then
        terms = { }
      end
      _parent_0.__init(self)
      self._terms = { }
      self._params = { }
      self._key = ''
      return self:setTerms(key, terms)
    end,
    __base = _base_0,
    __name = "EluasticaFilterTerms",
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
  EluasticaFilterTerms = _class_0
end
return {
  EluasticaFilterTerms = EluasticaFilterTerms
}
