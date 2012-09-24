--[[

Project Euler - problem 5
* http://projecteuler.net/problem=5

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]

-- lcm = a * b / gcd(a, b)
local function lcm(a, b)
	-- Euclid algorithm
	local function gcd(a, b)
		if b > a then
			-- 실행하기 전 evaluate을 하기 때문에
			-- 이렇게 swap이 가능
			a, b = b, a
		end

		if b == 0 then
			return a
		end

		return gcd(b, a % b)
	end

	return (a * b) / gcd(a, b)
end

local lcmValue = 1
for i = 1, 20 do
	lcmValue = lcm(lcmValue, i)
end

print(lcmValue)
