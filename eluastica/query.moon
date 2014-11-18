import EluasticaParam from require "eluastica.param"
import EluasticaQueryMatchAll from require "eluastica.query.match_all"

class EluasticaQuery extends EluasticaParam
  name: "query"

  new: (query = nil) =>
    super!
    @_params = {}
    @_suggest = 0
    @_limit

    if type(query) == "table"
      @setRawQuery(query)

  setRawQuery: (query) =>
    @_params = query
    return true

  setQuery: (query) =>
    return @setParam('query', query\toArray!)

  getQuery: =>
    return @getParam('query')

  setPage: (page = 1 ) =>
    page = page-1
    if page > 0
      req_limit = @getSize! or 10
      skip = page * req_limit
      return query\setFrom skip

  setFrom: (ffrom) =>
    return @setParam('from', ffrom)

  setSort: (sortArgs) =>
    return @setParam('sort', sortArgs)

  setSize: (size = 10) =>
    return @setParam('size', size)

  getSize: => @getParam('size')

  setLimit: (limit = 10) =>
    return @setSize(limit)

  setFields: (fields) =>
    return @setParam('fields', fields)

  toArray: =>
    if @_params['query'] == nil and @_suggest == 0
      @setQuery EluasticaQueryMatchAll!
    --if (isset(@_params['facets']) && 0 === count(@_params['facets'])) {
    --    unset(@_params['facets']);
    --}
    --if (isset(@_params['post_filter']) && 0 === count(@_params['post_filter'])) {
    --    unset(@_params['post_filter']);
    --}

    return @_params


{ :EluasticaQuery }