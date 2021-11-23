package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Qna;

@Repository
public class QnaDAO{

	@Autowired
	private SqlSessionTemplate qnaSession;

	// 글작성 파트
	// 글작성
	public int insertQna(Qna qna) throws Exception{
		System.out.println("글작성 DAO");
		return qnaSession.insert("qnans.qnaInsert", qna);
	}

	// 글 목록 파트
	// 총데이터 갯수 구하기
	public int getCount(Qna qna){
		System.out.println("총데이터 숫자 DAO");
		return qnaSession.selectOne("qnans.getCount", qna);
	}

	// 목록 구해오기
	public List<Qna> list(Qna qna){
		System.out.println("글 목록 DAO");
		return qnaSession.selectList("qnans.qnaList", qna);
	}

	// 상세 페이지 파트
	// 조회수 증가
	public void qnaReadcnt(int no) throws Exception{
		System.out.println("조회수 증가 DAO");
		qnaSession.update("qnans.qnaReadcnt", no);
	}

	// 상세정보 구하기
	public Qna qnaSelect(int no) throws Exception{
		System.out.println("상세정보 DAO");
		return qnaSession.selectOne("qnans.qnaSelect", no);
	}

	// 답변 파트
	/* 답변글 레벨 증가  */
	public void refPlus(Qna qna) throws Exception{
		System.out.println("답글 레벨 업 DAO");
		qnaSession.update("qnans.qnaReplyUp", qna);
	}
	
	// 답글 저장
	public int reInsertQna(Qna qna) throws Exception{
		System.out.println("답글 저장 DAO");
		return qnaSession.insert("qnans.qnaReply", qna);
	}

	
	// 글 수정
	public int qnaUpdate(Qna qna) {
		System.out.println("수정 DAO");
		return qnaSession.update("qnans.qnaUpdate", qna);
	}

	// 글삭제
	public int qnaDelete(int qna_no) {
		System.out.println("삭제 DAO");
		return qnaSession.delete("qnans.qnaDelete", qna_no);
	}

	
	
	
	
	
	
	

}
