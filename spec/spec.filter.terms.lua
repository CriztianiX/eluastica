local EluasticaFilterTerms
EluasticaFilterTerms = require("eluastica.filter.terms").EluasticaFilterTerms
return describe("filter terms tests", function()
  return it("runs", function()
    local filter = EluasticaFilterTerms('terms_field', {
      "termino1",
      "termino2"
    })
    filter:addTerm("termino3")
    filter:setParam("execution", "or")
    local expected = {
      terms = {
        terms_field = {
          "termino1",
          "termino2",
          "termino3"
        },
        execution = "or"
      }
    }
    return assert.are.same(filter:toArray(), expected)
  end)
end)
