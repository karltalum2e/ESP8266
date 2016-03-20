OSS = 1 -- oversampling setting (0-3)
SDA_PIN = 4
SCL_PIN = 3
bmp180 = require("bmp180")
bmp180.init(SDA_PIN, SCL_PIN)
bmp180.read(OSS)
p1 = bmp180.getPressure()
p2 = (p1 * 75 / 10000).."."..((p1 * 75 % 10000) / 1000)
print (p2)
bmp180 = nil
package.loaded["bmp180"]=nil

print("Sending data to thingspeak.com")
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
conn:connect(80,'184.106.153.149') 		
conn:send("GET /update?key=YOUR THINGSPEAK KEY&field3="..p2.." HTTP/1.1\r\n") 
conn:send("Host: api.thingspeak.com\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
                      print("Closing connection")
                      conn:close()
                  end)
conn:on("disconnection", function(conn)
                      print("Got disconnection...")
  end)
dofile("timer.lua")