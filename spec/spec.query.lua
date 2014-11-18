local EluasticaQuery
do
  local _obj_0 = require("eluastica.query")
  EluasticaQuery = _obj_0.EluasticaQuery
end
return describe("query tests", function()
  return it("testing limit", function()
    local req_page = 5
    local req_limit = 10
    local query = EluasticaQuery()
    query:setLimit(req_limit)
    local page = req_page - 1
    if page > 0 then
      local skip = page * req_limit
      query:setFrom(skip)
    end
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
