package com.project.withpet.controller;

import java.io.File;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.withpet.model.Member;
import com.project.withpet.model.Qna;
import com.project.withpet.service.ManagerService;
import com.project.withpet.service.PagingPgm;
import com.project.withpet.service.QnaService;

// 참고 예제 : spring(전체적인 기본), springboard(댓글), springmember(첨부파일), board1(검색 처리)

// 글작성 폼
// 글작성(첨부파일)

// 글 목록 오류 : 번호 출력 확인

// 글 상세(관리자 : 답변, 삭제 / 사용자(작성자) : 수정, 삭제 / 사용자(작성자 외) : X)


// 답글 폼
// 답글 : 
// 댓글 오류 : 
			

// 글 수정 폼	 
// 글 수정 : 

// 글 삭제 (관리자 : alert / 사용자 : 회원 세션 확인)

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ManagerService managerService;

	// 글작성 파트
	// 글작성 폼
	@RequestMapping(value = "qnaInsertForm")
	public String qnaInsertFrom() {// 매개변수 : 세션 객체 필요
		return "qna/qnaInsertForm";
	}

	// 글작성
	@RequestMapping(value = "qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(Qna qna, HttpServletRequest request,
			Model model) throws Exception {// 매개변수 : 세션 객체 필요

//		@RequestParam("qna_file1") MultipartFile mutiFile,
		
//		String qnaFileName = mutiFile.getOriginalFilename(); // 파일명 저장
//		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함
//
//		String path = request.getRealPath("upload/qna"); // qnaupload를 불러와라
//		System.out.println("mutiFile=" + mutiFile);
//		System.out.println("filename=" + qnaFileName);
//		System.out.println("size=" + size);
//		System.out.println("Path=" + path);
//		int upResult = 0;
//
//		String newFileName = "";
//
//		if (qnaFileName != "") { // 첨부파일이 전송된 경우
//
//			// 파일 중복문제 해결
//			String extension = qnaFileName.substring(qnaFileName.lastIndexOf("."), qnaFileName.length());
//			System.out.println("extension:" + extension);
//
//			UUID uuid = UUID.randomUUID(); // 난수 발생
//
//			newFileName = uuid.toString() + extension;
//			System.out.println("newFileName:" + newFileName);
//
//			String qnaFile[] = new String[2];
//
//			StringTokenizer st = new StringTokenizer(qnaFileName, ".");
//			qnaFile[0] = st.nextToken(); // 파일명 저장
//			qnaFile[1] = st.nextToken(); // 확장자 저장 (jpg)
//
//			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
//				upResult = 1;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult"; // 여기서 메세지 뿌림
//
//			} else if (!qnaFile[1].equals("jpg") && !qnaFile[1].equals("gif") && !qnaFile[1].equals("png")) {
//				// 확장자 비교, ! : 아니면
//
//				upResult = 2;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult";
//			}
//		}
//
//		if (size > 0) { // 첨부파일이 전송된 경우
//
//			mutiFile.transferTo(new File(path + "/" + newFileName));
//
//		}
//
//		qna.setQna_file(newFileName);

		int result = qnaService.insertQna(qna);
		if (result == 1)
			model.addAttribute("result", result);

		return "qna/qnaInsert";
	}

	// 글목록 파트
	// 글 목록
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public String qnaList(String pageNum, Qna qna, Model model){
		
		// 비밀글 구현 필요 (체크박스 컬럼 추가 필요(N(X),Y(O))) - 
		// 뷰페이지에서 체크박스 Y일경우 작성자, 관리자 빼고 '비밀글입니다'접근 걸기

		// 한 화면에 출력할 데이터 갯수
		final int rowPerPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		// 현제 페이지 (pageNum 변환)
		int currentPage = Integer.parseInt(pageNum);

		// 총 데이터 구해오기
		int total = qnaService.getCount(qna);
		System.out.println("totalData:"+total);

		// 한페이지에 데이터 시작 값, 끝값
		int startRow = (currentPage - 1) * rowPerPage + 1; // 1, 11, 21, 31 , DTO에 저장
		int endRow = startRow + rowPerPage - 1; // 10, 20, 30, 40 , DTO에 저장

		PagingPgm paging = new PagingPgm(total, rowPerPage, currentPage);

		qna.setStartRow(startRow);
		qna.setEndRow(endRow);

		int no = total - startRow + 1; // 화면 출력 번호
		
		List<Qna> list = qnaService.list(qna);
		System.out.println("list : " + list);

		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("paging", paging);

		// 검색
		model.addAttribute("search", qna.getSearch());
		model.addAttribute("keyword", qna.getKeyword());

		return "qna/qnaList";
	}

	// 상세 페이지 파트
	// 글 상세(관리자 : 답변, 삭제 / 사용자(작성자) : 수정, 삭제 / 사용자(작성자 외) : X)
	@RequestMapping(value = "qnaView", method = RequestMethod.GET)
	public String view(int qna_no, String pageNum, Model model) throws Exception {// 매개변수 : 세션 객체 필요
		

		qnaService.qnaReadcnt(qna_no);	// 조회수 증가
		Qna qna = qnaService.qnaSelect(qna_no);	// 상세 정보 구하기
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
//		model.addAttribute("even", even);
//		model.addAttribute("odd", odd);
		
		return "qna/qnaView";
	}
	
	// 답글 파트
	// 답글 폼 : springboard(댓글)
	@RequestMapping(value = "qnaReplyForm", method = RequestMethod.GET)
	public String qnaReplyForm(int qna_no, String pageNum, Model model) throws Exception{// 매개변수 : 세션 객체 필요
		
		Qna qna = qnaService.qnaSelect(qna_no);
		
		model.addAttribute("qna_no", qna_no);
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		
		return "qna/qnaReplyForm";
	}
	
	// 답글
	// 댓글 오류 
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	public String qnaReply(Qna qna, HttpServletRequest request, String pageNum,
			Model model) throws Exception {

//		@RequestParam("qna_file1") MultipartFile mutiFile,
//		
//		String qnaFileName = mutiFile.getOriginalFilename(); // 파일명 저장
//		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함
//
//		String path = request.getRealPath("upload/qna"); // qnaupload를 불러와라
//		System.out.println("mutiFile=" + mutiFile);
//		System.out.println("filename=" + qnaFileName);
//		System.out.println("size=" + size);
//		System.out.println("Path=" + path);
//		int upResult = 0;
//
//		String newFileName = "";
//
//		if (qnaFileName != "") { // 첨부파일이 전송된 경우
//
//			// 파일 중복문제 해결
//			String extension = qnaFileName.substring(qnaFileName.lastIndexOf("."), qnaFileName.length());
//			System.out.println("extension:" + extension);
//
//			UUID uuid = UUID.randomUUID(); // 난수 발생
//
//			newFileName = uuid.toString() + extension;
//			System.out.println("newFileName:" + newFileName);
//
//			String qnaFile[] = new String[2];
//
//			StringTokenizer st = new StringTokenizer(qnaFileName, ".");
//			qnaFile[0] = st.nextToken(); // 파일명 저장
//			qnaFile[1] = st.nextToken(); // 확장자 저장 (jpg)
//
//			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
//				upResult = 1;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult"; // 여기서 메세지 뿌림
//
//			} else if (!qnaFile[1].equals("jpg") && !qnaFile[1].equals("gif") && !qnaFile[1].equals("png")) {
//				// 확장자 비교, ! : 아니면
//
//				upResult = 2;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult";
//			}
//		}
//
//		if (size > 0) { // 첨부파일이 전송된 경우
//
//			mutiFile.transferTo(new File(path + "/" + newFileName));
//
//		}
//
//		qna.setQna_file(newFileName);

		int result = qnaService.reInsertQna(qna);
		if (result == 1)
			model.addAttribute("result", result);

		return "qna/qnaReply";// 답글작성이 성공하면 답글 상세포기 페이지로 이동했으면 좋겠음
	}
	
	// 글 수정 폼
	@RequestMapping(value = "qnaUpdateForm", method = RequestMethod.GET)
	public String qnaUpdateForm(int qna_no, String pageNum, Model model) throws Exception {// 매개변수 : 세션 객체 필요	
		
		Qna qna = qnaService.qnaSelect(qna_no);
		
		model.addAttribute("qna_no", qna_no);
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		
	return "qna/qnaUpdateForm";
	}
	
	// 글 수정
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public String update(Qna qna, HttpServletRequest request,
			Model model) throws Exception {	// 매개변수 : 세션 객체 필요
		
//		@RequestParam("qna_file1") MultipartFile mutiFile,
//		
//		String qnaFileName = mutiFile.getOriginalFilename(); // 파일명 저장
//		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함
//
//		String path = request.getRealPath("upload/qna"); // qnaupload를 불러와라
////		System.out.println("mutiFile=" + mutiFile);
////		System.out.println("filename=" + qnaFileName);
////		System.out.println("size=" + size);
////		System.out.println("Path=" + path);
//		int upResult = 0;
//
//		String newFileName = "";
//
//		if (qnaFileName != "") { // 첨부파일이 전송된 경우
//
//			// 파일 중복문제 해결
//			String extension = qnaFileName.substring(qnaFileName.lastIndexOf("."), qnaFileName.length());
//			System.out.println("extension:" + extension);
//
//			UUID uuid = UUID.randomUUID(); // 난수 발생
//
//			newFileName = uuid.toString() + extension;
//			System.out.println("newFileName:" + newFileName);
//
//			String qnaFile[] = new String[2];
//
//			StringTokenizer st = new StringTokenizer(qnaFileName, ".");
//			qnaFile[0] = st.nextToken(); // 파일명 저장
//			qnaFile[1] = st.nextToken(); // 확장자 저장 (jpg)
//
//			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
//				upResult = 1;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult"; // 여기서 메세지 뿌림
//
//			} else if (!qnaFile[1].equals("jpg") && !qnaFile[1].equals("gif") && !qnaFile[1].equals("png")) {
//				// 확장자 비교, ! : 아니면
//
//				upResult = 2;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult";
//			}
//		}
//
//		if (size > 0) { // 첨부파일이 전송된 경우
//
//			mutiFile.transferTo(new File(path + "/" + newFileName));
//
//		}
//
//		// 오류 발생 : 첨부파일을 수정하면 이미지 출력이 안되고 첨부파일을 수정하지 않으면 이미지 안 뜸
//		// 아래와 같이 해결
//		// 기존 데이터를 조회하기
//		Qna updateFile = qnaService.qnaSelect(qna.getQna_no());
//		
//		if (size > 0) { // 첨부 파일이 수정되면
//			qna.setQna_file(newFileName);
//		} else { // 첨부파일이 수정되지 않으면
//			qna.setQna_file(updateFile.getQna_file());
//		}
		
		int result = qnaService.qnaUpdate(qna);
		if (result == 1)
			model.addAttribute("result", result);
	
		return "qna/qnaUpdate";
	}

	// 글 삭제 (관리자 : alert / 사용자 : 회원 세션 확인)
	@RequestMapping(value = "qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(Qna qna, String pageNum, Model model) {	// 매개변수 : 세션 객체 필요
		
		int result = qnaService.qnaDelete(qna);
		if (result == 1)
			model.addAttribute("result", result);
		
		return "qna/qnaDelete";
	}
	
	
}
