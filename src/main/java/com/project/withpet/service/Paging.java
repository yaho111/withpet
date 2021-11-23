package com.project.withpet.service;

// 글목록 파트
public class Paging {

		// 기본 변수
		private int totalData;			// 총 데이터 갯수
		private int limit;				// 화면에 출력할 데이터 갯수
		private int currentPage;		// 현재 페이지 번호
		
		// 파생된 변수
		private int block = 10;    		// 블럭당 페이지 갯수 (1개의 블럭당 10개의 페이지)
		private int startPage;			// 각 블럭의 시작 페이지
		private int endPage;            // 각 블럭의 끝 페이지
		private int allPage;			// 총 페이지 수

		public Paging(int totalData, int limit, int currentPage) {
			
			// 기본 변수
			this.totalData = totalData;
			this.limit = limit;
			this.currentPage = currentPage;
						
			// 파생된 변수
			allPage = (int) Math.ceil((double) totalData / limit);	// 총 페이지 수
			startPage = currentPage - (currentPage - 1) % block;	// 1,  11, 21...
			endPage = startPage + block - 1;						// 10, 20, 30...
			if (endPage > allPage)	// 실제 존제하는 페이지만 존제 하게 한다. 
				endPage = allPage;
		}

		public int getTotalData() {
			return totalData;
		}

		public int getLimit() {
			return limit;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public int getBlock() {
			return block;
		}

		public int getStartPage() {
			return startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public int getAllPage() {
			return allPage;
		}

		public void setTotalData(int totalData) {
			this.totalData = totalData;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public void setBlock(int block) {
			this.block = block;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public void setAllPage(int allPage) {
			this.allPage = allPage;
		}
		
	
}
