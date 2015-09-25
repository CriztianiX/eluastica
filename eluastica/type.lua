local class = require ('eluastica.class')
local EluasticaType = class.EluasticaType {
  initialize = function(self, index, name)
    self._index = index
    if type(name) ~= "string" then
      error("Index name should be a string type")
    end
    self._name = name
  end,
  getName = function(self)
    return self._name
  end
}
return {
  EluasticaType = EluasticaType
}
