local empty
empty = function(val)
  if val == nil or val == '' then
    return true
  end
  return false
end
local array_merge
array_merge = function(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      t1[k] = v
    else
      table.insert(t1, v)
    end
  end
  return t1
end
return {
  empty = empty,
  array_merge = array_merge
}
