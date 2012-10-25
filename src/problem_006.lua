--[[

Project Euler - problem 6
* http://projecteuler.net/problem=6

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.09.22

--]]


local squareSum = 0
local sum = 0
for i = 1, 100 do
	squareSum = squareSum + (i * i)
	sum = sum + i
end

print(sum * sum - squareSum)
