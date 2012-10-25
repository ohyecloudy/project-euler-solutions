/**
 * Project Euler - problem 48
 *   http://projecteuler.net/problem=48
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 *
 * 2012.10.08
 */

import static org.junit.Assert.*;

import org.junit.Test;
import java.math.BigInteger;

public class problem_048_test {

	@Test
	public void testBigInteger() {
		BigInteger bi1 = new BigInteger("2");
		assertEquals("1024", bi1.pow(10).toString());
		assertEquals("BigInteger는 immutable하기 때문", "2", bi1.toString());
		
		BigInteger bi2 = new BigInteger("2048");
		assertEquals("2050", (bi1.add(bi2)).toString());
	}
	
	@Test
	public void testSubstr() {
		String str = "abcdefghijklmnopqrstuvwxyz";
		assertEquals("qrstuvwxyz", str.substring(str.length() - 10));
	}

}
