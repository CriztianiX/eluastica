empty = (val) ->
  if val == nil or val == ''
    return true

  return false

array_merge = (t1, t2) ->
  for k,v in pairs(t2)
    if type(v) == "table"
      t1[k] = v
    else
      table.insert(t1, v)

  return t1

{ :empty, :array_merge }
