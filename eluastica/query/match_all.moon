import EluasticaAbstractQuery from require "eluastica.query.abstract_query"

class EluasticaQueryMatchAll extends EluasticaAbstractQuery
  name: "match_all"

  new: () =>
    super!
    @_params = {}


{ :EluasticaQueryMatchAll }