View = require('./View.coffee')
StrokeView = require('./StrokeView.coffee')
PathRenderer = require('../lib/PathRenderer.coffee')

class StrokeView extends View

	constructor: (container, @stroke) ->
		super(container)
		@pathRenderer = new PathRenderer(@stroke.get('points'))
		@path = @drawSvgElement('path', @pathRenderer.getPathString(true))

module.exports = StrokeView
