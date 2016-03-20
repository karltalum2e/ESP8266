# DHT22 to MySQL Database

Read temperature and humidity from DHT22 and send the data to mysql database.

Tested with esp-01 & esp-12, firmware version 0.9.6-dev_20150704.

1. Change gpio ports if needed in file dht22_read_send.lua
2. Add your wifi ssid and password in file init.lua
3. Upload all lua files to your esp
4. Upload insert.php files to web server