local class = require ('eluastica.class')
local ConnectionPool = class.ConnectionPool {
  initialize = function(self, connections, strategy, callback)
    self._connections = connections
    self._strategy = strategy
    self._callback = callback
  end,
  getConnections = function(self)
    return self._connections
  end,
  getConnection = function(self)
    return self._strategy:getConnection(self:getConnections())
  end
}
return {
  EluasticaConnectionPool = ConnectionPool
}
