local EluasticaAbstractQuery
EluasticaAbstractQuery = require("eluastica.query.abstract_query").EluasticaAbstractQuery
local EluasticaAbstractFilter
EluasticaAbstractFilter = require("eluastica.filter.abstract_filter").EluasticaAbstractFilter
local EluasticaQueryIds
do
  local _parent_0 = EluasticaAbstractQuery
  local _base_0 = {
    name = "ids",
    setType = function(self, typed)
      self._params['type'] = typed
      return self
    end,
    setIds = function(self, ids)
      if (type(ids) == "table") then
        self._params['values'] = ids
      else
        self._params['values'] = {
          ids
        }
      end
      return self
    end,
    toArray = function(self)
      return {
        ids = self._params
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, typed, ids)
      if typed == nil then
        typed = nil
      end
      if ids == nil then
        ids = nil
      end
      _parent_0.__init(self)
      self:setType(typed)
      return self:setIds(ids)
    end,
    __base = _base_0,
    __name = "EluasticaQueryIds",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  EluasticaQueryIds = _class_0
end
return {
  EluasticaQueryIds = EluasticaQueryIds
}
