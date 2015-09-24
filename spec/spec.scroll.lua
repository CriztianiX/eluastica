local EluasticaSearch = require("eluastica.search").EluasticaSearch
local EluasticaClient = require("eluastica.client").EluasticaClient
local EluasticaScroll = require("eluastica.scroll").EluasticaScroll

local get_client = function()
  return EluasticaClient.new({
    connections = {
      {
        host = "127.0.0.1",
        port = 9200
      }
    }
  })
end

local prepare_search = function()
  local client = get_client()
  local index = client:getIndex('twitter')
  local type = index:getType('tweet')

  local search = EluasticaSearch.new(client)
  search:addIndex(index)
  search:addType(type)
  search:getQuery():setSize(5)
  return search
end

return describe("search tests", function()
  return it("testing search", function()
    local search = prepare_search()
    local scroll = EluasticaScroll.new(search)
    while scroll:next() do
      print("seeeeeeeeeeeeeeeee")
    end
  end)
end)
