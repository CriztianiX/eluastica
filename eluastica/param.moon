---
-- Class to handle params
-- This function can be used to handle params for queries, filter, facets
--
-- @category Xodoa
-- @package Elastica
-- @author Nicolas Ruflin <spam@ruflin.com>

moses = require "eluastica.moses"

class EluasticaParam
  new: () =>
    -- Params
    -- @var array
    @_params = {}
    --
    -- Raw Params
    --
    -- @var array
    --
    @_rawParams = {}
  ---
   -- Converts the params to an array. A default implementation exist to create
   -- the an array out of the class name (last part of the class name)
   -- and the params
   --
   -- @return array Filter array
   --
  toArray: =>
    data = {}
    data[@_getBaseName!] = @getParams!
    if @_rawParams ~= nil
      for k,v in pairs(@_rawParams) 
        data[k] = v
        
    return data

  ---
   -- Param's name
   -- Picks the last part of the class name and makes it snake_case
   -- You can override this method if you want to change the name
   --
   -- @return string name
   --
  _getBaseName: =>
      return @name
    --return Util::getParamName(@)
    
  ---
   -- Sets params not inside params array
   --
   -- @param  string         $key
   -- @param  mixed          $value
   -- @return \Elastica\Param
   --
  --
  --  protected function _setRawParam($key, $value)
  --  {
  --      $this->_rawParams[$key] = $value;
  --      return $this;
  --  }
  --]]
  ---
   -- Sets (overwrites) the value at the given key
   --
   -- @param  string         $key   Key to set
   -- @param  mixed          $value Key Value
   -- @return Param
   --
  setParam: (key, value) =>
    @_params[key] = value
    return true

  ---
  -- Returns a specific param
  --
  -- @param  string                              $key Key to return
  -- @return mixed                               Key value
  -- @throws \Elastica\Exception\InvalidException If requested key is not set
  --
  getParam: (key) =>
    --if (!$this->hasParam($key)) {
     --       throw new InvalidException('Param ' . $key . ' does not exist');
      --  }
    
    return @_params[key]

  setParams: (params) =>
    @_params = params

  ---
  -- Returns the params array
  --
  -- @return array Params
  --/
  getParams: =>
    return @_params

  hasParam: (key) =>
    return @_params[key] ~= nil
{ :EluasticaParam }