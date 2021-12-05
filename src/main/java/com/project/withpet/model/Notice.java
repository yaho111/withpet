package com.project.withpet.model;

import java.util.Date;

public class Notice {

	private int not_no;				/* 번호 */
	private String not_title;		/* 제목 */
	private String not_writer;		/* 작성자 */
	private int not_readcnt;		/* 조회수 */
	private Date not_reg;			/* 작성일 */
	private String not_content;		/* 내용 */
	private String not_file;		/* 첨부파일 */ 
	private String noticeFileName;	/* 첨부파일이름 저장 */ 
	
	// page
	private int startRow;
	private int endRow;
	
	// 검색
	private String search;
	private String keyword;
	
	public int getNot_no() {
		return not_no;
	}
	public String getNot_title() {
		return not_title;
	}
	public String getNot_writer() {
		return not_writer;
	}
	public int getNot_readcnt() {
		return not_readcnt;
	}
	public Date getNot_reg() {
		return not_reg;
	}
	public String getNot_content() {
		return not_content;
	}
	public String getNot_file() {
		return not_file;
	}
	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public void setNot_writer(String not_writer) {
		this.not_writer = not_writer;
	}
	public void setNot_readcnt(int not_readcnt) {
		this.not_readcnt = not_readcnt;
	}
	public void setNot_reg(Date not_reg) {
		this.not_reg = not_reg;
	}
	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}
	public void setNot_file(String not_file) {
		this.not_file = not_file;
	}
	
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public String getSearch() {
		return search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	public String getNoticeFileName() {
		return noticeFileName;
	}
	public String setNoticeFileName(String noticeFileName) {
		return this.noticeFileName = noticeFileName;
	}
	
}
