local EluasticaAbstractFilter
do
  local _obj_0 = require("eluastica.filter.abstract_filter")
  EluasticaAbstractFilter = _obj_0.EluasticaAbstractFilter
end
local EluasticaFilterNested
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    name = "nested",
    setPath = function(self, path)
      return self:setParam('path', path)
    end,
    setQuery = function(self, query)
      return self:setParam('query', query:toArray())
    end,
    setFilter = function(self, filter)
      return self:setParam('filter', filter:toArray())
    end,
    setScoreMode = function(self, scoreMode)
      return self:setParam('score_mode', scoreMode)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self)
      return _parent_0.__init(self)
    end,
    __base = _base_0,
    __name = "EluasticaFilterNested",
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
  EluasticaFilterNested = _class_0
end
return {
  EluasticaFilterNested = EluasticaFilterNested
}
