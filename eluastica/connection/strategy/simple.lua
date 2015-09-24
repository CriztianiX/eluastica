local class = require ('eluastica.class')
return class.Simple {
  getConnection = function(self, connections)
    for _, connection in paira(connections) do
      if connection:isEnabled() then
        return connection
      end

      error('No enabled connection');
    end
  end

}
