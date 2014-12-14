class View

	constructor: (container, modelsMap) ->
		@[key] = value for own key, value of modelsMap
		@_container = container
		@subviews = []
		@svgElements = []

	registerSubview: (subview) ->
		@subviews.push(subview)
		return subview

	# don't add SVG elements directly - go through this method instead
	drawSvgElement: (elementName, elementArguments...) ->
		element = @_container[elementName].apply(@_container, elementArguments)
		@svgElements.push(element)
		return element

	destroy: ->
		element.remove() for element in @svgElements()
		subview.destroy() for subview in subviews

module.exports = View