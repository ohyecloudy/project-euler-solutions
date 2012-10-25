--[[

Project Euler - problem 34
* http://projecteuler.net/problem=34

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- digit factorial을 사용하기 때문에 한자리수 팩토리얼을 구하면 된다
factorials = {}
do
	factorials[1] = 1
	for i = 2, 9 do
		factorials[i] = i * factorials[i-1]
	end

	-- 0! = 1
	factorials[0] = 1
end

assert(factorials[4] == 24)
assert(factorials[5] == 120)

function digits_iter(num)
	local n = num

	return function()
		if n == 0 then
			return nil
		end

		local digit = n % 10
		n = math.floor(n / 10)

		return digit
	end
end

function sum_digits_factorial(n)
	local sum = 0

	for d in digits_iter(n) do
		sum = sum + factorials[d]
	end

	return sum
end

-- 8자리 최대 합이 7자리다. 그래서 계산을 9999999까지만 하면 된다
sum = 0
for i = 3, 9999999 do
	if i == sum_digits_factorial(i) then
		sum = sum + i
	end
end

print(sum)
