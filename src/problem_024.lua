--[[

Project Euler - problem 24
* http://projecteuler.net/problem=24

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]

-- 자리 바꿈으로 permutation list를 구할 수 있으나 sort된 permutation을
-- 이 알고리즘으로 구할 수 없는 것 같다. 그래서 recursive algorithm을 사용
-- 참고 : http://www.lua.org/pil/9.3.html
-- 엄청 오래 걸린다. 커피 한 잔 마시고 오면 결과가 나와 있을 것이다.
-- coroutine 연습도 겸사겸사

table.copy = function (table_source)
	local table_dest = {}
	for k, v in pairs(table_source) do
		table_dest[k] = v
	end

	return table_dest
end

do
	local i = 0
	print_result = function(result_table)
		i = i + 1
		if i == 1000000 then
			print(table.concat(result_table))

			return true
		else
			return false
		end

	end
end

local function perm_gen(candidates, intermediate)
	if table.maxn(candidates) == 0 then
		coroutine.yield(intermediate)
		return
	end

	for i, _ in ipairs(candidates) do
		local cand = table.copy(candidates)
		local inter = table.copy(intermediate)

		table.insert(inter, cand[i])
		table.remove(cand, i)

		perm_gen(cand, inter)
	end
end

function perm(a)
	local co = coroutine.create(function () perm_gen(a, {}) end)
	return function () -- iterator
		local code, res = coroutine.resume(co)
		return res
	end
end

for p in perm{0, 1, 2, 3, 4, 5, 6, 7, 8, 9} do
	if print_result(p) then
		break
	end
end

