/**
 * Project Euler - problem 21
 *   http://projecteuler.net/problem=21
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 *
 * 2012.10.08
 */

import static org.junit.Assert.*;

import org.junit.Test;


public class problem_021_test {

	@Test
	public void testCalcProperDivisorsSum() {
		assertEquals(284, problem_021.calcProperDivisorsSum(220));
		assertEquals(220, problem_021.calcProperDivisorsSum(284));;
	}

}
