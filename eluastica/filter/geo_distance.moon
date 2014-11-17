import EluasticaAbstractGeo from require "eluastica.filter.abstract_geo"

class EluasticaFilterGeoDistance extends EluasticaAbstractGeo
  @DISTANCE_TYPE_ARC = 'arc'
  @DISTANCE_TYPE_PLANE = 'plane'
  @OPTIMIZE_BBOX_MEMORY = 'memory'
  @OPTIMIZE_BBOX_INDEXED = 'indexed'
  @OPTIMIZE_BBOX_NONE = 'none'

  name: "geo_distance"
  
  new: (key, location, distance) =>
    super key, location
    @setDistance(distance)
  ---
  -- @param  string                            $distance
  -- @return \Elastica\Filter\GeoDistance current filter
  --
  setDistance: (distance) =>
    @setParam('distance', distance)
    return true
  ---
  -- See DISTANCE_TYPE_* constants
  --
  -- @param  string                            $distanceType
  -- @return \Elastica\Filter\GeoDistance current filter
  --
  setDistanceType: (distanceType) =>
    @setParam('distance_type', distanceType)
    return true
  ---
  -- See OPTIMIZE_BBOX_* constants
  --
  -- @param  string                            $optimizeBbox
  -- @return \Elastica\Filter\GeoDistance current filter
  --
  setOptimizeBbox: (optimizeBbox) =>
    @setParam('optimize_bbox', optimizeBbox)
    return true

{ :EluasticaFilterGeoDistance }