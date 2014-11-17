import EluasticaFilterExists from require "eluastica.filter.exists"

describe "exists filter tests", ->
  local filter

  before_each ->
    filter = EluasticaFilterExists "my_field"

  it "checking for constructor", ->
    expected = {
      exists: {
        field: "my_field"
      }
    }

    assert.are.same filter\toArray!, expected
  it "checking for set_field", ->
    filter\setField 'another_field'

    expected = {
      exists: {
        field: "another_field"
      }
    }

    assert.are.same filter\toArray!, expected