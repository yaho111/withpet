package com.project.withpet.model;

import java.util.Date;

public class ReplyNotice {
	private int notReply_no;			// 댓글 번호
	private int not_no; 				//게시판 번호
	private String notReply_writer; 	//댓글 작성자
	private String notReply_content;	// 댓글 내용
	private Date regdate; 				// 작성일
	
	public int getNotReply_no() {
		return notReply_no;
	}
	public void setNotReply_no(int notReply_no) {
		this.notReply_no = notReply_no;
	}
	public int getNot_no() {
		return not_no;
	}
	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}
	public String getNotReply_writer() {
		return notReply_writer;
	}
	public void setNotReply_writer(String notReply_writer) {
		this.notReply_writer = notReply_writer;
	}
	public String getNotReply_content() {
		return notReply_content;
	}
	public void setNotReply_content(String notReply_content) {
		this.notReply_content = notReply_content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	


}
