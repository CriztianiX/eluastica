import EluasticaFilterTerms from require "eluastica.filter.terms"

describe "filter terms tests", ->
  it "runs", ->
    filter = EluasticaFilterTerms 'terms_field', {"termino1","termino2"}
    filter\addTerm "termino3"
    filter\setParam "execution", "or" 
    
    expected = {
      terms: {
        terms_field: {
          "termino1","termino2","termino3"
        },
        execution: "or"
      }
    }

    assert.are.same filter\toArray!, expected