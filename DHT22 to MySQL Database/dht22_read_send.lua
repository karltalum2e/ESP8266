DHT= require("dht22_min")
DHT.read(2)
temperature = DHT.getTemperature()
humidity = DHT.getHumidity()
t1 = (temperature / 10).."."..(temperature % 10)
--t2 = temperature % 10
h1 = humidity / 10
--h2 = humidity % 10
if humidity == nil then
    print("Error reading from DHT22")
else
	print("Temperature: "..t1.."C")
	print("Humidity: "..h1.."."..h2.."%")
end
DHT = nil
package.loaded["dht22_min"]=nil

tmr.alarm(2, 1000, 1, function() sendData() end)

function sendData()
IP="46.101.62.130"
conn=net.createConnection(net.TCP, 0) 
conn:on("receive", function(conn, payload) print(payload) end)
conn:connect(80, IP) 
conn:send("GET /insert.php?temperature="..t1.."&humidity="..h1.." HTTP/1.1\r\n") 
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