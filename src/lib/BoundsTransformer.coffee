class BoundsTransformer

	constructor: (@bounds, @renderOptions) ->
		@_calculateScaleAndOffset()

	getXOffset: -> @xOffset
	getYOffset: -> @yOffset
	getScale: -> @scale

	convertExternalPoints: (points) -> (@convertExternalPoint(point) for point in points)
	convertExternalPoint: (point) ->
		new Point
			x: (point.get('x') - @xOffset) / @scale
			y: (point.get('y') - @yOffset) / @scale

	_calculateScaleAndOffset: ->
		preScaledWidth = @bounds[1].get('x') - @bounds[0].get('x')
		preScaledHeight = @bounds[1].get('y') - @bounds[0].get('y')
		effectiveWidth = @renderOptions.get('width') - 2 * @renderOptions.get('padding')
		effectiveHeight = @renderOptions.get('height') - 2 * @renderOptions.get('padding')
		scaleX = effectiveWidth / preScaledWidth
		scaleY = effectiveHeight / preScaledHeight
		
		@scale = Math.min(scaleX, scaleY)

		xCenteringBuffer = @renderOptions.get('padding') + (effectiveWidth - @scale * preScaledWidth) / 2
		yCenteringBuffer = @renderOptions.get('padding') + (effectiveHeight - @scale * preScaledHeight) / 2
		@xOffset = -1 * @bounds[0].get('x') * @scale + xCenteringBuffer
		@yOffset = -1 * @bounds[0].get('y') * @scale + yCenteringBuffer

module.exports = BoundsTransformer