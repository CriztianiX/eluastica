local class = require ('eluastica.class')
local ConnectionPool = class.ConnectionPool {
  initialize = function(self, connections, strategy, callback)
    require("moon.all")
    self._connections = connections
    self._strategy = strategy
    self._callback = callback
    --p(connections)
    --p(strategy)
  end,
  addConnection = function(self, connection)
    table.insert(self._connections, connection)
    return self
  end,
  setConnections = function(self, connections)
    self._connections = connections
    return self
  end,
  hasConnection = function(self)
    for _,connection in pairs(self._connections) do
      if connection:isEnabled() then
        return true;
      end
    end

    return false;
  end,
  getConnections = function(self)
    return self._connections
  end,
  getConnection = function(self)
    return self._strategy:getConnection(self:getConnections())
  end,
  getStrategy = function(self)
    return self._strategy
  end
}

return {
  EluasticaConnectionPool = ConnectionPool
}
