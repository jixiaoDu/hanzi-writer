ZdtCharacterBuilder = require('./lib/ZdtCharacterBuilder.coffee')
BoundsTransformer = require('./lib/BoundsTransformer.coffee')
CharacterPositionerView = require('./views/CharacterPositionerView.coffee')
RenderOptions = require('./models/RenderOptions.coffee')

SVG = require('svg.js')

class HanziWriter

	options:
		charDataLoader: (char) -> hanziData[char]

	constructor: (element, character, options = {}) ->
		@svg = SVG(element)
		@options[key] = value for key, value of options

		@renderOptions = new RenderOptions
			width: options.width || 400
			height: options.height || 400
			padding: options.padding || 20

		@setCharacter(character)

	setCharacter: (char) ->
		pathStrings = @options.charDataLoader(char)
		@character = (new ZdtCharacterBuilder).buildCharacter(pathStrings)
		@boundsTransformer = new BoundsTransformer(@character.getBounds(), @renderOptions)
		@characterPositionerView = new CharacterPositionerView(@svg, @character, @boundsTransformer)

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
