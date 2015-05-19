import EluasticaFilterRange from require "eluastica.filter.range"

describe "filter range tests", ->
  it "runs", ->
    filter = EluasticaFilterRange 'range_field', {gte: "value"}
    filter\setExecution('fielddata')

    expected = {
      range: {
        execution: "fielddata"
        range_field: {
          gte: "value"
        }
      }
    }

    assert.are.same expected, filter\toArray!
