/**
 * Project Euler - problem 12
 *   http://projecteuler.net/problem=12
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 */

import static org.junit.Assert.*;
import org.junit.Test;

public class problem_012_test {
	@Test
	public void testSqrt() {
		assertEquals(5, (int)Math.floor(Math.sqrt(25)));
		assertEquals(5, (int)Math.floor(Math.sqrt(35)));
	}
	
	@Test
	public void testCalcDivisorsCount() {
		assertEquals(1, problem_012.calcDivisorsCount(1));
		assertEquals(2, problem_012.calcDivisorsCount(3));
		assertEquals(3, problem_012.calcDivisorsCount(49));
		assertEquals(4, problem_012.calcDivisorsCount(6));
		assertEquals(4, problem_012.calcDivisorsCount(10));
		assertEquals(4, problem_012.calcDivisorsCount(15));
		assertEquals(4, problem_012.calcDivisorsCount(21));
		assertEquals(6, problem_012.calcDivisorsCount(28));
	}
}
