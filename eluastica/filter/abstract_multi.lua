local EluasticaAbstractFilter
EluasticaAbstractFilter = require("eluastica.filter.abstract_filter").EluasticaAbstractFilter
local EluasticaAbstractMulti
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    addFilter = function(self, filter)
      return table.insert(self._filters, filter:toArray())
    end,
    setFilters = function(self, filters)
      self._filters = { }
      for _, filter in pairs(filters) do
        self:addFilter(filter)
      end
      return true
    end,
    getFilters = function(self)
      return self._filters
    end,
    toArray = function(self)
      local data = _parent_0.toArray(self)
      local name = self:_getBaseName()
      local filterData = data[name]
      if filterData == nil then
        filterData = self._filters
      else
        filterData['filters'] = self._filters
      end
      data[name] = filterData
      return data
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self)
      _parent_0.__init(self)
      self._filters = { }
    end,
    __base = _base_0,
    __name = "EluasticaAbstractMulti",
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
  EluasticaAbstractMulti = _class_0
end
return {
  EluasticaAbstractMulti = EluasticaAbstractMulti
}
