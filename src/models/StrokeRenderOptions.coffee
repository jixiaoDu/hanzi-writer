Model = require('./Model.coffee')

class StrokeRenderOptions extends Model

	defaults:
		color: '#555'
		fill: '#555'
		visible: true
		pathWidth: 4

module.exports = StrokeRenderOptions
