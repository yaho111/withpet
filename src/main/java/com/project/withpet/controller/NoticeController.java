package com.project.withpet.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.withpet.model.Notice;
import com.project.withpet.model.Qna;
import com.project.withpet.service.NoticeService;
import com.project.withpet.service.Paging;

//참고 예제 : spring(전체적인 기본), sboard(아작스 댓글), springmember(첨부파일), board1(검색 처리, 답글-글작성 한번에 처리)

//글작성 폼
//글작성(첨부파일)

//글 목록 : error - 목록을 못 불러옴(list = null)

//글 상세

//답글 (아작스 처리)

//글 수정 폼
//글 수정

//글 삭제 (관리자 : alert / 사용자 : 회원 세션 확인)

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	//글작성 폼
	@RequestMapping(value = "noticeInsertForm")
	public String noticeInsertForm() {
		return "notice/noticeInsertForm";
	}
	
	//글작성(첨부파일)
	@RequestMapping(value = "noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(@RequestParam("not_file1") MultipartFile mutiFile, Notice notice, HttpServletRequest request,
			Model model) throws Exception {	// 매개변수 : 세션 객체 필요(관리자)
		
		String noticeFileName = mutiFile.getOriginalFilename(); // 파일명 저장
		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함

		String path = request.getRealPath("upload/notice"); // upload/notice를 불러와라
		System.out.println("mutiFile=" + mutiFile);
		System.out.println("filename=" + noticeFileName);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int upResult = 0;

		String newFileName = "";

		if (noticeFileName != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = noticeFileName.substring(noticeFileName.lastIndexOf("."), noticeFileName.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID(); // 난수 발생

			newFileName = uuid.toString() + extension;
			System.out.println("newFileName:" + newFileName);

			String noticeFile[] = new String[2];

			StringTokenizer st = new StringTokenizer(noticeFileName, ".");
			noticeFile[0] = st.nextToken(); // 파일명 저장
			noticeFile[1] = st.nextToken(); // 확장자 저장 (jpg)

			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
				upResult = 1;
				model.addAttribute("upResult", upResult);

				return "notice/uploadResult"; // 여기서 메세지 뿌림

			} else if (!noticeFile[1].equals("jpg") && !noticeFile[1].equals("gif") && !noticeFile[1].equals("png")) {
				// 확장자 비교, ! : 아니면

				upResult = 2;
				model.addAttribute("upResult", upResult);

				return "notice/uploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mutiFile.transferTo(new File(path + "/" + newFileName));

		}

		notice.setNot_file(newFileName);

		int result = noticeService.noticeInsert(notice);
		if (result == 1)
			model.addAttribute("result", result);
		
		
		
		return "notice/noticeInsert";
	}

	//글 목록 
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public String noticeList(String pageNum, Notice notice, Model model) {
		System.out.println("noticeList 컨트롤러");
		
		// 한 화면에 출력할 데이터 갯수
				final int limit = 10;

				if (pageNum == null || pageNum.equals("")) {
					pageNum = "1";
				}

				// 현제 페이지 (pageNum 변환)
				int currentPage = Integer.parseInt(pageNum);

				// 총 데이터 구해오기
				int totalData = noticeService.noticeGetCount(notice);
				System.out.println("totalData:"+totalData);

				// 한페이지에 데이터 시작 값, 끝값
				int startRow = (currentPage - 1) * limit + 1; // 1, 11, 21, 31 , DTO에 저장
				int endRow = startRow + limit - 1; // 10, 20, 30, 40 , DTO에 저장

				Paging paging = new Paging(totalData, limit, currentPage);

				notice.setStartRow(startRow);
				System.out.println("startRow : " + startRow);
				notice.setEndRow(endRow);
				System.out.println("endRow : " + endRow);

				int no = totalData - startRow + 1; // 화면 출력 번호
				
//				시간을 자바로 출력 해볼려고 하니 문제 발생
//				SimpleDateFormat sd = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss EEE요일");
//				String date = sd.format(notice.getNot_reg());
				
				List<Notice> list = noticeService.noticeList(notice);
				System.out.println("list : " + list);

				model.addAttribute("list", list);
				model.addAttribute("no", no);
				model.addAttribute("paging", paging);
//				model.addAttribute("date", date);

				// 검색
				model.addAttribute("search", notice.getSearch());
				model.addAttribute("keyword", notice.getKeyword());
		
		return "notice/noticeList";
	}
	

	//글 상세(관리자 : 수정, 삭제 / 사용자 : 댓글 창, 댓글 목록 - 자바 스크립트(공부 필요))
	// not_no이 null값으로 전달된다. 
	// (Optional int parameter 'not_no' is present but cannot be translated into a null value 
	// due to being declared as a primitive type. Consider declaring it as object wrapper for 
	// the corresponding primitive type.)
	@RequestMapping(value = "noticeView", method = RequestMethod.GET)
	public String noticeView(int not_no, String pageNum, Model model) {
		System.out.println("noticeView 글상세");
		
		noticeService.noticeReadcnt(not_no);
		Notice notice = noticeService.noticeSelect(not_no);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "notice/noticeView";
	}

	//답글 (아작스 처리)

	//글 수정 폼
	@RequestMapping(value = "noticeUpdateForm", method = RequestMethod.GET)
	public String noticeUpdateForm(int not_no, String pageNum, Model model) {
		
		Notice notice = noticeService.noticeSelect(not_no);
		
		model.addAttribute("not_no", not_no);
		model.addAttribute("Notice", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "notice/noticeUpdateForm";
	}
	
	//글 수정
//	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
//	public String noticeUpdate(@RequestParam("not_file1") MultipartFile mutiFile, Notice notice, HttpServletRequest request,
//			Model model) throws Exception{
//		
//		String noticeFileName = mutiFile.getOriginalFilename(); // 파일명 저장
//		int size = (int) mutiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함
//
//		String path = request.getRealPath("upload/notice"); // upload/notice를 불러와라
//		System.out.println("mutiFile=" + mutiFile);
//		System.out.println("filename=" + noticeFileName);
//		System.out.println("size=" + size);
//		System.out.println("Path=" + path);
//		int upResult = 0;
//
//		String newFileName = "";
//
//		if (noticeFileName != "") { // 첨부파일이 전송된 경우
//
//			// 파일 중복문제 해결
//			String extension = noticeFileName.substring(noticeFileName.lastIndexOf("."), noticeFileName.length());
//			System.out.println("extension:" + extension);
//
//			UUID uuid = UUID.randomUUID(); // 난수 발생
//
//			newFileName = uuid.toString() + extension;
//			System.out.println("newFileName:" + newFileName);
//
//			String noticeFile[] = new String[2];
//
//			StringTokenizer st = new StringTokenizer(noticeFileName, ".");
//			noticeFile[0] = st.nextToken(); // 파일명 저장
//			noticeFile[1] = st.nextToken(); // 확장자 저장 (jpg)
//
//			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
//				upResult = 1;
//				model.addAttribute("upResult", upResult);
//
//				return "notice/uploadResult"; // 여기서 메세지 뿌림
//
//			} else if (!noticeFile[1].equals("jpg") && !noticeFile[1].equals("gif") && !noticeFile[1].equals("png")) {
//				// 확장자 비교, ! : 아니면
//
//				upResult = 2;
//				model.addAttribute("upResult", upResult);
//
//				return "notice/uploadResult";
//			}
//		}
//
//		if (size > 0) { // 첨부파일이 전송된 경우
//
//			mutiFile.transferTo(new File(path + "/" + newFileName));
//
//		}
//
//		// if문으로 첨부 파일이 수정되면, 첨부파일이 수정되지 않으면 을 처리
//		
//
//		int result = noticeService.noticeUpdate(notice);
//		if (result == 1)
//			model.addAttribute("result", result);
//		
//		
//		return "notice/noticeUpdate";
//	}

	//글 삭제 (관리자만 삭제)
//	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
//	public String noticeDelete(int not_no, String pageNum, Model model) {
//		
//		int result = noticeService.noticeDelete(not_no);
//		if (result == 1)
//			model.addAttribute("result", result);
//		
//		return "notice/noticeDelete()";
//	}
	
}
