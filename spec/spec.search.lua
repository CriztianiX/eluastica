local EluasticaSearch = require("eluastica.search").EluasticaSearch
local EluasticaClient = require("eluastica.client").EluasticaClient

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

return describe("search tests", function()
  return it("testing search", function()
    local client = get_client()
    local index = client:getIndex('default')
    local type = index:getType('discount')

    local search = EluasticaSearch.new(client)
    search:addIndex(index)
    search:addType(type)
    search:getQuery():setSize(5)
    return search
  end)
end)
