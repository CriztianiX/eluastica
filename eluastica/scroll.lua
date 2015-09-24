local class = require ('eluastica.class')
local EluasticaSearch = require "eluastica.search".EluasticaSearch

local EluasticaScroll =  class.EluasticaScroll {
  initialize = function(self, search, expiryTime)
    if not expiryTime then expiryTime = "1m" end
    self._search = search
    self.expiryTime = expiryTime
    self._nextScrollId = false
    self._currentResultSet = false
    self._options = { false, false, false }

    self._current = 1
  end,
  next = function(self)
    self:_saveOptions()

    self._search:setOption(EluasticaSearch.OPTION_SCROLL, self.expiryTime)
    self._search:setOption(EluasticaSearch.OPTION_SCROLL_ID, self._nextScrollId)
    self._search:setOption(EluasticaSearch.OPTION_SEARCH_TYPE, EluasticaSearch.OPTION_SEARCH_TYPE_SCROLL)
    local s = self._search:search()
    self:_setScrollId(s)

    if self._current == 1 then
      self._current = 2
      return true
    end

    return false
  end,
  _setScrollId = function(self, resultSet)
    self._currentResultSet = resultSet
    self._nextScrollId = null
    if resultSet:getResponse():isOk() then
      self._nextScrollId = resultSet:getResponse():getScrollId()
    end
  end,
  _saveOptions = function(self)
    if self._search:hasOption(EluasticaSearch.OPTION_SCROLL) then
      self._options[1] = self._search:getOption(EluasticaSearch.OPTION_SCROLL)
    end
    if self._search:hasOption(EluasticaSearch.OPTION_SCROLL_ID) then
      self._options[2] = self._search:getOption(EluasticaSearch.OPTION_SCROLL_ID)
    end
    if self._search:hasOption(EluasticaSearch.OPTION_SEARCH_TYPE) then
      self._options[3] = self._search:getOption(EluasticaSearch.OPTION_SEARCH_TYPE)
    end
  end
}

return {
  EluasticaScroll = EluasticaScroll
}
