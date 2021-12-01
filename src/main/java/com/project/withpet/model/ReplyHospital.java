package com.project.withpet.model;

import java.util.Date;

public class ReplyHospital {
	private int hosReply_no;			// 댓글 번호
	private int hos_no; 				//게시판 번호
	private String hosReply_writer; 	//댓글 작성자
	private String hosReply_content;	// 댓글 내용
	private Date regdate; 				// 작성일
	public int getHosReply_no() {
		return hosReply_no;
	}
	
	public void setHosReply_no(int hosReply_no) {
		this.hosReply_no = hosReply_no;
	}
	public int getHos_no() {
		return hos_no;
	}
	public void setHos_no(int hos_no) {
		this.hos_no = hos_no;
	}
	public String getHosReply_writer() {
		return hosReply_writer;
	}
	public void setHosReply_writer(String hosReply_writer) {
		this.hosReply_writer = hosReply_writer;
	}
	public String getHosReply_content() {
		return hosReply_content;
	}
	public void setHosReply_content(String hosReply_content) {
		this.hosReply_content = hosReply_content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
