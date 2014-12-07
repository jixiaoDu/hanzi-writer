###
Constructs recursively an enumeration with value equal to their key, prefixed by their nested levels.
Use this instead of an array of enums - otherwise Closure Compiler may garble things.

Examples:
	COLORS = keyReflect("COLORS", {blue: null, red: null})
	=> COLORS.blue == "COLORS.blue"

	YO = keyReflect({ YO: { YO: null } })
	==> YO.YO.YO == "YO.YO"

###

module.exports = keyReflect = (prefix, obj) ->
	obj = prefix if not prefix
	throw new Error('Must pass in object') unless typeof obj is 'object'
	ret = {}
	for own key, value of obj
		prefixedKey = "#{prefix}.#{key}"
		ret[key] = if value? then keyReflect(prefixedKey, value) else prefixedKey
	ret
