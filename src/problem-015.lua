--[[

Project Euler - problem 15
* http://projecteuler.net/problem=15

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- in_count[1,1] 이렇게는 사용 못하지만 이런 함수를 거치면 사용가능
local function key(x,y)
	return x, y
end

-- in_count : 해당 cell에 들어올 수 있는 경우의 수를 저장한다
local in_count = {}
in_count[key(1,1)] = 1

local function sum_left_top(x, y)
	local sum = 0

	if in_count[key(x - 1, y)] ~= nil then
		sum = sum + in_count[key(x - 1, y)];
	end

	if in_count[key(x, y - 1)] ~= nil then
		sum = sum + in_count[key(x, y - 1)];
	end

	return sum
end

for y = 1, 21 do
	for x = 1, 21 do
		if x ~= 1 or y ~= 1 then
			in_count[key(x, y)] = sum_left_top(x, y)
		end
	end
end

print(in_count[key(21, 21)])

