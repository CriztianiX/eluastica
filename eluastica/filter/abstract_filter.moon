import EluasticaParam from require "eluastica.param"
class EluasticaAbstractFilter extends EluasticaParam
  ---
  -- Sets the filter name
  --
  -- @param  string  $name Name
  -- @return AbstractFilter
  --
  setName: (name) =>
    return @setParam('_name', name)


{ :EluasticaAbstractFilter }