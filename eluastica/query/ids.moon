import EluasticaAbstractQuery from require "eluastica.query.abstract_query"
import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaQueryIds extends EluasticaAbstractQuery
  name: "ids"

  new: (typed = nil, ids = nil) =>
    super!
    @setType typed
    @setIds ids

  setType: (typed) =>
    @_params['type'] = typed
    return @

  setIds: (ids) =>
    if (type(ids) == "table")
      @_params['values'] = ids
    else
      @_params['values'] = { ids }
    return @

  toArray: =>
    return { ids: @_params }

{ :EluasticaQueryIds }
