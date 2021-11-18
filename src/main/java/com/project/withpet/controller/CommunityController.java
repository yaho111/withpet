package com.project.withpet.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.withpet.model.Community;
import com.project.withpet.service.CommunityService;


@Controller
public class CommunityController {

	@Autowired
	private CommunityService service;

	// 글작성 폼
	@RequestMapping("/boardForm")
	public String boardform() {
		return "board/boardForm";
	}

	// 글작성
	@RequestMapping("/boardWrite")
	public String boardwrite(@ModelAttribute Community community, Model model) {
		System.out.println("com_writer:" + community.getCom_writer());

		int result = service.insert(community);
		System.out.println("result:" + result);

		model.addAttribute("result", result);

		return "board/insertResult";
	}

//	// 글목록
	@RequestMapping("/boardList")
	public String boardList(HttpServletRequest request, Model model) {
		int page = 1; // 현재 페이지 번호
		int limit = 10; // 한 페이지에 출력할 데이터 갯수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

//		int startRow = (page - 1) * limit + 1;
//		int endRow = page * limit;

	// 총 데이터 갯수
		int listcount = service.getCount();
		System.out.println("listcount:" + listcount);

		List<Community> boardList = service.getBoardList(page);
		System.out.println("boardlist:" + boardList);
		
//		//날짜
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
//		System.out.println(simpleDateFormat.format(Date));
		
//	      총 페이지
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10 * limit + 1); // 1, 11, 21...
		int endPage = startPage + 10 - 1; // 10, 20, 30..

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "board/boardList";
	}
}

//	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
//	@RequestMapping("/boardContent")
//	public String boardContent(int no, String page, Model model) {
//
//		service.updatecount(no); // 조회수 1증가
//		Community community = service.getBoard(no); // 상세 정보 구하기
//		String Content = community.getCom_content().replace("\n", "<br>");
//
//		model.addAttribute("community", community);
//		model.addAttribute("Content", Content);
//		model.addAttribute("page", page);
//
//		return "board/boardContent";
//	}
//}
//	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
//		@RequestMapping("/boardContent")
//		public String boardcontent(int no, String page, Model model) {
//			
//		//	service.updatecount(no);				// 조회수 1증가
//			Community community = service.getBoard(no);	    // 상세 정보 구하기
//			String com_content = community.getCom_content().replace("\n", "<br>");
//			
//			model.addAttribute("community", community);
//			model.addAttribute("com_content", com_content);
//			model.addAttribute("page", page);
//			
//			return "board/boardContent";
//		}
//	

//	// 글목록
//	@RequestMapping("/boardList")
//	public String boardlist(HttpServletRequest request, Model model) {
//		int page = 1;		// 현재 페이지 번호
//		int limit = 10;		// 한 페이지에 출력할 데이터 갯수
//		
//		if(request.getParameter("page") != null) {
//			page = Integer.parseInt(request.getParameter("page"));
//		}
//		
////		int startRow = (page - 1) * limit + 1;
////		int endRow = page * limit;
//		
//		// 총 데이터 갯수
//		int communitylistcount = service.getCount();
//		System.out.println("listcount:"+communitylistcount);
//		
//		List<Community> boardlist = service.getCommunityList(page);
//		System.out.println("boardlist:"+boardlist);
//		
//		// 총 페이지
//	int pageCount = communitylistcount/limit+((communitylistcount%limit==0) ? 0 : 1);
//	
//		int startPage = ((page-1)/10 * limit + 1);  // 1,  11, 21...
//		int endPage = startPage + 10 - 1;			// 10, 20, 30.. 
//		
//		if(endPage > pageCount)
//			endPage = pageCount;
//		
//		model.addAttribute("page", page);
//		model.addAttribute("communitylistcount", communitylistcount);
//		model.addAttribute("boardlist", boardlist);
//		model.addAttribute("pageCount", pageCount);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("endPage", endPage);		
//		
//		return "board/boardList";
//	}
//	
