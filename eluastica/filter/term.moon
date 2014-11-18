import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaFilterTerm extends EluasticaAbstractFilter
  name: "term"

  new: (term = {}) =>
    super!
    @setRawTerm(term)

  setRawTerm: (term) => 
    @setParams(term)

  setTerm: (key, value) =>
    t = {}
    t[key] = value
    @setRawTerm t

{ :EluasticaFilterTerm }