{ SimCom } = require('../index')
console.log SimCom
simcom = new SimCom '/dev/ttyUSB17' #, {log: '/data/modem.log'}

simcom.on 'open', ->
	simcom.dialNumber "+44**********" , (err, res) ->
		if err?
			console.log err
		else
			console.log res