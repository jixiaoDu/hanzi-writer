View = require('./View.coffee')
StrokeView = require('./StrokeView.coffee')

class ComboStrokeView extends View

	constructor: (container, @comboStroke) ->
		super(container)
		@strokeViews = for stroke in @comboStroke.get('strokes')
			@registerSubview(new StrokeView(container, stroke))

module.exports = ComboStrokeView
