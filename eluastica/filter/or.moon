import EluasticaAbstractMulti from require "eluastica.filter.abstract_multi"

class EluasticaFilterOr extends EluasticaAbstractMulti
  name: "or"
  ---
  -- @return string
  --
  _getBaseName: =>
      return 'or'
      
{ :EluasticaFilterOr }