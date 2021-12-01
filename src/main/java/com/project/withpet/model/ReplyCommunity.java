package com.project.withpet.model;

import java.util.Date;

public class ReplyCommunity {
	private int comReply_no;			// 댓글 번호
	private int com_no; 				//게시판 번호
	private String comReply_writer; 	//댓글 작성자
	private String comReply_content;	// 댓글 내용
	private Date regdate; 				// 작성일
	
	public int getComReply_no() {
		return comReply_no;
	}
	public int getCom_no() {
		return com_no;
	}
	public String getComReply_writer() {
		return comReply_writer;
	}
	public String getComReply_content() {
		return comReply_content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setComReply_no(int comReply_no) {
		this.comReply_no = comReply_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public void setComReply_writer(String comReply_writer) {
		this.comReply_writer = comReply_writer;
	}
	public void setComReply_content(String comReply_content) {
		this.comReply_content = comReply_content;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
