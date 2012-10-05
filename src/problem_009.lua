--[[

Project Euler - problem 9
* http://projecteuler.net/problem=9

created by ohyecloudy
* https://github.com/ohyecloudy/project-euler-solutions

--]]


-- a = m^2 - n^2
-- b = 2mn
-- c = m^2 + n^2
-- a^2 + b^2 = c^2
-- where m > n

local function pythagorean_triples(m, n)
	return
		(math.pow(m, 2) - math.pow(n, 2)),
		(2 * m * n),
		(math.pow(m, 2) + math.pow(n, 2))
end

-- a + b + c = 1000 = m^2 + 2mn
for m = 1, math.sqrt(1000) do
	for n = 1, m - 1 do
		local a, b, c = pythagorean_triples(m, n)

		if a + b + c == 1000 then
			print(a * b * c)
			return
		end
	end
end
