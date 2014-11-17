import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaFilterMissing extends EluasticaAbstractFilter
  name: "missing"
  
  new: (field = '') =>
    super!
    @setField(field)

  setField: (field) =>
    @setParam('field', field)

{ :EluasticaFilterMissing }