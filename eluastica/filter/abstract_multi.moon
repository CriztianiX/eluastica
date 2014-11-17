import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaAbstractMulti extends EluasticaAbstractFilter
  new: =>
    super!
  ---
  -- Filters
  -- @var array
  --
    @_filters = {}
  ---
  -- Add filter
  --
  -- @param  \Elastica\Filter\AbstractFilter      $filter
  -- @return \Elastica\Filter\AbstractMulti
  --
  addFilter: (filter) =>
    table.insert(@_filters, filter\toArray!)
  ---
  -- Set filters
  --
  -- @param  array                               $filters
  -- @return \Elastica\Filter\AbstractMulti
  --
  setFilters: (filters) =>
    @_filters = {}
    for _,filter in pairs(filters)
      @addFilter filter

    return true
  ---
  -- @return array Filters
  --
  getFilters: =>
    @_filters
  ---
  -- @see \Elastica\Param::toArray()
  --
  toArray: =>
    data = super\toArray!
    name = @_getBaseName!
    filterData = data[name]

    if filterData == nil 
      filterData = @_filters
    else
      filterData['filters'] = @_filters

    data[name] = filterData
    return data

{ :EluasticaAbstractMulti }