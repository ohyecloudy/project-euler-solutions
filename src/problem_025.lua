--[[

Project Euler - problem 25
* http://projecteuler.net/problem=25

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.10.01

--]]


big_num = {}
big_num.mt = {} -- metatable

function big_num.new(digit)
	local bn = { digit }
	setmetatable(bn, big_num.mt)

	return bn
end

function big_num.length(bn)
	return table.getn(bn)
end

function big_num.add(lhs, rhs)
	local short, long = lhs, rhs
	if big_num.length(lhs) > big_num.length(rhs) then
		short, long = rhs, lhs
	end

	local ret = big_num.new(0)
	local carry = 0
	for i = 1, big_num.length(long) do
		local short_digit = 0
		if i <= big_num.length(short) then
			short_digit = short[i]
		end

		ret[i] = long[i] + short_digit + carry
		carry = math.floor(ret[i] / 10)
		ret[i] = ret[i] % 10
	end

	if carry > 0 then
		table.insert(ret, carry)
	end

	return ret
end

big_num.mt.__add = big_num.add

function fibo_stream()
	local n0 = big_num.new(1)
	local n1 = big_num.new(1)
	local term = 0

	return function()
		while true do
			term = term + 1

			if term == 1 or term == 2 then
				return term, big_num.new(1)
			end

			local n = n0 + n1
			n0, n1 = n1, n

			return term, n
		end
	end
end

for i, v in fibo_stream() do
	if big_num.length(v) >= 1000 then
		print(i)
		return
	end
end
