--[[

Project Euler - problem 20
* http://projecteuler.net/problem=20

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- 2^1000 number로 표현 불가능. big number를 간단히 만들어서 해결
big_num = {}

function big_num.new(init_digit)
	return { init_digit }
end

function digits_reverse_iter(num)
	local n = num
	return function()
		if n == 0 then
			return nil
		end

		digit = n % 10
		n = math.floor(n / 10)

		return digit
	end
end

function big_num.multiply_by(bn, num)

	local carry = 0

	for i = 1, table.maxn(bn) do
		bn[i] = bn[i] * num + carry

		carry = math.floor(bn[i] / 10)
		bn[i] = bn[i] % 10
	end

	-- 남은 carry가 몇자리수 인지 보장할 수 없기 때문
	for digit in digits_reverse_iter(carry) do
		table.insert(bn, digit)
	end

end

bn = big_num.new(1)

-- 100!
for i = 100, 1, -1 do
	big_num.multiply_by(bn, i)
end

table.sum_digits = function(table)
	local sum = 0
	for _, v in ipairs(table) do
		sum = sum + v
	end

	return sum
end


print(table.sum_digits(bn))
