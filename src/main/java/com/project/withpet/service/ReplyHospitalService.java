package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.ReplyHospitalDAO;
import com.project.withpet.model.ReplyHospital;

@Service
public class ReplyHospitalService {

	@Autowired
	private ReplyHospitalDAO replyHospitalDAO;
	
	// 댓글 목록
	public List<ReplyHospital> hosRelist(int hos_no) {
		System.out.println("댓글 목록 서비스");
		return replyHospitalDAO.hosRelist(hos_no);
	}

	// 댓글 입력
	public void hosReInsert(ReplyHospital replyHospital) {
		System.out.println("댓글 입력 서비스");
		replyHospitalDAO.hosReInsert(replyHospital);
	}
	
	// 댓글 수정
	public int hosReUpdate(ReplyHospital replyHospital) {
		System.out.println("댓글 수정 서비스");
		return replyHospitalDAO.hosReUpdate(replyHospital);
	}

	// 댓글 삭제
	public void hosReDelete(int hosReply_no) {
		System.out.println("댓글 삭제 서비스");
		replyHospitalDAO.hosReDelete(hosReply_no);
	}
}
