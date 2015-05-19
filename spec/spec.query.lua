local EluasticaQuery
EluasticaQuery = require("eluastica.query").EluasticaQuery
return describe("query tests", function()
  return it("testing limit", function()
    local req_page = 5
    local req_limit = 10
    local query = EluasticaQuery()
    query:setLimit(req_limit)
    query:setPage(req_page)
    local expected = {
      query = {
        match_all = { }
      },
      from = 40,
      size = 10
    }
    return assert.are.same(query:toArray(), expected)
  end)
end)
