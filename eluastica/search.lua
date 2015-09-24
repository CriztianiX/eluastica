local class = require ('eluastica.class')

local OPTION_SEARCH_TYPE = 'search_type'
local OPTION_ROUTING = 'routing'
local OPTION_PREFERENCE = 'preference'
local OPTION_VERSION = 'version'
local OPTION_TIMEOUT = 'timeout'
local OPTION_FROM = 'from'
local OPTION_SIZE = 'size'
local OPTION_SCROLL = 'scroll'
local OPTION_SCROLL_ID = 'scroll_id'
local OPTION_QUERY_CACHE = 'query_cache'

local OPTION_SEARCH_TYPE_COUNT = 'count'
local OPTION_SEARCH_TYPE_SCAN = 'scan'
local OPTION_SEARCH_TYPE_DFS_QUERY_THEN_FETCH = 'dfs_query_then_fetch'
local OPTION_SEARCH_TYPE_DFS_QUERY_AND_FETCH = 'dfs_query_and_fetch'
local OPTION_SEARCH_TYPE_QUERY_THEN_FETCH = 'query_then_fetch'
local OPTION_SEARCH_TYPE_QUERY_AND_FETCH = 'query_and_fetch'
local OPTION_SEARCH_TYPE_SUGGEST = 'suggest'
local OPTION_SEARCH_TYPE_SCROLL = 'scroll'
local OPTION_SEARCH_IGNORE_UNAVAILABLE = 'ignore_unavailable'

return class.Search {
  initialize = function (self, client)
    self._client = client
    self._indices = {}
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
  end
}
