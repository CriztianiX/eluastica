import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaFilterNested extends EluasticaAbstractFilter
  name: "nested"

  new: () =>
    super!
 
  setPath: (path) =>
    return @setParam('path', path)

  setQuery: (query) =>
    return @setParam('query', query\toArray!)

  setFilter: (filter) =>
    return @setParam('filter', filter\toArray!)

  setScoreMode: (scoreMode) =>
    return @setParam('score_mode', scoreMode)

{ :EluasticaFilterNested }