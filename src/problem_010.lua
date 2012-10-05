--[[

Project Euler - problem 10
* http://projecteuler.net/problem=10

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- problem 7 참고
function is_prime(n)
	if n == 1 then
		return false
	elseif n < 4 then
		return true -- 2, 3
	elseif (n % 2) == 0 then
		return false
	elseif n < 9 then
		return true
	elseif (n % 3) == 0 then
		return false
	else
		local r = math.floor(math.sqrt(n))
		local f = 5

		while f <= r do
			-- 6k - 1로 표현되는 소수가 prime factor
			if (n % f) == 0 then
				return false
			end
			-- 6k + 1로 표현되는 소수가 prime factor
			if (n % (f+2)) == 0 then
				return false
			end

			f = f + 6
		end

		-- sqrt(n)보다 작거나 같은 primefactor가 없기 때문에
		-- n이 소수
		return true
	end
end


sum = 0
for i= 1, 2000000 do
	if is_prime(i) then
		sum = sum + i
	end
end

print(sum)
