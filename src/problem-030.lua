--[[

Project Euler - problem 30
* http://projecteuler.net/problem=30

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


local function sum_powers_digits(num, pow)
	local sum = 0

	while num > 0 do
		sum = sum + math.pow(num % 10, pow)
		num = math.floor(num / 10)
	end

	return sum
end

-- 러프하게 계산. 9, 99 하나씩 증가하며 digit 5승 합을 구했을 때,
-- 999999부터 입력 수가 합을 초과한다.
-- 자리수 때문에 5승 합이 초과하지 못하는 경계선

local sum = 0
for i = 2, 999999 do
	if i == sum_powers_digits(i, 5) then
		sum = sum + i
	end
end

print(sum)
