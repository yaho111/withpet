package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Notice;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate noticeSession;

	// 글작성
	public int noticeInsert(Notice notice) {
		System.out.println("글작성 DAO");
		return noticeSession.insert("noticens.noticeInsert", notice);
	}

	// 총데이터 구하기
	public int noticeGetCount(Notice notice) {
		System.out.println("총데이터 DAO");
		return noticeSession.selectOne("noticens.noticeGetCount", notice);
	}

	// 목록 구하기
	public List<Notice> noticeList(Notice notice) {
		System.out.println("목록 구하기 DAO");
		return noticeSession.selectList("noticens.noticeList", notice);
	}

	// 조회수 증가
	public void noticeReadcnt(int not_no) {
		System.out.println("조회수 증가 DAO");
		noticeSession.update("noticens.noticeReadcnt", not_no);
	}

	// 상세 정보 불러오기
	public Notice noticeSelect(int not_no) {
		System.out.println("상세 정보 불러오기 DAO");
		return noticeSession.selectOne("noticens.noticeSelect", not_no);
	}


	// 글수정
	public int noticeUpdate(Notice notice) {
		System.out.println("글수정 DAO");
		return noticeSession.update("noticens.noticeUpdate", notice);
	}
	
	// 글삭제
	public int noticeDelete(int not_no) {
		System.out.println("글삭제 DAO");
		return noticeSession.delete("noticens.noticeDelete", not_no);
	}
	
	
	
}
