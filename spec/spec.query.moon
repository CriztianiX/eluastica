import EluasticaQuery from require "eluastica.query"

describe "query tests", ->
  it "testing limit", ->
    req_page = 5
    req_limit = 10

    query = EluasticaQuery!
    query\setLimit req_limit
    query\setPage req_page

    expected = {
      query: {
        match_all: {}
      }
      from: 40
      size: 10
    }

    assert.are.same query\toArray!, expected