local EluasticaFilterRange
EluasticaFilterRange = require("eluastica.filter.range").EluasticaFilterRange
return describe("filter range tests", function()
  return it("runs", function()
    local filter = EluasticaFilterRange('range_field', {
      gte = "value"
    })
    filter:setExecution('fielddata')
    local expected = {
      range = {
        execution = "fielddata",
        range_field = {
          gte = "value"
        }
      }
    }
    return assert.are.same(expected, filter:toArray())
  end)
end)
