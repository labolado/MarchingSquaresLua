--[[
  Created by @labolado on 28-04-17.
 
  Javascript port of :
  https://github.com/sakri/MarchingSquaresJS/blob/master/MarchingSquaresOpt.js
  returns an Array of x and y positions defining the perimeter of a blob of non-transparent pixels on a canvas
 
 ]]
 
local function bitOr(a,b)
local p,c=1,0
    while a+b>0 do
        local ra,rb=a%2,b%2
        if ra+rb>0 then c=c+p end
        a,b,p=(a-ra)/2,(b-rb)/2,p*2
    end
    return c
end

 
local bor = bitOr
if bit32 ~= nil then
  bor = bit32.bor
end

 
local tableInsert = table.insert

local function js_push(tbl, val)
  tableInsert(tbl, val)
  return tbl
end


local MarchingSquares = {}
local prev_next_step = 0


function MarchingSquares.getBlobOutlinePoints(source_array, width, height)
  -- Note: object should not be on the border of the array, since there is
  --       no padding of 1 pixel to handle points which touch edges
        
  local startingPoint = MarchingSquares.getFirstNonTransparentPixelTopDown(source_array, width, height)
  if nil == startingPoint then
    return {}
  end
  return MarchingSquares.walkPerimeter(source_array, width, height, startingPoint.w, startingPoint.h)
end

 
function MarchingSquares.getFirstNonTransparentPixelTopDown(source_array, width, height)
  local idx = 0
  local h = 1
  while h <= height do  
    idx = (h - 1) * width
    local w = 1
    while w <= width do 
      if source_array[idx + 1] > 0 then
        return {
          w = w,
          h = h
        }
      end
      idx = idx + 1
      w = w + 1
    end
    h = h + 1
  end
  return nil
  end

  function MarchingSquares.walkPerimeter(source_array, width, height, start_w, start_h)
   
     
    local point_list, up, left, down, right = {}, 1, 2, 3, 4
    local step_func = MarchingSquares.step
    local idx, w, h, next_step = 0, start_w, start_h, nil
    
    repeat
      idx = (h - 1) * width + w
      
      local s1, s2, s3, s4 =  source_array[idx - width - 1] or 0, source_array[idx - width] or 0, source_array[idx - 1] or 0, source_array[idx] or 0
      local state = s1 * 1 + s2 * 2 + s3 * 4 + s4 * 8
      next_step = prev_next_step
      if state == 1 then
        next_step = 1
      elseif state ==  2 then 
        next_step = 4  
      elseif state ==  3 then 
        next_step = 4 
      elseif state ==  4 then 
        next_step = 2  
      elseif state ==  5 then 
        next_step = 1  
      elseif state ==  6 then
          if next_step == 1 then
              next_step = 2
         else
              next_step = 4
          end
         
      elseif state ==  7 then 
        next_step = 4 
      elseif state ==  8 then 
        next_step = 3
      elseif state ==  9 then
          if next_step == 4 then
              next_step = 1
          else
              next_step = 3
          end
         
      elseif state ==  10 then 
        next_step = 3 
      elseif state ==  11 then 
        next_step = 3 
      elseif state ==  12 then 
        next_step = 2 
      elseif state ==  13 then 
        next_step = 1 
      elseif state ==  14 then 
        next_step = 2 
      else 
          next_step = 0  
      end
      prev_next_step = next_step
    
     
      if next_step == up then     
        h = h- 1 
      elseif next_step ==   left then   
       w = w - 1
      elseif next_step ==   down then  
       h = h + 1
      elseif next_step ==  right then  
        w = w + 1
      end
    
      point_list[#point_list + 1] = w
      point_list[#point_list + 1] = h
    until (w == start_w) and (h == start_h)
    return point_list
  end

function MarchingSquares.step(idx, source_array, width)
  local s1, s2, s3, s4 =  source_array[idx - width - 1] or 0,  source_array[idx - width] or 0, source_array[idx - 1] or 0, source_array[idx] or 0
 
  local state = s1 * 1 + s2 * 2 + s3 * 4 + s4 * 8
 
   
  local next_step = prev_next_step
  if state == 1 then
    next_step = 1
  elseif state ==  2 then 
    next_step = 4  
  elseif state ==  3 then 
    next_step = 4 
  elseif state ==  4 then 
    next_step = 2  
  elseif state ==  5 then 
    next_step = 1  
  elseif state ==  6 then
      if next_step == 1 then
          next_step = 2
     else
          next_step = 4
      end
     
  elseif state ==  7 then 
    next_step = 4 
  elseif state ==  8 then 
    next_step = 3
  elseif state ==  9 then
      if next_step == 4 then
          next_step = 1
      else
          next_step = 3
      end
     
  elseif state ==  10 then 
    next_step = 3 
  elseif state ==  11 then 
    next_step = 3 
  elseif state ==  12 then 
    next_step = 2 
  elseif state ==  13 then 
    next_step = 1 
  elseif state ==  14 then 
    next_step = 2 
  else 
      next_step = 0  
  end
  prev_next_step = next_step
      
  return next_step
end
 
return MarchingSquares