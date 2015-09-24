local class = require ('eluastica.class')
local EluasticaQuery = require ('eluastica.query').EluasticaQuery

local EluasticaSearch = class.EluasticaSearch {
  OPTION_SEARCH_TYPE = 'search_type',
  OPTION_ROUTING = 'routing',
  OPTION_PREFERENCE = 'preference',
  OPTION_VERSION = 'version',
  OPTION_TIMEOUT = 'timeout',
  OPTION_FROM = 'from',
  OPTION_SIZE = 'size',
  OPTION_SCROLL = 'scroll',
  OPTION_SCROLL_ID = 'scroll_id',
  OPTION_QUERY_CACHE = 'query_cache',
  OPTION_SEARCH_TYPE_COUNT = 'count',
  OPTION_SEARCH_TYPE_SCAN = 'scan',
  OPTION_SEARCH_TYPE_DFS_QUERY_THEN_FETCH = 'dfs_query_then_fetch',
  OPTION_SEARCH_TYPE_DFS_QUERY_AND_FETCH = 'dfs_query_and_fetch',
  OPTION_SEARCH_TYPE_QUERY_THEN_FETCH = 'query_then_fetch',
  OPTION_SEARCH_TYPE_QUERY_AND_FETCH = 'query_and_fetch',
  OPTION_SEARCH_TYPE_SUGGEST = 'suggest',
  OPTION_SEARCH_TYPE_SCROLL = 'scroll',
  OPTION_SEARCH_IGNORE_UNAVAILABLE = 'ignore_unavailable',
  initialize = function (self, client)
    self._client = client
    self._indices = {}
    self._types = {}
    self._options = {}
    self._query = false
	end,
  addIndex = function(self, index)
    if index then
      index = index:getName()
    end

    table.insert(self._indices, tostring(index))
    return self
  end,
  addIndices = function(self, indices)
    for _,index in pairs(indices) do
      self:addIndex(index);
    end
    return self
  end,
  addType = function(self, typed)
    if typed:is_a("EluasticaType") then
      typed = typed:getName()
    end

    if type(typed) ~= "string" then
      error('Invalid type type')
    end

    table.insert(self._types, typed)
    return self
  end,
  getQuery = function(self)
    if not self._query then
      self._query = EluasticaQuery:create()
    end
    return self._query
  end,
  hasOption = function(self, key)
    if self._options[key] then
      return true
    end

    return false
  end,
  setOption = function(self, key, value)
    --self:_validateOption($key)
    self._options[key] = value
    return self
  end,
  getIndices = function(self)
    return self._indices
  end,
  getTypes = function(self)
    return self._types
  end,
  getOption = function(self, key)
    if not self:hasOption(key) then
      error('Option '.. key ..' does not exist')
    end
    return self._options[key]
  end,
  getPath = function(self)
    if self._options[self.OPTION_SCROLL_ID] then
      return "_search/scroll"
    end
    local indices = self:getIndices()
    local path = ""
    local types = self:getTypes()
    if next(indices) == nil then
      if next(types) ~= nil then
        path = path .. '_all'
      end
    else
      path = path .. table.concat(indices, ",")
    end

    if next(types) ~= nil then
      path = path .. '/' .. table.concat(types, ",")
    end
    return path .. '/_search'
  end,
  getOptions = function(self)
    return self._options
  end,
  getClient = function(self)
    return self._client
  end,
  setOptionsAndQuery = function(self, options, query)
    if not query then query = "" end
    if "" ~= query then
      self:setQuery(query)
    end

    if type(options) == "number" then
      self:getQuery():setSize(options)
    elseif type(options) == "table" then
      if options.limit then
        self:getQuery():setSize(options.limit)
        options.limit = nil
      end
      if options.explain  then
        self:getQuery():setExplain(options.explain)
        options.explain = nil
      end
      self:setOptions(options)
    end

    return self
  end,
  search = function(self, query, options)
    require("moon.all")
    self:setOptionsAndQuery(options, query)

    if not query then
      query = ""
    end

    query = self:getQuery()
    local path = self:getPath()
    p("PATH")
    p(path)
    p("=================")

    local params = self:getOptions()
    p("PARAMS")
    p(params)
    p("=================")

    local data
    if '_search/scroll' == path then
      data = params[self.OPTION_SCROLL_ID]
      params[self.OPTION_SCROLL_ID] = nil
    else
      data = query:toArray()
    end

    p("DATA")
    p(data)
    p("=================")

    local response = self:getClient():request(path,"GET",data ,params)
    p(response)

  end
}
return {
  EluasticaSearch = EluasticaSearch
}
