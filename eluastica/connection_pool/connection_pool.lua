local class = require ('eluastica.class')
local ConnectionPool = class.ConnectionPool {
  initialize = function(self, connections, strategy)
    require("moon.all")
    p(connections)
    p(strategy)
  end
}

return {
  EluasticaConnectionPool = ConnectionPool
}
