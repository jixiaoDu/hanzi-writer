Point = require('../models/Point.coffee')

module.exports = PointUtils =
	
	_getExtremes: (numArray) ->
		max = Math.max.apply(null, numArray)
		min = Math.min.apply(null, numArray)
		return [max, min]

	getExtremeXs: (points) -> @_getExtremes(point.get('x') for point in points)
	getExtremeYs: (points) -> @_getExtremes(point.get('y') for point in points)

	getBounds: (points) ->
		[maxY, minY] = PointUtils.getExtremeYs(points)
		[maxX, minX] = PointUtils.getExtremeXs(points)
		return [new Point({x: minX, y: minY}), new Point({x: maxX, y: maxY})]