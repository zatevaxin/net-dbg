module("debug", package.seeall)

function objdump(a,b)local c=0;if not b then b={}end;local d=function(a,d,b)indent=function()for e=1,c do io.write("    ")end end;local f=function(g)for h,i in pairs(b)do if i==g then return true end end;return false end;local j=true;for h,i in pairs(a)do if j then indent()print("|")j=false end;if type(i)=="table"and not f(h)then indent()print("|-> "..h..": "..type(i))c=c+1;d(i,d,b)elseif f(h)then indent()print("|-> "..h..": "..type(i))elseif type(i)=="userdata"or type(i)=="function"then indent()print("|-> "..h..": "..type(i))elseif type(i)=="string"then indent()print("|-> "..h..": ".."\""..tostring(i).."\"")else indent()print("|-> "..h..": "..tostring(i))end end;c=c-1 end;c=0;for h,i in pairs(a)do if type(i)=="table"then print("|-> "..h..": "..type(i))c=c+1;d(i,d,b)elseif type(i)=="userdata"or type(i)=="function"then print("|-> "..h..": "..type(i))elseif type(i)=="string"then print("|-> "..h..": ".."\"".. tostring(i).."\"")else print("|-> "..h..": "..tostring(i))end end end
