Model = require('model')
PointCollectionMixin = require('mixins/PointCollectionMixin.coffee')

class UserStroke extends Model
	@include PointCollectionMixin

	defaults:
		points: []

module.exports = UserStroke
