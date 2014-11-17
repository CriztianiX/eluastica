import EluasticaAbstractQuery from require "eluastica.query.abstract_query"

class EluasticaQueryWildcard extends EluasticaAbstractQuery
  name: "wildcard"

  new: (key = nil, value = nil, boost = 1.0) =>
    super!
    if key ~= nil
      @setValue(key, value, boost)

  setValue: (key, value, boost = 1.0) =>
    @setParam(key, {value: value, boost: boost })


{ :EluasticaQueryWildcard }