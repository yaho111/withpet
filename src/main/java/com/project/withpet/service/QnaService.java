package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.dao.QnaDAO;
import com.project.withpet.model.Member;
import com.project.withpet.model.Qna;

@Repository
public class QnaService{

	@Autowired
	private QnaDAO qnaDao;

	// 글작성 파트
	// 글작성
	public int insertQna(Qna qna) throws Exception{
		System.out.println("글작성 service");
		return qnaDao.insertQna(qna);
		
	}

	// 글 목록 파트
	// 총데이터 갯수 구하기
	public int getCount(Qna qna){
		System.out.println("총데이터 숫자 serive");
		return qnaDao.getCount(qna);
	}

	// 목록 구해오기
	public List<Qna> list(Qna qna){
		System.out.println("글 목록 serive");
		return qnaDao.list(qna);
	}

	// 상세 페이지 파트
	// 조회수 증가
	public void qnaReadcnt(int no) throws Exception{
		System.out.println("조회수 증가 service");
		qnaDao.qnaReadcnt(no);
	}

	// 상세정보 구해오기
	public Qna qnaSelect(int no) throws Exception{
		System.out.println("상세정보 service");
		return qnaDao.qnaSelect(no);
	}

	// 답글 파트
	// 답글 
	public int reInsertQna(Qna qna) throws Exception{
		System.out.println("답글 service");
		
		qnaDao.refPlus(qna);
		System.out.println("refPlus : 성공" );
		
		qna.setQna_lev(qna.getQna_lev() + 1);	// 부모보다 1증가된 값을 저장함
		qna.setQna_seq(qna.getQna_seq() + 1);
		
		return qnaDao.reInsertQna(qna);
	}
	
	// 수정 파트
	// 수정
	public int qnaUpdate(Qna qna) {
		System.out.println("수정 service");
		return qnaDao.qnaUpdate(qna);
	}

	// 글삭제
	public int qnaDelete(Qna qna) {
		System.out.println("삭제 service");
		return qnaDao.qnaDelete(qna);
	}

	// 회원 정보 가져오기
	public List<Member> memberList1() {
		System.out.println("삭제 service");
		return null;
	}
	
	
	
}
