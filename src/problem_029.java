/**
 * Project Euler - problem 29
 *   http://projecteuler.net/problem=29
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 */

import java.util.*;
import java.math.*;

class CombiNumbersIterable implements Iterable<BigInteger> {
	private int minA, maxA, minB, maxB;
	public CombiNumbersIterable (int minA, int maxA, int minB, int maxB) {
		this.minA = minA;
		this.maxA = maxA;
		this.minB = minB;
		this.maxB = maxB;
	}
	
	public Iterator<BigInteger> iterator() {
		return new Iterator<BigInteger>() {
			private int curA = minA;
			private int curB = minB;
			
			public boolean hasNext() {
				return ((curA <= maxA) && (curB <= maxB));
			}
			
			public BigInteger next() {
				BigInteger bi = new BigInteger(String.format("%d", curA));
				bi = bi.pow(curB);
				
				curB++;
				if (curB > maxB) {
					curB = minB;
					curA++;
				}
				
				return bi;
			}
			
			public void remove() {
				throw new UnsupportedOperationException();
			}
		};
	}
}

// 소인수 분해를 해서 중복을 제거하는 방법으로도 구할 수 있다.
// 4^2 = (2^2)^2 = 2^4
public class problem_029 {

	public static void main(String[] args) {
		
		Set<BigInteger> set = new HashSet<BigInteger>();
		
		for (BigInteger bi : new CombiNumbersIterable(2, 100, 2, 100)) {
			set.add(bi);
		}
		
		System.out.println(set.size());

	}

}
