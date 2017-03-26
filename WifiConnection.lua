module("WifiConnection", package.seeall)

 function WifiConnection.connectToWifi(networkName, password)

  if wifi.sta.status() == wifi.STA_GOTIP then
    print("Already Connected")
  else
    print("Connecting...")
    wifi.sta.config(networkName,password)
    wifi.sta.connect()
    tmr.delay(1000000)   -- wait 1,000,000 us = 1 second

    if wifi.sta.status() == wifi.STA_GOTIP then
      print "connected"
    elseif wifi.sta.status() == wifi.STATION_CONNECT_FAIL then
      print  "Connection failed"
    elseif wifi.sta.status() == wifi.STA_WRONGPWD then
      print  "Wrong password"
    elseif wifi.sta.status() == wifi.STA_APNOTFOUND then
      print  "No AP found"
    end  
  end
  return
 end
