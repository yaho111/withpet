package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.ReplyNoticeDAO;
import com.project.withpet.model.ReplyNotice;

@Service
public class ReplyNoticeService {

	@Autowired
	private ReplyNoticeDAO replyNoticeDAO;
	
	// 댓글 목록
	public List<ReplyNotice> notRelist(int not_no) {
		System.out.println("댓글 목록 서비스");
		return replyNoticeDAO.notRelist(not_no);
	}

	// 댓글 입력
	public void notReInsert(ReplyNotice replyNotice) {
		System.out.println("댓글 입력 서비스");
		replyNoticeDAO.notReInsert(replyNotice);
	}
	
	// 댓글 수정
	public int notReUpdate(ReplyNotice replyNotice) {
		System.out.println("댓글 수정 서비스");
		return replyNoticeDAO.notReUpdate(replyNotice);
	}

	// 댓글 삭제
	public void notReDelete(int notReply_no) {
		System.out.println("댓글 삭제 서비스");
		replyNoticeDAO.notReDelete(notReply_no);
	}

	// 총데이터 구하기
//	public int getCount(ReplyNotice replyNotice) {
//		System.out.println("총데이터 서비스");
//		return replyNoticeDAO.getCount(replyNotice);
//	}


}
