local EluasticaFilterExists
do
  local _obj_0 = require("eluastica.filter.exists")
  EluasticaFilterExists = _obj_0.EluasticaFilterExists
end
return describe("exists filter tests", function()
  local filter
  before_each(function()
    filter = EluasticaFilterExists("my_field")
  end)
  it("checking for constructor", function()
    local expected = {
      exists = {
        field = "my_field"
      }
    }
    return assert.are.same(filter:toArray(), expected)
  end)
  return it("checking for set_field", function()
    filter:setField('another_field')
    local expected = {
      exists = {
        field = "another_field"
      }
    }
    return assert.are.same(filter:toArray(), expected)
  end)
end)
