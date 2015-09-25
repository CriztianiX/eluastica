local class = require ('eluastica.class')
local moses = require "eluastica.moses"
local EluasticaConnection = require ('eluastica.connection').EluasticaConnection
local EluasticaConnectionPool = require ('eluastica.connection.connection_pool').EluasticaConnectionPool
local EluasticaConnectionStrategyFactory = require "eluastica.connection.strategy.factory"
local EluasticaIndex = require("eluastica.index").EluasticaIndex
local EluasticaRequest = require("eluastica.request").EluasticaRequest

local EluasticaClient = class.EluasticaClient {
  initialize = function(self, config)
    self._config = {}
    self:setConfig(config)
    self:initConnections()
  end,
  getConnection = function(self)
    return self._connectionPool:getConnection()
  end,
  request = function(self, path, method, data, query)
    local connection = self:getConnection()
    local request = EluasticaRequest(path, method, data, query, connection)
    local response = request:send()
    return response
  end,
  getIndex = function(self, name)
    return EluasticaIndex.new(self, name)
  end,
  initConnections = function(self)
    local connections = {}
    for _, connection in ipairs(self:getConfig('connections')) do
      local conn = EluasticaConnection:create(self:prepareConnectionParams(connection))
      table.insert(connections, conn)
    end

    if self._config['servers'] then
      for _, server in paris(self:getConfig('servers')) do
        local conn = EluasticaConnection:create(self:prepareConnectionParams(server))
        table.insert(connections, conn)
      end
    end

    if moses.size(connections) == 0 then
      local conn = EluasticaConnection:create(self:prepareConnectionParams(self:getConfig()))
      table.insert(connections, conn)
    end

    -- TODO
    -- Implements connections strategy
    self:setConfigValue('connectionStrategy', 'Simple')
    local strategy = EluasticaConnectionStrategyFactory.create(self:getConfig('connectionStrategy'));

    self._connectionPool = EluasticaConnectionPool.new(connections, strategy)
  end,
  setConfig = function (self, config)
    for key, value in pairs(config) do
      self._config[key] = value
    end
    return self
  end,
  getConfig = function(self, key)
    if not key then
      return self._config
    end

    if not self._config[key] then
      error('Config key is not set: ' .. key)
    end

    return self._config[key]
  end,
  setConfigValue = function(self, key, value)
    return self:setConfig({
      [key] = value
    });
  end,
  prepareConnectionParams = function(self, config)
    local params = {
      ["config"] = {}
    }

    for key, value in pairs(config) do
      if ({curl=1, headers=1, url=1})[key] then
        params['config'][key] = value
      else
        params[key] = value
      end
    end

    return params
  end
}

return {
  EluasticaClient = EluasticaClient
}
