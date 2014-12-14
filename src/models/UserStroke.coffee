Model = require('./Model.coffee')
PointCollectionMixin = require('./mixins/PointCollectionMixin.coffee')

class UserStroke extends Model
	@include PointCollectionMixin

	defaults:
		points: []

module.exports = UserStroke
