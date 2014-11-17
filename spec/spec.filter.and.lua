local EluasticaFilterAnd
do
  local _obj_0 = require("eluastica.filter.and")
  EluasticaFilterAnd = _obj_0.EluasticaFilterAnd
end
local EluasticaFilterExists
do
  local _obj_0 = require("eluastica.filter.exists")
  EluasticaFilterExists = _obj_0.EluasticaFilterExists
end
local EluasticaFilterTerms
do
  local _obj_0 = require("eluastica.filter.terms")
  EluasticaFilterTerms = _obj_0.EluasticaFilterTerms
end
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
