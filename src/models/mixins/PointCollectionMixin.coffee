Point = require('../Point.coffee')
PointUtils = require('../../utils/PointUtils.coffee')

module.exports = PointCollectionMixin =
	
	getBounds: -> PointUtils.getBounds(@get('points'))