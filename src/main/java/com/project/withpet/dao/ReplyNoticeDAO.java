package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.ReplyNotice;

@Repository
public class ReplyNoticeDAO {

	@Autowired
	private SqlSessionTemplate notReplySql;
	
	// 글 목록 구하기
	public List<ReplyNotice> notRelist(int not_no) {
		System.out.println("댓글 목록 DAO");
		return notReplySql.selectList("notReplyns.notRelist", not_no);
	}

	// 댓글 입력
	public void notReInsert(ReplyNotice replyNotice) {
		System.out.println("댓글 입력 DAO");
		notReplySql.insert("notReplyns.notReInsert", replyNotice);
		
	}

	// 댓글 수정
	public int notReUpdate(ReplyNotice replyNotice) {
		System.out.println("댓글 수정 DAO");
	return notReplySql.update("notReplyns.notReUpdate", replyNotice);
	}		


	// 댓글 삭제
	public void notReDelete(int notReply_no) {
		System.out.println("댓글 삭제 DAO");
		notReplySql.delete("notReplyns.notReDelete", notReply_no);		
	}

	// 댓글 총데이터 구하기
//	public int getCount(ReplyNotice replyNotice) {
//		System.out.println("댓글 총데이터 삭제 DAO");
//		return notReplySql.selectOne("notReplyns.getCount", replyNotice);
//	}


}
