Point = require('../models/Point.coffee')
Stroke = require('../models/Stroke.coffee')
ComboStroke = require('../models/ComboStroke.coffee')
Character = require('../models/Character.coffee')

class ZdtCharacterBuilder

	buildCharacter: (zdtPathStrings) ->
		rawStrokeData = (@_parsePathString(pathString) for pathString in zdtPathStrings)
		comboStrokeDataBuffer = []
		strokes = []
		for strokeData in rawStrokeData
			if strokeData.isComplete and comboStrokeDataBuffer.length == 0
				strokes.push(new Stroke(strokeData))
			else if stroke.isComplete
				comboStrokeDataBuffer.push(strokeData)
				partialStrokes = for strokeData in comboStrokeDataBuffer
					strokeData.animationSpeedup = comboStrokeDataBuffer.length
					new Stroke(strokeData)
				comboStroke = new ComboStroke(strokes: partialStrokes)
				strokes.push(comboStroke)
				comboStrokeDataBuffer = []
			else
				comboStrokeDataBuffer.push(strokeData)
		return new Character({ strokes })

	_parsePathString: (pathString) ->
		[metadataString, pathString] = pathString.split ':'
		pathString = pathString.replace(/;?\s*$/, '')
		strokeData =
			points: (@_parsePoint(pointString) for pointString in pathString.split(';'))
			isComplete: metadataString[2] == 'P'
			strokeType: parseInt(metadataString[1])
			animationSpeedup: 1
		return strokeData

	_parsePoint: (pointString) ->
		pointArr = pointString.split(',')
		return new Point({x: pointArr[0], y: pointArr[1]})


module.exports = ZdtCharacterBuilder