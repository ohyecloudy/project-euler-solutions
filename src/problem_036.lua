--[[

Project Euler - problem 36
* http://projecteuler.net/problem=36

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]

function base2_from(base10)
	digits = {}
	while base10 > 0 do
		-- 결과에서 뒤집을 필요 없이 앞에 넣는다
		table.insert(digits, 1, base10 % 2)
		base10 = math.floor(base10 / 2)
	end

	return table.concat(digits)
end

function is_palindromic(n)
	return n == string.reverse(n)
end

-- coroutine 연습
function palindrom_gen(min, max)
	for i = min, max do
		if is_palindromic(tostring(i)) and is_palindromic(base2_from(i)) then
			coroutine.yield(i)
		end
	end
end

function palindrom(min, max)
	local co = coroutine.create(
		function()
			palindrom_gen(min, max)
		end)

	return function()
		local code, res = coroutine.resume(co)
		return res
	end
end

sum = 0
for num in palindrom(1, 1000000) do
	sum = sum + num
end

print(sum)
