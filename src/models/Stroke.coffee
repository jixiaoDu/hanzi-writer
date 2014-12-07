Model = require('model')
PointCollectionMixin = require('mixins/PointCollectionMixin.coffee')


class Stroke extends Model
	@include PointCollectionMixin

	defaults:
		points: []

module.exports = Stroke
