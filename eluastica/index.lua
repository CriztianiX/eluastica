local class = require ('eluastica.class')
local EluasticaType = require("eluastica.type").EluasticaType
local EluasticaIndex = class.EluasticaIndex {
  initialize = function(self, client, name)
    self._client = client
    if type(name) ~= "string" then
      error("Index name should be a string type")
    end
    self._name = name
  end,
  getType = function(self, name)
    return EluasticaType.new(self, name)
  end,
  getName = function(self)
    return self._name
  end
}
return {
  EluasticaIndex = EluasticaIndex
}
