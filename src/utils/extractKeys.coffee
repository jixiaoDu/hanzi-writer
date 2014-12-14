module.exports = extractKeys = (obj, keys) ->
	newObj = {}
	newObj[key] = obj[key] for key in keys
	return newObj