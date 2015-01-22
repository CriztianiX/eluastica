local empty
empty = function(val)
  if val == nil or val == '' then
    return true
  end
  return false
end
return {
  empty = empty
}
