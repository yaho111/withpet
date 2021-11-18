
package com.project.withpet.model;

import java.sql.Date;

public class Hospital {
		private int hos_no;			/* 번호 */
		private String hos_name;  	/* 동물병원 이름 */
		private String hos_writer;  /* 작성자 */
		private String hos_addr;  	/* 주소 */
		private String hos_tel;  	/* 전화번호 */
		private String hos_file;  	/* 병원 이미지 */
		private String hos_time;  	/* 운영시간 */
		private String hos_24;  	/* 24시 여부 */
		private String hos_holiday;	/* 연중무휴 여부 */
		private String hos_parking;	/* 주차 가능 여부 */
		private String hos_content;	/* 병원 소개 */
		private String hos_link;  	/* 링크 */
		private int hos_readcnt;  	/* 조회수 */
		private int hos_likecnt;	/* 추천수 */
		private Date hos_reg;		/* 작성일 */
		
		// page
		private int startRow;
		private int endRow;
		
		// 검색
		private String search;
		private String keyword;
		
		public int getHos_no() {
			return hos_no;
		}
		public void setHos_no(int hos_no) {
			this.hos_no = hos_no;
		}
		public String getHos_name() {
			return hos_name;
		}
		public void setHos_name(String hos_name) {
			this.hos_name = hos_name;
		}
		public String getHos_writer() {
			return hos_writer;
		}
		public void setHos_writer(String hos_writer) {
			this.hos_writer = hos_writer;
		}
		public String getHos_addr() {
			return hos_addr;
		}
		public void setHos_addr(String hos_addr) {
			this.hos_addr = hos_addr;
		}
		public String getHos_tel() {
			return hos_tel;
		}
		public void setHos_tel(String hos_tel) {
			this.hos_tel = hos_tel;
		}
		public String getHos_file() {
			return hos_file;
		}
		public void setHos_file(String hos_file) {
			this.hos_file = hos_file;
		}
		public String getHos_time() {
			return hos_time;
		}
		public void setHos_time(String hos_time) {
			this.hos_time = hos_time;
		}
		public String getHos_24() {
			return hos_24;
		}
		public void setHos_24(String hos_24) {
			this.hos_24 = hos_24;
		}
		public String getHos_holiday() {
			return hos_holiday;
		}
		public void setHos_holiday(String hos_holiday) {
			this.hos_holiday = hos_holiday;
		}
		public String getHos_parking() {
			return hos_parking;
		}
		public void setHos_parking(String hos_parking) {
			this.hos_parking = hos_parking;
		}
		public String getHos_content() {
			return hos_content;
		}
		public void setHos_content(String hos_content) {
			this.hos_content = hos_content;
		}
		public String getHos_link() {
			return hos_link;
		}
		public void setHos_link(String hos_link) {
			this.hos_link = hos_link;
		}
		public int getHos_readcnt() {
			return hos_readcnt;
		}
		public void setHos_readcnt(int hos_readcnt) {
			this.hos_readcnt = hos_readcnt;
		}
		public int getHos_likecnt() {
			return hos_likecnt;
		}
		public void setHos_likecnt(int hos_likecnt) {
			this.hos_likecnt = hos_likecnt;
		}
		public Date getHos_reg() {
			return hos_reg;
		}
		public void setHos_reg(Date hos_reg) {
			this.hos_reg = hos_reg;
		}
		public int getStartRow() {
			return startRow;
		}
		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}
		public int getEndRow() {
			return endRow;
		}
		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}
		public String getSearch() {
			return search;
		}
		public void setSearch(String search) {
			this.search = search;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}	
}

