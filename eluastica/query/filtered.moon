import EluasticaAbstractQuery from require "eluastica.query.abstract_query"
import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaQueryFiltered extends EluasticaAbstractQuery
  name: "filtered"
  
  new: (query = nil, filter = nil) =>
    super!
    @setQuery(query)
    @setFilter(filter)

  setQuery: (query = nil) =>
    return @setParam('query', query)

  setFilter: (filter = nil) =>
    @setParam('filter', filter)

  getFilter: =>
    return @getParam('filter')
 
  getQuery: =>
    return @getParam('query')
  
  toArray: =>
    filtered = {}
    if @hasParam('query') and @getParam('query')
      filtered['query'] = @getParam('query')\toArray!
    if @hasParam('filter') and @getParam('filter')
      filtered['filter'] = @getParam('filter')\toArray!
    
    if next(filtered) == nil 
      error('A query and/or filter is required')
        
    return { filtered: filtered }


{ :EluasticaQueryFiltered }