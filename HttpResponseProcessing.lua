module("HttpResponseProcessing", package.seeall) 

function HttpResponseProcessing.getweatherAndTime(code, data)
    if (code < 0) then
      print("HTTP request failed")
      else 
        weatherTimeTableResult = cjson.decode(data)
        _G.celciusTemp = weatherTimeTableResult.temp_c
        _G.humidity = weatherTimeTableResult.relative_humidity
        _G.timezone = weatherTimeTableResult.local_tz_offset
        --[[
        for key,value in pairs(weatherTimeTableResult) do
           --Set time in EPS8266
           if key == "current_observation" then
             for subKey,subValue in pairs(value) do
               if subKey == "temp_c" then
                 _G.celciusTemp = subValue
               end
               if subKey == "relative_humidity" then
                 _G.humidity = subValue
               end
               if subKey == "local_epoch" then              
                 rtctime.set(subValue)
               end       
               if subKey == "local_tz_offset" then              
                 _G.timezone = tonumber(subValue)/100
               end   
             end
           end
        end --]]
   end
end

function HttpResponseProcessing.setTime(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      if (data ~= nil) then
       tableResult = cjson.decode(data)
       for key,value in pairs(tableResult) do
         if key=="timestamp" then
           --Set time in EPS8266
           rtctime.set(value) 
         end
        end
      end
    end
end
