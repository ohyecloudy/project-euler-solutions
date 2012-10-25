/**
 * Project Euler - problem 21
 *   http://projecteuler.net/problem=21
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 *
 * 2012.10.08
 */


public class problem_021 {
	
	static int calcProperDivisorsSum(int n) {
		int sum = 0;
		// n보다 작은 divisor를 구한다.
		for (int i = 1; i < n; ++i) {
			if ((n % i) == 0) {
				sum += i;
			}
		}
		return sum;
	}

	public static void main(String[] args) {
		int amicableNumbersSum = 0;
		for (int i = 1; i < 10000; ++i) {
			final int sum = problem_021.calcProperDivisorsSum(i);
			if ((problem_021.calcProperDivisorsSum(sum) == i) && (sum != i)) {
				amicableNumbersSum += i + sum;
			}
		}
		
		// 그냥 loop를 돌았기 때문에 쌍으로 더해진다. (220, 248), (248, 220)
		// 그래서 2로 나눔
		System.out.println(amicableNumbersSum / 2);
	}

}
