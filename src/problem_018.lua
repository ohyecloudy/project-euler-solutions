--[[

Project Euler - problem 18
* http://projecteuler.net/problem=18

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]

local triangle_numbers =
{
	75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	95,64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	17,47,82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	18,35,87,10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	20,04,82,47,65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	19,01,23,75,03,34, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	88,02,77,73,07,63,67, 0, 0, 0, 0, 0, 0, 0, 0,
	99,65,04,28,06,16,70,92, 0, 0, 0, 0, 0, 0, 0,
	41,41,26,56,83,40,80,70,33, 0, 0, 0, 0, 0, 0,
	41,48,72,33,47,32,37,16,94,29, 0, 0, 0, 0, 0,
	53,71,44,65,25,43,91,52,97,51,14, 0, 0, 0, 0,
	70,11,33,28,77,73,17,78,39,68,17,57, 0, 0, 0,
	91,71,52,38,17,14,91,43,58,50,27,29,48, 0, 0,
	63,66,04,68,89,53,67,30,73,16,69,87,40,31, 0,
	05,62,98,27,23,09,70,98,73,93,38,53,60,04,23,
}

local function index(x, y)
	if x <= 0 or x > 15 then
		return nil
	end
	if y <= 0 or y > 15 then
		return nil
	end

	return (y - 1) * 15 + x
end
assert(index(1, 1) == 1)
assert(index(15, 1) == 15)
assert(index(1, 2) == 16)

do
	local oldMax = math.max
	math.max = function(x, y)
		if x == nil then
			return y
		elseif y == nil then
			return x
		else
			return oldMax(x, y)
		end
	end
end

-- 밑으로 가면서 최대 값을 누적시킨다
-- 답은 맨 밑 row에 있는 최대값

for y = 2, 15 do
	for x = 1, 15 do
		triangle_numbers[index(x, y)] =
			triangle_numbers[index(x, y)] +
			math.max(
				triangle_numbers[index(x, y-1)],
				triangle_numbers[index(x-1, y-1)])
	end
end

local max_total = 0
for i = 1, 15 do
	max_total = math.max(max_total, triangle_numbers[index(i, 15)])
end

print(max_total)
