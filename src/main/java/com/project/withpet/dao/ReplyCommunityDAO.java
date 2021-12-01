package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.ReplyCommunity;

@Repository
public class ReplyCommunityDAO {

	@Autowired
	private SqlSessionTemplate comReplySql;
	
	// 글 목록 구하기
	public List<ReplyCommunity> comRelist(int com_no) {
		System.out.println("댓글 목록 DAO");
		return comReplySql.selectList("comReplyns.comRelist", com_no);
	}

	// 댓글 입력
	public void comReInsert(ReplyCommunity replyCommunity) {
		System.out.println("댓글 입력 DAO");
		comReplySql.insert("comReplyns.comReInsert", replyCommunity);
		
	}

	// 댓글 수정
	public int comReUpdate(ReplyCommunity replyCommunity) {
		System.out.println("댓글 수정 DAO");
		return comReplySql.update("comReplyns.comReUpdate", replyCommunity);
	}

	// 댓글 삭제
	public void comReDelete(int comReply_no) {
		System.out.println("댓글 삭제 DAO");
		comReplySql.delete("comReplyns.comReDelete", comReply_no);		
	}

}
