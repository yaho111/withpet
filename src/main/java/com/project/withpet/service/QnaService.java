package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.dao.QnaDAO;
import com.project.withpet.model.Qna;

@Repository
public class QnaService{

	@Autowired
	private QnaDAO qnaDao;

	// 글작성 파트
	// 글작성
	public int insertQna(Qna qna) throws Exception{
		System.out.println("insertQna service");
		return qnaDao.insertQna(qna);
		
	}

	// 글 목록 파트
	// 총데이터 갯수 구하기
	public int getCount(Qna qna) {
		System.out.println("getCount serive");
		return qnaDao.getCount(qna);
	}

	// 목록 구해오기
	public List<Qna> list(Qna qna) {
		System.out.println("list serive");
		return qnaDao.list(qna);
	}

	// 상세 페이지 파트
	// 조회수 증가
	public void qnaReadcnt(int no) {
		System.out.println("qnaReadcnt service");
		qnaDao.qnaReadcnt(no);
	}

	// 상세정보 구해오기
	public Qna qnaSelect(int no) {
		System.out.println("qnaSelect service");
		return qnaDao.qnaSelect(no);
	}

	// 답글 파트
//	// 답글 
//	public int reInsertQna(Qna qna) {
//		System.out.println("reInsertQna service");
//		
//		qnaDao.refPlus(qna);
//		System.out.println("refPlus : 성공" );
//		
//		qna.setQna_lev(qna.getQna_lev() + 1);	// 부모보다 1증가된 값을 저장함
//		qna.setQna_seq(qna.getQna_seq() + 1);
//		
//		return qnaDao.reInsertQna(qna);
//	}
	
	
	
}
