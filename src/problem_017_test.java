/**
 * Project Euler - problem 17
 *   http://projecteuler.net/problem=17
 * 
 * @author ohyecloudy
 *   https://github.com/ohyecloudy/project-euler-solutions
 *
 * 2012.10.08
 */

import static org.junit.Assert.*;

import org.junit.Test;


public class problem_017_test {

	@Test
	public void testOneDigit() {
		assertEquals("one", NumberConverter.toWords(1));
		assertEquals("two", NumberConverter.toWords(2));
		assertEquals("three", NumberConverter.toWords(3));
		assertEquals("four", NumberConverter.toWords(4));
		assertEquals("five", NumberConverter.toWords(5));
		assertEquals("six", NumberConverter.toWords(6));
		assertEquals("seven", NumberConverter.toWords(7));
		assertEquals("eight", NumberConverter.toWords(8));
		assertEquals("nine", NumberConverter.toWords(9));
	}
	
	@Test
	public void testTwoDigits() {
		assertEquals("eleven", NumberConverter.toWords(11));
		assertEquals("twelve", NumberConverter.toWords(12));
		assertEquals("thirteen", NumberConverter.toWords(13));
		assertEquals("fourteen", NumberConverter.toWords(14));
		assertEquals("fifteen", NumberConverter.toWords(15));
		assertEquals("sixteen", NumberConverter.toWords(16));
		assertEquals("seventeen", NumberConverter.toWords(17));
		assertEquals("eighteen", NumberConverter.toWords(18));
		assertEquals("nineteen", NumberConverter.toWords(19));
		
		assertEquals("twentyfour", NumberConverter.toWords(24));
		assertEquals("thirtyseven", NumberConverter.toWords(37));
		assertEquals("thirtynine", NumberConverter.toWords(39));
		assertEquals("fortyone", NumberConverter.toWords(41));
		assertEquals("fiftytwo", NumberConverter.toWords(52));
		assertEquals("sixtythree", NumberConverter.toWords(63));
		assertEquals("seventyfive", NumberConverter.toWords(75));
		assertEquals("eightysix", NumberConverter.toWords(86));
		assertEquals("ninetyeight", NumberConverter.toWords(98));
	}
	
	@Test
	public void testTensDigits() {
		assertEquals("ten", NumberConverter.toWords(10));
		assertEquals("twenty", NumberConverter.toWords(20));
		assertEquals("thirty", NumberConverter.toWords(30));
		assertEquals("forty", NumberConverter.toWords(40));
		assertEquals("fifty", NumberConverter.toWords(50));
		assertEquals("sixty", NumberConverter.toWords(60));
		assertEquals("seventy", NumberConverter.toWords(70));
		assertEquals("eighty", NumberConverter.toWords(80));
		assertEquals("ninety", NumberConverter.toWords(90));
	}
	
	@Test
	public void testThreeDigits() {
		assertEquals("onehundredandfifteen", NumberConverter.toWords(115));;
		assertEquals("threehundredandfortytwo", NumberConverter.toWords(342));
	}
	
	@Test
	public void testHundredsDigits() {
		assertEquals("onehundred", NumberConverter.toWords(100));
		assertEquals("twohundred", NumberConverter.toWords(200));
		assertEquals("threehundred", NumberConverter.toWords(300));
		assertEquals("fourhundred", NumberConverter.toWords(400));
		assertEquals("fivehundred", NumberConverter.toWords(500));
		assertEquals("sixhundred", NumberConverter.toWords(600));
		assertEquals("sevenhundred", NumberConverter.toWords(700));
		assertEquals("eighthundred", NumberConverter.toWords(800));
		assertEquals("ninehundred", NumberConverter.toWords(900));
	}
	
	@Test
	public void testThousandsDigits() {
		assertEquals("onethousand", NumberConverter.toWords(1000));
	}
}
