local EluasticaAbstractFilter
do
  local _obj_0 = require("eluastica.filter.abstract_filter")
  EluasticaAbstractFilter = _obj_0.EluasticaAbstractFilter
end
local EluasticaAbstractGeo
do
  local _parent_0 = EluasticaAbstractFilter
  local _base_0 = {
    setKey = function(self, key)
      self._key = key
      return true
    end,
    setLocation = function(self, location)
      if type(location) == 'table' then
        if location['lat'] ~= nil then
          self:setLatitude(location['lat'])
        else
          error('$location[\'lat\'] has to be set')
        end
        if location['lon'] ~= nil then
          self:setLongitude(location['lon'])
        else
          error('$location[\'lon\'] has to be set')
        end
      elseif type(location) == 'string' then
        self:setGeohash(location)
      else
        error('$location has to be an array (latitude/longitude) or a string (geohash)')
      end
      return true
    end,
    setLatitude = function(self, latitude)
      self._latitude = latitude
      self._locationType = self.LOCATION_TYPE_LATLON
      return true
    end,
    setLongitude = function(self, longitude)
      self._longitude = longitude
      self._locationType = self.LOCATION_TYPE_LATLON
      return true
    end,
    setGeohash = function(self, geohash)
      self._geohash = geohash
      self._locationType = self.LOCATION_TYPE_GEOHASH
      return true
    end,
    _getLocationData = function(self)
      local location
      if self._locationType == self.LOCATION_TYPE_LATLON then
        location = { }
        if self._latitude ~= nil then
          location['lat'] = self._latitude
        else
          error('Latitude has to be set')
        end
        if self._longitude ~= nil then
          location['lon'] = self._longitude
        else
          error('Longitude has to be set')
        end
      elseif self._locationType == self.LOCATION_TYPE_GEOHASH then
        location = self._geohash
      else
        error('Invalid location type')
      end
      return location
    end,
    toArray = function(self)
      self:setParam(self._key, self:_getLocationData())
      return _parent_0.toArray(self)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, key, location)
      _parent_0.__init(self)
      self._locationType = nil
      self._key = nil
      self._latitude = nil
      self._longitude = nil
      self._geohash = nil
      self:setKey(key)
      return self:setLocation(location)
    end,
    __base = _base_0,
    __name = "EluasticaAbstractGeo",
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
  self.LOCATION_TYPE_GEOHASH = 'geohash'
  self.LOCATION_TYPE_LATLON = 'latlon'
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  EluasticaAbstractGeo = _class_0
end
return {
  EluasticaAbstractGeo = EluasticaAbstractGeo
}
