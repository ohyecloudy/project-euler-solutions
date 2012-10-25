--[[

Project Euler - problem 67
* http://projecteuler.net/problem=67

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

2012.09.25

--]]


local max_total = { 0 }

local function token_iter(line)
	local sub_start = 1
	local index = 0
	local n = string.len(line)
	local delimiter = " "

	return	function()
		if sub_start > n then
			return nil
		end

		local sub_end = string.find(line, delimiter, sub_start)
		if sub_end == nil then -- 마지막 token을 가져오는 경우
			sub_end = n
		else
			sub_end = sub_end - 1
		end

		local token = string.sub(line, sub_start, sub_end)
		sub_start = sub_end + 2 -- delimiter 다음 문자
		index = index + 1

		return index, tonumber(token)
	end
end

-- math.max 는 인자로 넘어온 nil을 처리 못하므로 재정의
do
	local old_max = math.max

	math.max = function(a, b)
		if a == nil then
			return b
		end
		if b == nil then
			return a
		end

		return old_max(a, b)
	end
end

for line in io.lines("problem_067_input.txt") do

	-- 바로 max_total에 더할 경우 다음 숫자에서 참조하기 때문에
	-- 현재 라인 숫자를 더한 걸 따로 유지하고 끝나면 max_total에 쓴다
	local cur_line_sum_result = {}

	for i, num in token_iter(line) do
		cur_line_sum_result[i] = num + math.max(max_total[i - 1], max_total[i])
	end

	max_total = cur_line_sum_result
end

local max = 0
for _, v in ipairs(max_total) do
	max = math.max(max, v)
end

print(max)
