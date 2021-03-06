local EluasticaParam
EluasticaParam = require("eluastica.param").EluasticaParam
local EluasticaQueryMatchAll
EluasticaQueryMatchAll = require("eluastica.query.match_all").EluasticaQueryMatchAll
local EluasticaQuery
do
  local _parent_0 = EluasticaParam
  local _base_0 = {
    name = "query",
    setRawQuery = function(self, query)
      self._params = query
      return true
    end,
    setQuery = function(self, query)
      return self:setParam('query', query:toArray())
    end,
    getQuery = function(self)
      return self:getParam('query')
    end,
    setPage = function(self, page)
      if page == nil then
        page = 1
      end
      page = page - 1
      if page > 0 then
        local req_limit = self:getSize() or 10
        local skip = page * req_limit
        return self:setFrom(skip)
      end
    end,
    setFrom = function(self, ffrom)
      return self:setParam('from', ffrom)
    end,
    setSort = function(self, sortArgs)
      return self:setParam('sort', sortArgs)
    end,
    setSize = function(self, size)
      if size == nil then
        size = 10
      end
      size = tonumber(size)
      return self:setParam('size', size)
    end,
    getSize = function(self)
      return self:getParam('size')
    end,
    setLimit = function(self, limit)
      if limit == nil then
        limit = 10
      end
      return self:setSize(limit)
    end,
    setFields = function(self, fields)
      return self:setParam('fields', fields)
    end,
    setSource = function(self, fields)
      return self:setParam('_source', fields)
    end,
    toArray = function(self)
      if self._params['query'] == nil and self._suggest == 0 then
        self:setQuery(EluasticaQueryMatchAll())
      end
      return self._params
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, query)
      if query == nil then
        query = nil
      end
      _parent_0.__init(self)
      self._params = { }
      self._suggest = 0
      local _ = self._limit
      if type(query) == "table" then
        return self:setRawQuery(query)
      end
    end,
    __base = _base_0,
    __name = "EluasticaQuery",
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
  EluasticaQuery = _class_0
end
return {
  EluasticaQuery = EluasticaQuery
}
