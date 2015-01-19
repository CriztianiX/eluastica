import EluasticaParam from require "eluastica.param"
import p from require "moon"

class EluasticaAbstractTransport extends EluasticaParam
  new: ( connection = false ) =>
    @_connection = false
    
    if connection
      @setConnection connection

  setConnection: (connection) =>
    @_connection = connection

{ :EluasticaAbstractTransport }