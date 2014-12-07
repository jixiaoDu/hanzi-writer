PointUtils = require('../../utils/PointUtils.coffee')

getStrokeBoundingPoints = (strokes) ->
	bounds = []
	for stroke in strokes
		strokeBounds = stroke.getBounds()
		bounds.push strokeBounds[0]
		bounds.push strokeBounds[1]
	return bounds

module.exports = StrokeCollectionMixin =
	
	getBounds: -> PointUtils.getBounds(getStrokeBoundingPoints(@get('strokes')))