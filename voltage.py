import serial
import binascii
import time
import datetime
from pymodbus.client.sync import ModbusSerialClient as ModbusClient
 
dir = './'  ######
client = ModbusClient(method = 'rtu', port = '/dev/ttyUSB0', baudrate = 115200)
client.connect()

ii = 0
while True:
 try:
  result = client.read_input_registers(0x3100,6,unit=1)
  client.close()
  solarVoltage = float(result.registers[0] / 100.0)
  solarCurrent = float(result.registers[1] / 100.0)
  batteryVoltage = float(result.registers[4] / 100.0)
  chargeCurrent = float(result.registers[5] / 100.0)


  line0 = str(solarVoltage) + ', ' + str(solarCurrent) + ', ' + str(batteryVoltage) + ', ' + str(chargeCurrent)

  NOW = datetime.datetime.now()
  dttm = NOW.strftime("%Y-%m-%d %H:%M.%S")

  filename = dir + NOW.strftime("%Y%m%d") + '.csv'
  line = dttm + ', ' + line0 + '\n' 
  ii += 1 
  if ii == 8: 
   f = open(filename,'a')
   f.write(line)
   f.close()
   ii = 0  
 except:
  pass

 time.sleep(8)
exit()



