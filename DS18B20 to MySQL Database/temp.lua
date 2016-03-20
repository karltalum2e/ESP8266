require('ds18b20')

-- ESP-01 GPIO Mapping
gpio0 = 3

ds18b20.setup(gpio0)

t1=ds18b20.read()
print("Temp:"..t1.." C\n")

tmr.alarm(2, 1000, 1, function() sendData() end)

function sendData()
IP="46.101.62.130"
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
conn:connect(80, IP) 
conn:send("GET /insert.php?temperature="..t1.." HTTP/1.1\r\n") 
conn:send("Host: IP\r\n") 
conn:send("Accept: */*\r\n") 
conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
conn:send("\r\n")
conn:on("sent",function(conn)
conn:close()
end)
conn:on("disconnection", function(conn)
end)
dofile("timer.lua")
end