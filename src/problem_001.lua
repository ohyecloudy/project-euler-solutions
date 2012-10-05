--[[

Project Euler - problem 1
* http://projecteuler.net/problem=1

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]

local sum = 0
for i = 1,999 do
	if (i % 3 == 0) or (i % 5 == 0) then
		sum = sum + i
	end
end

print(sum)
