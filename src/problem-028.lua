--[[

Project Euler - problem 28
* http://projecteuler.net/problem=28

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- matrix를 만들 필요 없다. 급수 문제.
local sum_diagonal = 1

local cur_num = 1
for i = 2, 1000, 2 do
	for j = 1, 4 do
		cur_num = cur_num + i
		sum_diagonal = sum_diagonal + cur_num
	end
end

print(sum_diagonal)
