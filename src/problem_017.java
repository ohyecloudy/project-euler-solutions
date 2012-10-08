/**
 * Project Euler - problem 17
 *   http://projecteuler.net/problem=17
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 */

class NumberConverter {
	
	static String[] onesDigit = {
		"ZERO_IS_NOT_USED", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
	};
	
	static String[] twoDigit = {
		"ZERO_IS_NOT_USED", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",  
	};
	
	static String[] tensDigit = {
		"ZERO_IS_NOT_USED", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", 
	};
	
	static String toWords(int n) {
		StringBuilder sb = new StringBuilder();
		
		while (n > 0) {
			final boolean needAnd = (n / 100) > 0;
			
			n = appendWords(sb, n);
			
			// 100의 자리가 넘을 때, 뒤에 숫자가 더 있으면 and를 붙여준다.
			if (needAnd && (n > 0)) {
				sb.append("and");
			}
		}
		
		return sb.toString();
	}
	
	static int appendWords(StringBuilder outString, int n) {
		if (n < onesDigit.length) {
			outString.append(onesDigit[n]);
			return 0; 
		} else if (10 < n && n < 20) {
			outString.append(twoDigit[n - 10]);
			return 0;
		} else if (10 <= n && n <= 99) {
			int tens = (n / 10);
			outString.append(tensDigit[tens]);
			return (n % 10);
		} else if (100 <= n && n <= 999) {
			int hundreds = (n / 100);
			outString.append(onesDigit[hundreds]);
			outString.append("hundred");
			return (n % 100);
		} else {
			outString.append("onethousand");
			return 0;
		}
	}
	
}

public class problem_017 {

	public static void main(String[] args) {
		int total = 0;
		for (int i = 1; i <= 1000; ++i) {
			total += NumberConverter.toWords(i).length();
		}
		
		System.out.println(total);
	}

}
