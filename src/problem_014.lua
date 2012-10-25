--[[

Project Euler - problem 14
* http://projecteuler.net/problem=14

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.09.24

--]]

local count_memoization = {}

local function chain_count(num)
	if num == 1 then
		return 1
	end

	if count_memoization[num] ~= nil then
		return count_memoization[num]
	end

	if num % 2 == 0 then
		num = num / 2
	else
		num = 3 * num + 1
	end

	return 1 + chain_count(num)
end

local start_number = 1
local max_chain_count = 1

local start_clock = os.clock()
for i = 1, 999999 do
	local count = chain_count(i)
	count_memoization[i] = count

	if count > max_chain_count then
		max_chain_count = count
		start_number = i
	end
end

print(string.format("elapsed time: %.3fs", os.clock() - start_clock))
print("start number - "..start_number..", chain count - "..max_chain_count)

-- with memoization : 1.462s
-- without memoization : 18.698s
