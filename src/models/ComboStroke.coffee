Model = require('model')
StrokeCollectionMixin = require('mixins/StrokeCollectionMixin.coffee')

class ComboStroke extends Model

	@include StrokeCollectionMixin

	defaults:
		strokes: []

module.exports = ComboStroke
