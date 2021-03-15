function printf(s,...)  print(s:format(...)) end

local mymodule = {}
mymodule.printf=printf
return mymodule


