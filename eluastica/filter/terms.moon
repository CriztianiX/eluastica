import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaFilterTerms extends EluasticaAbstractFilter
  name: "terms"
  ---
  -- Creates terms filter
  --
  -- @param string $key   Terms key
  -- @param array  $terms Terms values
  --
  new: (key = '', terms = {}) =>
    super!
    ---
    -- Terms
    --
    -- @var array Terms
    --
    @_terms = {}
    ---
    -- Params
    --
    -- @var array Params
    --
    @_params = {}
    ---
    -- Terms key
    --
    -- @var string Terms key
    --
    @_key = ''

    @setTerms(key, terms)

  ---
  -- Sets key and terms for the filter
  --
  -- @param  string                      $key   Terms key
  -- @param  array                       $terms Terms for the query.
  -- @return \Elastica\Filter\Terms
  --
  setTerms: (key, terms) =>
    @_key = key

    values = {}
    for _, val in pairs(terms)
      table.insert(values, val)

    @_terms = values
    return true

  ---
  -- Adds an additional term to the query
  --
  -- @param  string                      $term Filter term
  -- @return \Elastica\Filter\Terms Filter object
  --
  addTerm: (term) =>
    table.insert(@_terms, term)
    return true

  ---
  -- Converts object to an array
  --
  -- @see \Elastica\Filter\AbstractFilter::toArray()
  -- @throws \Elastica\Exception\InvalidException
  -- @return array                               data array
  --
  toArray: =>
   --     if (empty($this->_key)) {
   --         throw new InvalidException('Terms key has to be set');
    --    }
    @_params[@_key] = @_terms
    return { terms: @_params }

{ :EluasticaFilterTerms }