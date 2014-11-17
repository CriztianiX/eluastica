import EluasticaFilterAnd from require "eluastica.filter.and"
import EluasticaFilterExists from require "eluastica.filter.exists"
import EluasticaFilterTerms from require "eluastica.filter.terms"

describe "Testing filter: and", ->
  it "runs", ->

    filter_and = EluasticaFilterAnd!
    filter_terms = EluasticaFilterTerms 'terms_field', { "term","another_term" }
    filter_exists = EluasticaFilterExists 'my_exists_field'

    filter_and\addFilter filter_terms
    filter_and\addFilter filter_exists

    expected = {
      and: {
        filters: {
          {
            terms: {
              terms_field: {
                "term"
                "another_term"
              }
            }
          },
          {
            exists: {
              field: "my_exists_field"
            }
          }
        }
      }
    }

    assert.are.same filter_and\toArray!, expected