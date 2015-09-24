import EluasticaParam from require "eluastica.param"
import EluasticaTransportCreater from require "eluastica.transport.creater"

class EluasticaConnection extends EluasticaParam
  name: "connection"

  @DEFAULT_PORT = 9200
  @DEFAULT_HOST = 'localhost'
  @DEFAULT_TRANSPORT = 'Http'
  @TIMEOUT = 300

  @create: ( params = {} ) =>
    local connection

    if type(params) == "table"
      connection = EluasticaConnection(params)

    connection

  new: ( params = {} ) =>
    @setParams(params)
    @setEnabled(true)

    if not @hasParam('config')
      @setParam('config', {})

  getPort: =>
    return @hasParam('port') and @getParam('port') or EluasticaConnection.DEFAULT_PORT

  setPort: (port) =>
    return @setParam('port', tonumber(port))

  getHost: =>
    return @hasParam('host') and @getParam('host') or EluasticaConnection.DEFAULT_HOST

  setHost: (host) =>
    return @setParam('host', host)

  getTransport: =>
    return @hasParam('transport') and @getParam('transport') or EluasticaConnection.DEFAULT_TRANSPORT

  setTransport: (transport) =>
    return @setParam('transport', transport)

  getPath: =>
    return @hasParam('path') and @getParam('path') or ""

  setPath: (path) =>
    return @setParam('path', path)

  setEnabled: (enabled = true) =>
    return @setParam('enabled', enabled)

  isEnabled: =>
    return @getParam('enabled')

  getTransportObject: =>
    transport = @getTransport!
    return EluasticaTransportCreater.create(transport, @)

  hasConfig: (key) =>
    config = @getConfig!

    if config[key]
      return true

    return false

  getConfig: (key = '') =>
    config = @getParam('config')

    if key == nil or key == ''
      return config

    return config[key]

{ :EluasticaConnection }
