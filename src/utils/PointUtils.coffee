Point = require('../models/Point.coffee')

module.exports = PointUtils =
	
	_getExtremes: (numArray) ->
		max = Math.max.apply(null, numArray)
		min = Math.min.apply(null, numArray)
		return [max, min]

	getExtremeXs: (points) -> @_getExtremes(point.x for point in points)
	getExtremeYs: (points) -> @_getExtremes(point.y for point in points)

	getBounds: (points) ->
		[maxY, minY] = PointUtils.getExtremeYs(@get('points'))
		[maxX, minX] = PointUtils.getExtremeXs(@get('points'))
		return [new Point({x: minX, y: minY}), new Point({x: maxX, y: maxY})]