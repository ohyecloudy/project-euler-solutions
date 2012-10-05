--[[

Project Euler - problem 13
* http://projecteuler.net/problem=13

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


big_num = {}
big_num.mt = {} -- metatable

function big_num.new(num_str)
	local bn = {}
	setmetatable(bn, big_num.mt)

	for i = string.len(num_str), 1, -1 do
		table.insert(
			bn,
			tonumber(string.sub(num_str, i, i)))
	end

	return bn
end

function big_num.length(bn)
	return table.maxn(bn)
end

function big_num.add(lhs, rhs)
	local dest, src = lhs, rhs
	if big_num.length(rhs) > big_num.length(lhs) then
		dest, src = rhs, lhs
	end

	local carry = 0
	for i = 1, big_num.length(dest) do
		local src_digit = 0
		if i <= big_num.length(src) then
			src_digit = src[i]
		end

		dest[i] = dest[i] + src_digit + carry
		carry = math.floor(dest[i] / 10)
		dest[i] = dest[i] % 10
	end

	if carry > 0 then
		table.insert(dest, carry)
	end

	return dest
end

function big_num.tostring(bn)
	return string.reverse(table.concat(bn))
end

big_num.mt.__tostring = big_num.tostring
big_num.mt.__add = big_num.add


local sum = big_num.new("0")

for line in io.lines("problem_013_input.txt") do

	local src = big_num.new(line)
	sum = sum + src
end

print(sum)
print(string.sub(big_num.tostring(sum), 1, 10))
