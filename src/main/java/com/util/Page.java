	package com.util;
	
	public class Page {
		private int start = 0;
		private int count = 5;
		private int last = 0;
		private int totalPageCount;// 总页数
	
		public int getTotalPageCount() {
			return totalPageCount;
		}

		public void setTotalPageCount(int totalPageCount) {
			this.totalPageCount = totalPageCount;
		}

		public int getStart() {
			return start;
		}
	
		public void setStart(int start) {
			this.start = start;
		}
	
		public int getCount() {
			return count;
		}
	
		public void setCount(int count) {
			this.count = count;
		}
	
		public int getLast() {
			return last;
		}
	
		public void setLast(int last) {
			this.last = last;
		}
	
		public void calculateLast(int total) {
			// 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
			if (0 == total % count) {
				last = total - count;
			}
			// 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
			else {
				last = total - total % count;
			}
		}
	}
