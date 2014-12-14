View = require('./View.coffee')
CharacterView = require('./CharacterView.coffee')

class CharacterPositionerView extends View

	constructor: (container, @character, @boundsTransformer) ->
		super(container)
		@group = @drawSvgElement('group')
			.move(@boundsTransformer.getXOffset(), @boundsTransformer.getYOffset())
			.transform(scaleX: @boundsTransformer.getScale(), scaleY: @boundsTransformer.getScale())
		@characterView = @registerSubview(new CharacterView(@group, @character))

module.exports = CharacterPositionerView