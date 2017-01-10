t = require('ds18b20')

-- ESP-01 GPIO Mapping
gpio0 = 3

t.setup(gpio0)

t1=t.read()
print("Temp:"..t1.." C\n")

tmr.alarm(2, 1000, 1, function() sendData() end)

function sendData()
IP="Server-IP"
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
conn:connect(80, IP) 
conn:send("GET /insert.php?temp="..t1.." HTTP/1.1\r\n") 
conn:send("Host: IP\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
conn:close()
end)
conn:on("disconnection", function(conn)
end)
t = nil
ds18b20 = nil
package.loaded["ds18b20"]=nil
dofile("timer.lua")
end