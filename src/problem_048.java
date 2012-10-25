/**
 * Project Euler - problem 48
 *   http://projecteuler.net/problem=48
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 *
 * 2012.10.08
 */

import java.math.BigInteger;

public class problem_048 {

	public static void main(String[] args) {
		BigInteger sum = new BigInteger("0");
		for (int i = 1; i <= 1000; ++i) {
			BigInteger bi = new BigInteger(Integer.toString(i));
			bi = bi.pow(i);
			
			sum = sum.add(bi);
		}
		
		String ret = sum.toString();
		System.out.println(ret.substring(ret.length() - 10));
	}

}
