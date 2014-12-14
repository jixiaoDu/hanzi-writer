class PathRenderer

	constructor: (points) ->
		start = points[0]
		remainingPoints = points[1..-1]
		@pathString = "M #{start.get('x')} #{start.get('y')}"
		for point in remainingPoints
			@pathString += " L #{point.get('x')} #{point.get('y')}"

	getPathString: (close = false) ->
		if close then @pathString + ' z' else @pathString

module.exports = PathRenderer