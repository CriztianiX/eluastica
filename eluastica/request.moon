import EluasticaParam from require "eluastica.param"
import p from require "moon"
class EluasticaRequest extends EluasticaParam
  name: "request"

  @HEAD = 'HEAD'
  @POST = 'POST'
  @PUT = 'PUT'
  @GET = 'GET'
  @DELETE = 'DELETE'

  new: (path, method = EluasticaRequest.GET, data = {}, query = {}, connection = false) =>
    super!
    @_connection = false

    @setPath(path)
    @setMethod(method)
    @setData(data)
    @setQuery(query)
    if connection
      @setConnection(connection)

  setMethod: (method) =>
    @setParam('method', method)

  getMethod: =>
    @getParam 'method'

  setData: (data) =>
    @setParam('data', data)

  getData: =>
    @getParam('data')

  setPath: (path) =>
    @setParam('path', path)

  getPath: =>
    @getParam('path')

  getQuery: =>
    @getParam('query')

  setQuery: ( query = {}) =>
    @setParam('query', query)

  setConnection: (connection) =>
    @_connection = connection
    return @

  getConnection: =>
    return @_connection

  send: =>
    transport = @getConnection()\getTransportObject!
    return transport\exec(@, @getConnection()\toArray())

{ :EluasticaRequest }