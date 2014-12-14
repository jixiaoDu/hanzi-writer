ZdtCharacterBuilder = require('./lib/ZdtCharacterBuilder.coffee')
BoundsTransformer = require('./lib/BoundsTransformer.coffee')
CharacterPositionerView = require('./views/CharacterPositionerView.coffee')
PositionerRenderOptions = require('./models/PositionerRenderOptions.coffee')
StrokeRenderOptions = require('./models/StrokeRenderOptions.coffee')
extractKeys = require('./utils/extractKeys.coffee')

SVG = require('svg.js')

class HanziWriter

	defaultOptions:
		charDataLoader: (char) -> hanziData[char]
		width: 400
		height: 400
		padding: 20
		fullStrokeColor: '#555'
		fullStrokeVisible: true
		outlineStrokeColor: '#DDD'
		outlineStrokeVisible: true
		userStrokeColor: '#333'

	constructor: (element, character, options = {}) ->
		@options = {}
		@options[key] = value for key, value of @defaultOptions
		@svg = SVG(element)
		@updateOptions(options)
		@setCharacter(character)

	setCharacter: (char) ->
		@characterPositionerView.destroy() if @characterPositionerView
		pathStrings = @options.charDataLoader(char)
		@character = (new ZdtCharacterBuilder).buildCharacter(pathStrings)
		@boundsTransformer = new BoundsTransformer(@character.getBounds(), @positionerRenderOptions)
		@characterPositionerView = new CharacterPositionerView(@svg, {
			@character, @boundsTransformer, @fullStrokeRenderOptions, @outlineStrokeRenderOptions
		})

	updateOptions: (options) ->
		@options[key] = value for key, value of options
		@positionerRenderOptions = new PositionerRenderOptions(extractKeys(@options, ['width', 'height', 'padding']))
		@fullStrokeRenderOptions = new StrokeRenderOptions
			color: @options.fullStrokeColor
			fill: @options.fullStrokeColor
			visible: @options.fullStrokeVisible
			pathWidth: 2
		@outlineStrokeRenderOptions = new StrokeRenderOptions
			color: @options.outlineStrokeColor
			fill: @options.outlineStrokeColor
			visible: @options.outlineStrokeVisible
			pathWidth: 2
		@userStrokeRenderOptions = new StrokeRenderOptions
			color: @options.userStrokeColor
			fill: 'none'
			visible: true
			pathWidth: 4


# set up window.HanziWriter if we're in the browser
if typeof window != 'undefined'

	# store whatever used to be called HanziWriter in case of a conflict
	previousHanziWriter = window.HanziWriter

	# add a jQuery-esque noConflict method to restore the previous window.HanziWriter if necessary
	HanziWriter.noConflict = ->
		window.HanziWriter = previousHanziWriter
		return HanziWriter

	window.HanziWriter = HanziWriter

# set up module.exports if we're in node/browserify
if typeof module != 'undefined' && module.exports
	module.exports = HanziWriter
