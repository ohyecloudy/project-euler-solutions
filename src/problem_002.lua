--[[

Project Euler - problem 2
* http://projecteuler.net/problem=2

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.09.22

--]]


do
	local n_minus_2 = 0
	local n_minus_1 = 1

	next_fibo_term = function()
		n_minus_2, n_minus_1 = n_minus_1, n_minus_1 + n_minus_2
		return n_minus_1
	end
end

local sum = 0

local num = next_fibo_term()
while num < 4000000 do
	if num % 2 == 0 then
		sum = sum + num
	end

	num = next_fibo_term()
end

print(sum)
