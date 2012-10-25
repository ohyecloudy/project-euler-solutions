--[[

Project Euler - problem 4
* http://projecteuler.net/problem=4

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.09.23

--]]


local palidromic = 0
for i=100, 999 do
	for j=100, 999 do
		local num = i * j
		if num == tonumber(string.reverse(num)) then
			palidromic = math.max(palidromic, num)
		end
	end
end

print(palidromic)
