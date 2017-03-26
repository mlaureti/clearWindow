--timeTable = rtctime.epoch2cal(rtctime.get()) 
--print the date and time
--print(string.format("%04d/%02d/%02d %02d:%02d:%02d", timeTable["year"], timeTable["mon"], timeTable["day"], timeTable["hour"], timeTable["min"], timeTable["sec"])) 
--print(_G.humidity)
--print(_G.celciusTemp)
--print(_G.timezone) 

require("HttpResponseProcessing")

print(_VERSION)

--http.get("http://api.wunderground.com/api/d46e3563ae9b382d/conditions/q/Canada/Ottawa.json", nil,  HttpResponseProcessing.getweatherAndTime)

print(_G.humidity)
print(_G.celciusTemp)
print(_G.timezone) 


--[[
  nbrOfFlash=0
  while nbrOfFlash <5 do
      gpio.write(3, gpio.LOW)
      rtctime.dsleep(1000000)
      gpio.write(3, gpio.HIGH)
      rtctime.dsleep(1000000)
      nbrOfFlash = nbrOfFlash +1
  end
--]]

--[[
rtctime.dsleep(2*1000000)
timeTable = rtctime.epoch2cal(rtctime.get()) 
--print the date and time
print(string.format("%04d/%02d/%02d %02d:%02d:%02d", timeTable["year"], timeTable["mon"], timeTable["day"], timeTable["hour"], timeTable["min"], timeTable["sec"])) 
print(_G.humidity)
print(_G.celciusTemp)
print(_G.timezone) 

--]]
loopNbr = 0
--[[
while loopNbr < 5 do
  loopNbr = loopNbr + 1
  --tmr.delay(5000000)   -- wait 1,000,000 us = 1 second
  --rtctime.dsleep_aligned(2*1000000, 1*1000000) -- take a sample every 10 seconds, the take to take the sample should not take more than 2 seconds
  http.get("http://api.wunderground.com/api/d46e3563ae9b382d/conditions/q/Canada/Ottawa.json", nil,  HttpResponseProcessing.getweatherAndTime)
  timeTable = rtctime.epoch2cal(rtctime.get()) 
  --print the date and time
  print(string.format("%04d/%02d/%02d %02d:%02d:%02d", timeTable["year"], timeTable["mon"], timeTable["day"], timeTable["hour"], timeTable["min"], timeTable["sec"])) 
  print(_G.humidity)
  print(_G.celciusTemp)
  print(_G.timezone) 
end

--]]
