package = "eluastica"
version = "dev-1"

source = {
	url = "git://github.com/Changosdev/eluastica.git"
}

description = {
	summary = "A moonscript/lua elasticsearch library",
	homepage = "http://changosdev.com/eluastica",
	maintainer = "Criztian Haunsen <cristianhaunsen@gmail.com>",
	license = "MIT"
}

dependencies = {
	"lua ~> 5.1"
}

build = {
	type = "builtin",
	modules = {
		["eluastica.filter.abstract_filter"] = "eluastica/filter/abstract_filter.lua",
		["eluastica.filter.abstract_geo"] = "eluastica/filter/abstract_geo.lua",
		["eluastica.filter.abstract_multi"] = "eluastica/filter/abstract_multi.lua",
		["eluastica.filter.and"] = "eluastica/filter/and.lua",
		["eluastica.filter.exists"] = "eluastica/filter/exists.lua",
		["eluastica.filter.geo_distance"] = "eluastica/filter/geo_distance.lua",
		["eluastica.filter.missing"] = "eluastica/filter/missing.lua",
		["eluastica.filter.terms"] = "eluastica/filter/terms.lua",
		["eluastica.filter.or"] = "eluastica/filter/or.lua",
		["eluastica.moses"] = "eluastica/vendor/moses.lua",
		["eluastica.param"] = "eluastica/param.lua",
		["eluastica.query.abstract_query"] = "eluastica/query/abstract_query.lua",
		["eluastica.query.filtered"] = "eluastica/query/filtered.lua",
		["eluastica.query.wildcard"] = "eluastica/query/wildcard.lua",
		["eluastica.util"] = "eluastica/util.lua"
	}
}

