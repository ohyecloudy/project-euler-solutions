--[[

Project Euler - problem 7
* http://projecteuler.net/problem=7

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- 문제 해답을 얻은 방법
do

	local function is_prime(num, primes)
		for _, v in ipairs(primes) do
			if num % v == 0 then
				return false
			end
		end

		return true
	end


	local function prime_gen(ordinal)
		local cur_ordinal = 0
		local num = 1

		local primes = {}

		while ordinal > cur_ordinal do
			num = num + 1

			if is_prime(num, primes) then
				table.insert(primes, num)
				cur_ordinal = cur_ordinal + 1
			end

		end

		return num
	end

	print(prime_gen(10001))

end


-- 풀이에 소개된 방법
--[[
유용한 소수 특징을 사용
* 1은 소수가 아님
* 2를 제외한 모든 소수는 홀수
* 3보다 큰 소수는 6k +- 1 로 표현할 수 있다
* sqrt(n)보다 큰 primefactor를 딱 하나만 가질 수 있다
** sqrt(n)보다 작거나 같은 수가 딱 나누어 떨어지지 않는다면 소수다
** sqrt(n)보다 큰 primefactor가 반드시 하나 존재하는데, 그게 자신이기 때문
--]]

do
	local function is_prime(n)
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

	local function prime_gen(ordinal)
		local cur_ordinal = 0
		local num = 1

		while ordinal > cur_ordinal do
			num = num + 1

			if is_prime(num) then
				cur_ordinal = cur_ordinal + 1
			end

		end

		return num
	end

	print(prime_gen(10001))

end
