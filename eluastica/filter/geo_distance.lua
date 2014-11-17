local EluasticaAbstractGeo
do
  local _obj_0 = require("eluastica.filter.abstract_geo")
  EluasticaAbstractGeo = _obj_0.EluasticaAbstractGeo
end
local EluasticaFilterGeoDistance
do
  local _parent_0 = EluasticaAbstractGeo
  local _base_0 = {
    name = "geo_distance",
    setDistance = function(self, distance)
      self:setParam('distance', distance)
      return true
    end,
    setDistanceType = function(self, distanceType)
      self:setParam('distance_type', distanceType)
      return true
    end,
    setOptimizeBbox = function(self, optimizeBbox)
      self:setParam('optimize_bbox', optimizeBbox)
      return true
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, key, location, distance)
      _parent_0.__init(self, key, location)
      return self:setDistance(distance)
    end,
    __base = _base_0,
    __name = "EluasticaFilterGeoDistance",
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
  local self = _class_0
  self.DISTANCE_TYPE_ARC = 'arc'
  self.DISTANCE_TYPE_PLANE = 'plane'
  self.OPTIMIZE_BBOX_MEMORY = 'memory'
  self.OPTIMIZE_BBOX_INDEXED = 'indexed'
  self.OPTIMIZE_BBOX_NONE = 'none'
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  EluasticaFilterGeoDistance = _class_0
end
return {
  EluasticaFilterGeoDistance = EluasticaFilterGeoDistance
}
