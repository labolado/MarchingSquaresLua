Ported from https://github.com/sakri/MarchingSquaresJS/blob/master/MarchingSquaresOpt.js
 
Marching squares outlines blobs of non-transparent pixels inside a bitmap.

This is a straight forward port from this excellent implementation by Phill Spiess:

http://devblog.phillipspiess.com/2010/02/23/better-know-an-algorithm-1-marching-squares/


Usage:

```lua
local MarchingSquares = require("MarchingSquares")
 local data  = {
 0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
local results = MarchingSquares.getBlobOutlinePoints(data,columns,rows)

```
result:
```lua
{
0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,1,1,1,1,1,1,1,1,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,0,0,0,0,0,0,0,1,0,0,
0,0,0,1,1,1,1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,
}

 
 