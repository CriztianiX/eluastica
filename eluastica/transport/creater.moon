import EluasticaTransportHttp from require "eluastica.transport.http"

class EluasticaTransportCreater
  @create: (transport, connection, params = {} ) ->
    cnt = false

    if type(transport) == "string"
      if transport == 'Http'
        transport = EluasticaTransportHttp!
        cnt = true

    if cnt
      transport\setConnection(connection)
      for key,value in ipairs(params)
        transport\setParam(key, value)

    return transport

{ :EluasticaTransportCreater }