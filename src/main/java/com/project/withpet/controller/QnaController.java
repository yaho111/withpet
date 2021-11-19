package com.project.withpet.controller;

import java.io.File;
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

import com.project.withpet.model.Qna;
import com.project.withpet.service.Paging;
import com.project.withpet.service.QnaService;

// 참고 예제 : spring(전체적인 기본), springboard(댓글), springmember(첨부파일), board1(검색 처리)

// 글작성 폼
// 글작성(첨부파일)

// 글 목록 (검색 - 커뮤니티, 병원, 쇼핑몰, 회원) - 검색기능에 2중으로 가능한가??

// 글 상세(관리자 : 답변, 삭제 / 사용자(작성자) : 수정, 삭제 / 사용자(작성자 외) : X)

// 답글 폼
// 답글 (첨부파일 넣을까?)

// 글 수정 폼
// 글 수정

// 글 삭제 (관리자 : alert / 사용자 : 회원 세션 확인)

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	// 글작성 파트
	// 글작성 폼
	@RequestMapping(value = "qnaInsertForm")
	public String qnaInsertFrom() {
		return "qna/qnaInsertForm";
	}

	// 글작성
	@RequestMapping(value = "qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(@RequestParam("qna_file1") MultipartFile mutiFile, Qna qna, HttpServletRequest request,
			Model model) throws Exception {

		String qnaFileName = mutiFile.getOriginalFilename(); // 파일명 저장
		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함

		String path = request.getRealPath("qnaupload"); // qnaupload를 불러와라
		System.out.println("mutiFile=" + mutiFile);
		System.out.println("filename=" + qnaFileName);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int upResult = 0;

		String newFileName = "";

		if (qnaFileName != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = qnaFileName.substring(qnaFileName.lastIndexOf("."), qnaFileName.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID(); // 난수 발생

			newFileName = uuid.toString() + extension;
			System.out.println("newFileName:" + newFileName);

			String qnaFile[] = new String[2];

			StringTokenizer st = new StringTokenizer(qnaFileName, ".");
			qnaFile[0] = st.nextToken(); // 파일명 저장
			qnaFile[1] = st.nextToken(); // 확장자 저장 (jpg)

			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
				upResult = 1;
				model.addAttribute("upResult", upResult);

				return "qna/uploadResult"; // 여기서 메세지 뿌림

			} else if (!qnaFile[1].equals("jpg") && !qnaFile[1].equals("gif") && !qnaFile[1].equals("png")) {
				// 확장자 비교, ! : 아니면

				upResult = 2;
				model.addAttribute("upResult", upResult);

				return "qna/uploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mutiFile.transferTo(new File(path + "/" + newFileName));

		}

		qna.setQna_file(newFileName);

		int result = qnaService.insertQna(qna);
		if (result == 1)
			model.addAttribute("result", result);

		return "qna/qnaInsert";
	}

	// 글목록 파트
	// 글 목록 (검색 - 커뮤니티, 병원, 쇼핑몰, 회원) - 검색기능에 2중으로 가능한가??
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public String qnaList(String pageNum, Qna qna, Model model) {

		// 한 화면에 출력할 데이터 갯수
		final int limit = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		// 현제 페이지 (pageNum 변환)
		int currentPage = Integer.parseInt(pageNum);

		// 총 데이터 구해오기
		int totalData = qnaService.getCount(qna);
		System.out.println("totalData:"+totalData);

		// 한페이지에 데이터 시작 값, 끝값
		int startRow = (currentPage - 1) * limit + 1; // 1, 11, 21, 31 , DTO에 저장
		int endRow = startRow + limit - 1; // 10, 20, 30, 40 , DTO에 저장

		Paging paging = new Paging(totalData, limit, currentPage);

		qna.setStartRow(startRow);
		qna.setEndRow(endRow);

		int no = totalData - startRow + 1; // 화면 출력 번호

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
	public String view(int qna_no, String pageNum, Model model) {
		qnaService.qnaReadcnt(qna_no);	// 조회수 증가
		Qna qna = qnaService.qnaSelect(qna_no);	// 상세 정보 구하기
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		
		return "qna/qnaView";
	}
	
	// 답글 파트
//	// 답글 폼 : springboard(댓글)
//	@RequestMapping(value = "qnaReplyForm", method = RequestMethod.GET)
//	public String qnaReplyForm() {
//		return "qna/qnaReplyForm";
//	}
//	
//	// 답글 (첨부파일 넣을까? - 넣는다. )
//	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
//	public String qnaReply(@RequestParam("qna_file2") MultipartFile mutiFile, Qna qna, HttpServletRequest request, String pageNum,
//			Model model) throws Exception {
//
//		String qnaReFileName = mutiFile.getOriginalFilename(); // 파일명 저장
//		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함
//
//		String path = request.getRealPath("qnaupload"); // qnaupload를 불러와라
//		System.out.println("mutiFile=" + mutiFile);
//		System.out.println("filename=" + qnaReFileName);
//		System.out.println("size=" + size);
//		System.out.println("Path=" + path);
//		int upResult = 0;
//
//		String reFileName = "";
//
//		if (qnaReFileName != "") { // 첨부파일이 전송된 경우
//
//			// 파일 중복문제 해결
//			String extension = qnaReFileName.substring(qnaReFileName.lastIndexOf("."), qnaReFileName.length());
//			System.out.println("extension:" + extension);
//
//			UUID uuid = UUID.randomUUID(); // 난수 발생
//
//			reFileName = uuid.toString() + extension;
//			System.out.println("newFileName:" + reFileName);
//
//			String reQnaFile[] = new String[2];
//
//			StringTokenizer st = new StringTokenizer(qnaReFileName, ".");
//			reQnaFile[0] = st.nextToken(); // 파일명 저장
//			reQnaFile[1] = st.nextToken(); // 확장자 저장 (jpg)
//
//			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
//				upResult = 1;
//				model.addAttribute("upResult", upResult);
//
//				return "qna/uploadResult"; // 여기서 메세지 뿌림
//
//			} else if (!reQnaFile[1].equals("jpg") && !reQnaFile[1].equals("gif") && !reQnaFile[1].equals("png")) {
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
//			mutiFile.transferTo(new File(path + "/" + reFileName));
//
//		}
//
//		qna.setQna_file(reFileName);
//
//		int result = qnaService.reInsertQna(qna);
//		if (result == 1)
//			model.addAttribute("result", result);
//		
//		model.addAttribute("pageNum", pageNum);
//		
//		return "qna/qnaReply";
//	}
	
	// 글 수정 폼
	// 글 수정

	// 글 삭제 (관리자 : alert / 사용자 : 회원 세션 확인)
}
