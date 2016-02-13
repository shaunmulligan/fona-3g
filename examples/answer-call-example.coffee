{ SimCom } = require('../index')
simcom = new SimCom '/dev/ttyUSB17' , {log: './modem.log'}

answerAndHangUp = () ->
	console.log("Hanging Up the phone!")
	simcom.hangUp (err, res) -> 
    	console.log res

simcom.on 'open', ->
  console.log 'Waiting...'
  return

# Answer when a call comes in, then hangup 10 seconds later
simcom.on 'ring', ->
  console.log 'Ringing...'
  setTimeout(answerAndHangUp, 10000)
  simcom.answerCall (res) ->
  	console.log res
  return

