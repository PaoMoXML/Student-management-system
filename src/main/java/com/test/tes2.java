/**
 * @author XuMenglin
 * @date 2019年8月17日
 *
 */
package com.test;

import java.text.SimpleDateFormat;

/**
 * <p>Title: tes2</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月17日
 */
public class tes2 {

		private static long n = 1;
		public static void main(String[] args) {
		System.out.println(test(n));
		System.out.println(test(n));
		}
		public static long test(long l) {
		String str = new SimpleDateFormat("yyyyMM")
		.format(new java.util.Date());
		long m = Long.parseLong((str)) * 10000;
		long ret = m + l;
		n = l + 1;
		return ret;
		}


}
