import EluasticaAbstractFilter from require "eluastica.filter.abstract_filter"

class EluasticaAbstractGeo extends EluasticaAbstractFilter
  @LOCATION_TYPE_GEOHASH: 'geohash'
  @LOCATION_TYPE_LATLON: 'latlon'

  new: (key, location) =>
    super!
    ---
    -- Location type
    --
    -- Decides if this filter uses latitude/longitude or geohash for the location.
    -- Values are "latlon" or "geohash".
    --
    -- @var string
    --
    @_locationType = nil
    ---
    -- Key
    --
    -- @var string
    --
    @_key = nil
    ---
    -- Latitude
    --
    -- @var float
    --
    @_latitude = nil
    ---
    -- Longitude
    --
    -- @var float
    --
    @_longitude = nil
    ---
    -- Geohash
    --
    -- @var string
    --
    @_geohash = nil

    @setKey(key)
    @setLocation(location)
  ---
  -- @param  string                                    $key
  -- @return \Elastica\Filter\AbstractGeoDistance current filter
  --
  setKey: (key) =>
    @_key = key
    return true
  ---
  -- @param  array|string                              $location
  -- @return \Elastica\Filter\AbstractGeoDistance
  -- @throws \Elastica\Exception\InvalidException
  --
  setLocation: (location) =>
    if type(location) == 'table' -- Latitude/Longitude
      -- Latitude
      if location['lat'] ~= nil
        @setLatitude(location['lat'])
      else
        error('$location[\'lat\'] has to be set')
      -- Longitude
      if location['lon'] ~= nil
        @setLongitude(location['lon'])
      else
        error('$location[\'lon\'] has to be set')
    elseif type(location) == 'string' -- Geohash
      @setGeohash(location)
    else --Invalid location
      error('$location has to be an array (latitude/longitude) or a string (geohash)')
    
    return true
  ---
  -- @param  float                                     $latitude
  -- @return \Elastica\Filter\AbstractGeoDistance current filter
  --
  setLatitude: (latitude) =>
    @_latitude = latitude
    @_locationType = @LOCATION_TYPE_LATLON
    return true
  ---
  -- @param  float                                     $longitude
  -- @return \Elastica\Filter\AbstractGeoDistance current filter
  --
  setLongitude: (longitude) =>
    @_longitude = longitude
    @_locationType = @LOCATION_TYPE_LATLON
    return true
  ---
  -- @param  string                                    $geohash
  -- @return \Elastica\Filter\AbstractGeoDistance current filter
  --
  setGeohash: (geohash) =>
    @_geohash = geohash
    @_locationType = @LOCATION_TYPE_GEOHASH
    return true

  ---
  -- @return array|string
  -- @throws \Elastica\Exception\InvalidException
  --
  _getLocationData: =>
    local location

    if @_locationType == @LOCATION_TYPE_LATLON -- Latitude/longitude
      location = {}
      if @_latitude ~= nil -- Latitude
        location['lat'] = @_latitude
      else
        error('Latitude has to be set')
      
      if @_longitude ~= nil -- Geohash
        location['lon'] = @_longitude
      else
        error('Longitude has to be set')
    elseif @_locationType == @LOCATION_TYPE_GEOHASH -- Geohash
      location = @_geohash
    else -- Invalid location type
      error('Invalid location type')

    return location
  ---
  -- @see \Elastica\Param::toArray()
  -- @throws \Elastica\Exception\InvalidException
  --
  toArray: =>
    @setParam(@_key, @_getLocationData!)
    return super!

{ :EluasticaAbstractGeo }