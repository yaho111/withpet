package com.project.withpet.model;

import java.util.Date;

    public class ReplyProduct {
        private int proReply_no;			// 댓글 번호
        private int pro_no; 				//게시판 번호
        private String proReply_writer; 	//댓글 작성자
        private String proReply_content;	// 댓글 내용
        private Date regdate; 				// 작성일

        public int getProReply_no() {
            return proReply_no;
        }

        public void setProReply_no(int proReply_no) {
            this.proReply_no = proReply_no;
        }

        public int getPro_no() {
            return pro_no;
        }

        public void setPro_no(int pro_no) {
            this.pro_no = pro_no;
        }

        public String getProReply_writer() {
            return proReply_writer;
        }

        public void setProReply_writer(String proReply_writer) {
            this.proReply_writer = proReply_writer;
        }

        public String getProReply_content() {
            return proReply_content;
        }

        public void setProReply_content(String proReply_content) {
            this.proReply_content = proReply_content;
        }

        public Date getRegdate() {
            return regdate;
        }

        public void setRegdate(Date regdate) {
            this.regdate = regdate;
        }
    }

