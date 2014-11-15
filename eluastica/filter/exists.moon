import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaFilterExists extends EluasticaAbstractFilter
  name: "exists"
  
  new: (field) =>
    @setField(field)

  setField: (field) =>
    @setParam('field', field)

{ :EluasticaFilterExists }