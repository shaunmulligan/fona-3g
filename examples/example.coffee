console.log 'Starting Coffee Script'
{ SimCom } = require('../index')
console.log SimCom
simcom = new SimCom '/dev/ttyUSB17' #, {log: '/data/modem.log'}

simcom.on 'open', ->
  info = {}
  simcom.getProductID().then((res) ->
    info.product = res
    return simcom.getSignalQuality()
  ).then((res) ->
    info.signal = res
    return simcom.setSmsTextMode()
  ).then((res) ->
    info.smsTextModeRes = res
    return simcom.readSMS(2)
  ).then((res) ->
    info.SmsReadRes = res
    return simcom.listSMS()
  ).then((res) ->
    # info.smsListRes = res
    return simcom.getBatteryLevel()
  ).then((res) ->
    info.battery = res
  ).catch((error) ->
    console.log 'error', error
    return
  ).done ->
    console.log info
    simcom.close()
    return
  return

# simcom.execute('AT+CMGS="+44**********"\r"test"'+Buffer([0x1A])+'^z').then (res) -> console
