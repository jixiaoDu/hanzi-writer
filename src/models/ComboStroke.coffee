Model = require('./Model.coffee')
StrokeCollectionMixin = require('./mixins/StrokeCollectionMixin.coffee')

class ComboStroke extends Model

	@include StrokeCollectionMixin

	defaults:
		strokes: []

module.exports = ComboStroke
