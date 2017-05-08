 local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local MarchingSquares = require("MarchingSquares")
 local data  = {
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,1,1,1,1,1,1,1,1,0,0,0,
   0,0,0,1,0,0,0,0,0,0,1,0,0,0,
   0,0,0,1,0,0,0,0,0,0,1,0,0,0,
   0,0,0,1,0,0,1,1,1,0,1,0,0,0,
   0,0,0,1,0,0,1,0,1,0,1,0,0,0,
   0,0,0,1,0,0,1,1,1,0,1,0,0,0,
   0,0,0,1,0,0,0,0,0,0,1,0,0,0,
   0,0,0,1,1,1,1,1,1,1,1,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0
   }
local columns = 14
local rows = 14
local results = MarchingSquares.getBlobOutlinePoints(data, columns, rows)
 

local resultArr = {}
 for i = 1, #results, 2 do 
    local r1 = results[i]
    local r2 = results[i+1]
    table.insert(resultArr, {r1, r2})
 end
 
 for c = 1, columns do 
      local line = ""
  for r = 1, rows do 
    local data = 0
    for i = 1, #resultArr do 
        local rc = resultArr[i]
        if c == rc[1] and r == rc[2] then
          data = 1
          break
        end
    end
    line = line  .. (data .. ",")
  end
  print(line)
  
end
 
 
