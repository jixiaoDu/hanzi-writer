View = require('./View.coffee')
StrokeView = require('./StrokeView.coffee')
PathRenderer = require('../lib/PathRenderer.coffee')

class StrokeView extends View

	constructor: (container, modelsMap) ->
		super
		@pathRenderer = new PathRenderer(@stroke.get('points'))
		@path = @drawSvgElement('path', @pathRenderer.getPathString(true))
			.attr(@_getStrokeSvgAttrs())

	_getStrokeSvgAttrs: ->
		stroke: @strokeRenderOptions.get('color')
		fill: @strokeRenderOptions.get('fill')
		opacity: if @strokeRenderOptions.get('visible') then 1 else 0
		'stroke-width': @strokeRenderOptions.get('pathWidth')

module.exports = StrokeView
