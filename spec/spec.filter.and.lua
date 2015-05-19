local EluasticaFilterAnd
EluasticaFilterAnd = require("eluastica.filter.and").EluasticaFilterAnd
local EluasticaFilterExists
EluasticaFilterExists = require("eluastica.filter.exists").EluasticaFilterExists
local EluasticaFilterTerms
EluasticaFilterTerms = require("eluastica.filter.terms").EluasticaFilterTerms
return describe("Testing filter: and", function()
  return it("runs", function()
    local filter_and = EluasticaFilterAnd()
    local filter_terms = EluasticaFilterTerms('terms_field', {
      "term",
      "another_term"
    })
    local filter_exists = EluasticaFilterExists('my_exists_field')
    filter_and:addFilter(filter_terms)
    filter_and:addFilter(filter_exists)
    local expected = {
      ["and"] = {
        filters = {
          {
            terms = {
              terms_field = {
                "term",
                "another_term"
              }
            }
          },
          {
            exists = {
              field = "my_exists_field"
            }
          }
        }
      }
    }
    return assert.are.same(filter_and:toArray(), expected)
  end)
end)
