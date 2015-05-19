import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"
util = require "eluastica.util"

class EluasticaFilterRange extends EluasticaAbstractFilter
  name: "range"

  new: (field = '', args = {}) =>
    super!
    @_fields = {}
    if field
      @addField(field, args)

  addField: (fieldName, args) =>
    @_fields[fieldName] = args
    return @

  setExecution: (execution) =>
    @setParam('execution', execution)

  toArray: =>
    merged = util.array_merge(@getParams!, @_fields)
    @setParams(merged)
    return super\toArray!

{ :EluasticaFilterRange }
