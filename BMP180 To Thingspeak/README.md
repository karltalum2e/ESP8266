# BMP180 to Thingspeak

Read atmospheric pressure(mmHg) from bmp180 and send it to thingspeak.com

Tested with esp-01 & esp-12, firmware version 0.9.6-dev_20150704.

1. Change gpio ports if needed in file read_bmp180.lua
2. Add your wifi ssid and password in file init.lua
3. Add your thingspeak write api key in file read_bmp180.lua

Optional:

* Change how often data is sent to thingspeak by changing file timer.lua.