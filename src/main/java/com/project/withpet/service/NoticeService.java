package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.NoticeDAO;
import com.project.withpet.model.Notice;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;

	// 글작성
	public int noticeInsert(Notice notice) {
		System.out.println("글작성 서비스");
		return noticeDAO.noticeInsert(notice);
	}

	// 총 데이터 구하기
	public int noticeGetCount(Notice notice) {
		System.out.println("총테이터 구하기 서비스");
		return noticeDAO.noticeGetCount(notice);
	}

	// 목록 구하기
	public List<Notice> noticeList(Notice notice) {
		System.out.println("목록 구하기 서비스");
		return noticeDAO.noticeList(notice);
	}

	// 조회수 증가
	public void noticeReadcnt(int not_no) {
		System.out.println("조회수 증가 서비스");
		noticeDAO.noticeReadcnt(not_no);
	}

	// 상세 정보 불러오기
	public Notice noticeSelect(int not_no) {
		System.out.println("상세 정보 불러오기 서비스");
		return noticeDAO.noticeSelect(not_no);
	}


	// 글수정
//	public int noticeUpdate(Notice notice) {
//		System.out.println("글수정 서비스");
//		return noticeDAO.noticeUpdate(notice);
//	}
	
	// 글 삭제
//	public int noticeDelete(int not_no) {
//		System.out.println("글 삭제 서비스");
//		return noticeDAO.noticeDelete(not_no);
//	}
	

}
