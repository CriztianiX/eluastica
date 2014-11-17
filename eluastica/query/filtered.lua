local EluasticaAbstractQuery
do
  local _obj_0 = require("eluastica.query.abstract_query")
  EluasticaAbstractQuery = _obj_0.EluasticaAbstractQuery
end
local EluasticaAbstractFilter
do
  local _obj_0 = require("eluastica.filter.abstract_filter")
  EluasticaAbstractFilter = _obj_0.EluasticaAbstractFilter
end
local EluasticaQueryFiltered
do
  local _parent_0 = EluasticaAbstractQuery
  local _base_0 = {
    name = "filtered",
    setQuery = function(self, query)
      if query == nil then
        query = nil
      end
      return self:setParam('query', query)
    end,
    setFilter = function(self, filter)
      if filter == nil then
        filter = nil
      end
      return self:setParam('filter', filter)
    end,
    getFilter = function(self)
      return self:getParam('filter')
    end,
    getQuery = function(self)
      return self:getParam('query')
    end,
    toArray = function(self)
      local filtered = { }
      if self:hasParam('query') and self:getParam('query') then
        filtered['query'] = self:getParam('query'):toArray()
      end
      if self:hasParam('filter') and self:getParam('filter') then
        filtered['filter'] = self:getParam('filter'):toArray()
      end
      if next(filtered) == nil then
        error('A query and/or filter is required')
      end
      return {
        filtered = filtered
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, query, filter)
      if query == nil then
        query = nil
      end
      if filter == nil then
        filter = nil
      end
      _parent_0.__init(self)
      self:setQuery(query)
      return self:setFilter(filter)
    end,
    __base = _base_0,
    __name = "EluasticaQueryFiltered",
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
  EluasticaQueryFiltered = _class_0
end
return {
  EluasticaQueryFiltered = EluasticaQueryFiltered
}
