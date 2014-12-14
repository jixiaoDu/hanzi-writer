View = require('./View.coffee')
StrokeView = require('./StrokeView.coffee')

class ComboStrokeView extends View

	constructor: (container, modelsMap) ->
		super
		@strokeViews = for stroke in @comboStroke.get('strokes')
			@registerSubview(new StrokeView(container, { stroke, @strokeRenderOptions }))

module.exports = ComboStrokeView
