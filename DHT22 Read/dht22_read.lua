DHT= require("dht22_min")
DHT.read(4)
temperature = DHT.getTemperature()
humidity = DHT.getHumidity()
t1 = temperature / 10
t2 = temperature % 10
h1 = humidity / 10
h2 = humidity % 10
if humidity == nil then
    print("Error reading from DHT22")
else
	print("Temperature: "..t1.."."..t2.."C")
	print("Humidity: "..h1.."."..h2.."%")
end
DHT = nil
package.loaded["dht22_min"]=nil