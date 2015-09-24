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
    require("moon.all")

    p(client:getConfig())
    --p(client)
  end)
end)
