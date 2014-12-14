Model = require('./Model.coffee')
StrokeCollectionMixin = require('./mixins/StrokeCollectionMixin.coffee')

class Character extends Model
	@include StrokeCollectionMixin

	defaults:
		strokes: []
		isVisible: true
		isOutlineVisible: true

module.exports = Character
