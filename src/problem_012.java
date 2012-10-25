/**
 * Project Euler - problem 12
 *   http://projecteuler.net/problem=12
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 *
 * 2012.10.05
 */

import java.util.*;

class TriangleStream implements Iterable<Integer> {
	private int maxNum;
	public TriangleStream(int max) {
		maxNum = max;
	}
	
	public Iterator<Integer> iterator() {
		return new Iterator<Integer>() {
			private int accum = 0;
			private int curNum = 1;
			
			public boolean hasNext() {
				return curNum <= maxNum;
			}
			
			public Integer next() {
				accum += curNum;
				curNum++;
				return accum;
			}
			
			public void remove() {
				throw new UnsupportedOperationException();
			}
		};
	}
}

public class problem_012 {
	static int calcDivisorsCount(int n) {
		final int sqrtVal = (int)Math.floor(Math.sqrt(n));
		int count = 0;
		for (int i = 1; i <= sqrtVal; ++i) {
			if (n % i == 0) {
				count++;
			}
		}
		
		// sqrt 이전까지 나누어 떨어지는 수를 구했기 때문에 2를 곱해서 전체 개수를 구한다.
		count *= 2;
		if (sqrtVal * sqrtVal == n) {
			// 제곱근이 존재할 때는 쌍으로 존재하지 않기 때문에 빼준다.
			// 예) 49 일때, 7은 하나 존재.
			count -= 1;
		}
			
		return count;
	}

	public static void main(String[] args) {
		for (int n : new TriangleStream(100000)) {
			if (problem_012.calcDivisorsCount(n) >= 500) {
				System.out.println(n);
				return;
			}
		}
	}
}
