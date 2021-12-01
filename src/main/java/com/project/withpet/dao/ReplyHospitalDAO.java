package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.withpet.model.ReplyHospital;

@Repository
public class ReplyHospitalDAO {

	@Autowired
	private SqlSessionTemplate hosReplySql;
	
	// 글 목록 구하기
	public List<ReplyHospital> hosRelist(int hos_no) {
		System.out.println("댓글 목록 DAO");
		return hosReplySql.selectList("hosReplyns.hosRelist", hos_no);
	}

	// 댓글 입력
	public void hosReInsert(ReplyHospital ReplyHospital) {
		System.out.println("댓글 입력 DAO");
		hosReplySql.insert("hosReplyns.hosReInsert", ReplyHospital);
		
	}

	// 댓글 수정
	public int hosReUpdate(ReplyHospital ReplyHospital) {
		System.out.println("댓글 수정 DAO");
		return hosReplySql.update("hosReplyns.hosReUpdate", ReplyHospital);
	}

	// 댓글 삭제
	public void hosReDelete(int hosReply_no) {
		System.out.println("댓글 삭제 DAO");
		hosReplySql.delete("hosReplyns.hosReDelete", hosReply_no);		
	}

}
