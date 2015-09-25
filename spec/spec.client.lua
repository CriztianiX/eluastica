local EluasticaClient = require("eluastica.client").EluasticaClient
return describe("client tests", function()
  return it("testing client", function()
    local client = EluasticaClient.new({
      connections = {
        {
          host = "127.0.0.1",
          port = 9200
        }
      }
    })

    local index = client:getIndex('default')
    local type = index:getType('discount')
    local path = index:getName() ..
      '/' .. type:getName() .. '/_search'

    local query = {
      query = { match_all = {} }

    }
    response = client:request(path, "GET", query)
    require("moon.all")
    p(response)
  end)
end)
