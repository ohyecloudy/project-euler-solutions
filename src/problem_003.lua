--[[

Project Euler - problem 3
* http://projecteuler.net/problem=3

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.09.27

--]]


function last_factor(num)

	local factor = 2
	local last = 1

	while num > 1 do
		while num % factor == 0 do
			last = factor
			num = math.floor(num / factor)
		end

		factor = factor + 1
	end

	return last

end

print(last_factor(600851475143))
