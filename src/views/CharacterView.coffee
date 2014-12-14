View = require('./View.coffee')
StrokeView = require('./StrokeView.coffee')
ComboStrokeView = require('./ComboStrokeView.coffee')
Stroke = require('../models/Stroke.coffee')
ComboStroke = require('../models/ComboStroke.coffee')

class CharacterView extends View

	constructor: (container, @character) ->
		super(container)
		@strokeViews = []
		for stroke in @character.get('strokes')
			if stroke instanceof Stroke
				@strokeViews.push(@registerSubview(new StrokeView(container, stroke)))
			else if stroke instanceof ComboStroke
				@strokeViews.push(@registerSubview(new ComboStrokeView(container, stroke)))

module.exports = CharacterView