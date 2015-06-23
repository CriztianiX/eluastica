import EluasticaAbstractQuery from require "eluastica.query.abstract_query"

class EluasticaQueryMatch extends EluasticaAbstractQuery
  name: "match"
  ZERO_TERM_NONE: 'none'
  ZERO_TERM_ALL: 'all'

  new: (field, values) =>
    super!

    if field and values
      @setParam field, values

  setField: (field, values) =>
    return @setParam field, values

  setFieldParam: (field, key, value) =>
    if not @_params[field]
      @_params[field] = {}

    @_params[field][key] = value
    return @

  setFieldType: (field, typee) =>
    return @setFieldParam(field, 'type', typee)

  setFieldOperator: (field, operator) =>
    return @setFieldParam field, 'operator', operator

{ :EluasticaQueryMatch }