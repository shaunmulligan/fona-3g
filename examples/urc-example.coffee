{ SimCom } = require('../index')
simcom = new SimCom '/dev/ttyUSB17' , {log: './modem.log'}

simcom.on 'open', ->
  console.log 'Waiting...'
  return
simcom.on 'error', (err) ->
  console.error 'ERR:', err
  return
simcom.on 'ring', ->
  console.log 'Ringing...'
  return
simcom.on 'end ring', ->
  console.log 'End Ring'
  return
simcom.on 'new message', (notification) ->
  console.log 'new message', notification
  return
simcom.on 'missed call', (data)->
  console.log 'missed a call from: ' + data[1] + ' at ' + data[0]
  return