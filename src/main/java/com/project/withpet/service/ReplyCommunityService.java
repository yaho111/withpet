package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.ReplyCommunityDAO;
import com.project.withpet.model.ReplyCommunity;


@Service
public class ReplyCommunityService {

	@Autowired
	private ReplyCommunityDAO replyCommunityDAO;
	
	// 댓글 목록
	public List<ReplyCommunity> comRelist(int com_no) {
		System.out.println("댓글 목록 서비스");
		return replyCommunityDAO.comRelist(com_no);
	}

	// 댓글 입력
	public void comReInsert(ReplyCommunity replyCommunity) {
		System.out.println("댓글 입력 서비스");
		replyCommunityDAO.comReInsert(replyCommunity);
	}
	
	// 댓글 수정
	public int comReUpdate(ReplyCommunity replyCommunity) {
		System.out.println("댓글 수정 서비스");
		return replyCommunityDAO.comReUpdate(replyCommunity);
	}

	// 댓글 삭제
	public void comReDelete(int comReply_no) {
		System.out.println("댓글 삭제 서비스");
		replyCommunityDAO.comReDelete(comReply_no);
	}
}
