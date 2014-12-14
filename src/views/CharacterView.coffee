View = require('./View.coffee')
StrokeView = require('./StrokeView.coffee')
ComboStrokeView = require('./ComboStrokeView.coffee')
Stroke = require('../models/Stroke.coffee')
ComboStroke = require('../models/ComboStroke.coffee')

class CharacterView extends View

	constructor: (container, modelsMap) ->
		super
		@strokeViews = []
		for stroke in @character.get('strokes')
			if stroke instanceof Stroke
				@strokeViews.push(@registerSubview(new StrokeView(container, {
					stroke, strokeRenderOptions: @fullStrokeRenderOptions
				})))
			else if stroke instanceof ComboStroke
				@strokeViews.push(@registerSubview(new ComboStrokeView(container, {
					comboStroke: stroke, strokeRenderOptions: @fullStrokeRenderOptions
				})))

module.exports = CharacterView