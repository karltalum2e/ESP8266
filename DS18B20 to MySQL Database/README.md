# DS18B20 to MySQL Database

Read temperature from ds18b20 and send the temperature data to mysql database.

Tested with esp-01 & esp-12, firmware version float_0.9.6-dev_20150704.

1. Change gpio port if needed in file temp.lua
2. Add your wifi ssid and password in file init.lua
3. Upload all lua files to your esp and insert.php to web server

* It's necessary to add 1k resistor from ds18b20 data wire to +3.3V!