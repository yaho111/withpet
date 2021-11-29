package com.project.withpet.model;


import java.util.Date;

public class Community {
	
	    private int com_no;
	    private String com_title;
	    private String com_writer;
	    private int com_readcnt;
	    private Date com_reg;
	    private String com_content;
	    private String com_file;	// 첨부파일
	    private int com_likecnt;
	    private int startRow;
	    private int endRow;	  
	    
	    
	 // 검색
		private String search;
		private String keyword;
		
		public String getKeyword() {
			return keyword;
		}
		public void setkeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getSearch() {
			return search;
		}
		public void setSearch(String search) {
			this.search = search;
		}
		public int getCom_no() {
			return com_no;
		}
		public String getCom_title() {
			return com_title;
		}
		public String getCom_writer() {
			return com_writer;
		}
		public int getCom_readcnt() {
			return com_readcnt;
		}
		public Date getCom_reg() {
			return com_reg;
		}
		public String getCom_content() {
			return com_content;
		}
		public String getCom_file() {
			return com_file;
		}
		public int getCom_likecnt() {
			return com_likecnt;
		}
		public void setCom_no(int com_no) {
			this.com_no = com_no;
		}
		public void setCom_title(String com_title) {
			this.com_title = com_title;
		}
		public void setCom_writer(String com_writer) {
			this.com_writer = com_writer;
		}
		public void setCom_readcnt(int com_readcnt) {
			this.com_readcnt = com_readcnt;
		}
		public void setCom_reg(Date com_reg) {
			this.com_reg = com_reg;
		}
		public void setCom_content(String com_content) {
			this.com_content = com_content;
		}
		public void setCom_file(String com_file) {
			this.com_file = com_file;
		}
		public void setCom_likecnt(int com_likecnt) {
			this.com_likecnt = com_likecnt;
		}
		public int getStartRow() {
			return startRow;
		}
		public int getEndRow() {
			return endRow;
		}
		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}
		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}

	}