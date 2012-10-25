--[[

Project Euler - problem 16
* http://projecteuler.net/problem=16

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- 2^1000 number로 표현 불가능. big number를 간단히 만들어서 해결
big_num = {}
-- metatable 연습
big_num.mt = {}
big_num.mt.__tostring = function(bn)
	return string.reverse(table.concat(bn))
end

function big_num.new(init_digit)
	local bn = { init_digit }
	setmetatable(bn, big_num.mt)

	return bn
end

function big_num.multiply_by_2(bn)

	local carry = 0
	for i = 1, table.maxn(bn) do
		bn[i] = bn[i] * 2 + carry

		carry = math.floor(bn[i] / 10)
		bn[i] = bn[i] % 10
	end

	if carry > 0 then
		table.insert(bn, carry)
	end
end

bn = big_num.new(1)
for i = 1, 1000 do
	big_num.multiply_by_2(bn)
end

print(bn)

sum_digits = 0
for _, v in ipairs(bn) do
	sum_digits = sum_digits + v
end

print(sum_digits)
