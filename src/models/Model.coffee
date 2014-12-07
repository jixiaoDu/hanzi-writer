Mixable = require('../utils/Mixable.coffee')

class Model extends Mixable

	defaults: {}

	constructor: (@properties) ->

	get: (key) -> if key of @properties then @properties[key] else defaults[key] 
	set: ->
		if arguments.length == 1
			@properties[key] = value for key, value of arguments[0]
		else
			@properties[arguments[0]] = arguments[1]
		return @