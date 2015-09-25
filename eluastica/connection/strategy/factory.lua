local create
create = function(strategy)
  if type(strategy) == "string" then
    local s = strategy:lower()
    local req = "eluastica.connection.strategy." .. s
    local class = require(req)

    return class.new()
  end
end

return {
  create = create
}
