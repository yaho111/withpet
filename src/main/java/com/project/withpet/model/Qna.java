package com.project.withpet.model;

import java.util.Date;

public class Qna {
	private int qna_no;			/* 번호 */
	private String qna_title;	/* 제목 */
	private String qna_writer;	/* 작성자 */
	private int qna_readcnt;	/* 조회수 */
	private Date qna_reg;		/* 작성일 */
	private String qna_content;	/* 내용 */
	private String qna_file;	/* 첨부파일 */ 
	private int qna_ref;		/* 댓글 그룹 */
	private int qna_lev; 		/* 댓글 레벨 */
	private int qna_seq;		/* 댓글 순서 */
	
	// page
	private int startRow;
	private int endRow;
	
	// 검색
	private String search;
	private String keyword;
		
	public int getQna_no() {
		return qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public int getQna_readcnt() {
		return qna_readcnt;
	}
	public Date getQna_reg() {
		return qna_reg;
	}
	public String getQna_content() {
		return qna_content;
	}
	public String getQna_file() {
		return qna_file;
	}
	public int getQna_ref() {
		return qna_ref;
	}
	public int getQna_lev() {
		return qna_lev;
	}
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public void setQna_readcnt(int qna_readcnt) {
		this.qna_readcnt = qna_readcnt;
	}
	public void setQna_reg(Date qna_reg) {
		this.qna_reg = qna_reg;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public void setQna_file(String qna_file) {
		this.qna_file = qna_file;
	}
	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}
	public void setQna_lev(int qna_lev) {
		this.qna_lev = qna_lev;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
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
}
