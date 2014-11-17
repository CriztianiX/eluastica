import EluasticaAbstractMulti from require "eluastica.filter.abstract_multi"

class EluasticaFilterAnd extends EluasticaAbstractMulti
  name: "and"
  ---
  -- @return string
  --
  _getBaseName: =>
      return 'and'
      
{ :EluasticaFilterAnd }