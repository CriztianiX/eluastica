import EluasticaParam from require "eluastica.param"

class EluasticaAbstractTransport extends EluasticaParam
  new: ( connection = false ) =>
    @_connection = false
    
    if connection
      @setConnection connection

  setConnection: (connection) =>
    @_connection = connection

  getConnection: =>
    @_connection

{ :EluasticaAbstractTransport }