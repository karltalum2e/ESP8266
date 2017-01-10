# DS18B20 to MySQL Database

Read temperature from ds18b20 and send the temperature data to mysql database.

Tested with esp-01 & esp-12, firmware version **float_0.9.6-dev_20150704**.

1. Change gpio port if needed in file temp.lua (by default, ds18b20 is connected to gpio0)
2. Add your Wi-Fi SSID and password in file init.lua
3. Upload insert.php to your server
4. Add your server IP and insert.php file path to lua file temp.lua (line 14 ja line 18)
5. Upload all lua files to your esp and restart

NB! It is necessary to add 1k resistor from ds18b20 data wire to +3.3V
