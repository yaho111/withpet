package com.project.withpet.controller;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withUnauthorizedRequest;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.withpet.dao.CommunityDAO;
import com.project.withpet.model.Community;
import com.project.withpet.service.CommunityService;
import com.project.withpet.service.PagingPgm;


@Controller
public class CommunityController {

	@Autowired
	private CommunityService service;

	// 글작성 폼
	@RequestMapping(value = "boardForm")
	public String boardform() {
		return "community/boardForm";
	}

	// 글 작성
	@RequestMapping("/boardWrite")
	public String boardwrite(@RequestParam("com_file1") MultipartFile multiFile, Community community, HttpServletRequest request, Model model) throws Exception {
		System.out.println("com_writer:" + community.getCom_writer());

	    String communityFileName = multiFile.getOriginalFilename(); // 파일명 저장
		int size = (int) multiFile.getSize(); // 첨부파일 크기 불러옴(단위 : byte), getSize()는 long형 - in 형으로 다운 케스팅(명시적 형 변환) 해야함
		
		String path = request.getRealPath("upload/community");
		System.out.println("mutiFile=" + multiFile);
		System.out.println("filename=" + communityFileName);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int upResult = 0;

		String newFileName = "";

		if (communityFileName != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = communityFileName.substring(communityFileName.lastIndexOf("."));
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID(); // 난수 발생

			newFileName = uuid + extension;
			System.out.println("newFileName:" + newFileName);

			String[] communityFile = new String[2];

			StringTokenizer st = new StringTokenizer(communityFileName, ".");
			communityFile[0] = st.nextToken(); // 파일명 저장
			communityFile[1] = st.nextToken(); // 확장자 저장 (jpg)

			if (size > 10000000) { // 100000 = 100kb, 10000000 = 10mb
				upResult = 1;
				model.addAttribute("upResult", upResult);

				return "community/uploadResult"; // 여기서 메세지 뿌림

			} else if (!communityFile[1].equals("jpg") && !communityFile[1].equals("gif") && !communityFile[1].equals("png")) {
				// 확장자 비교, ! : 아니면
				upResult = 2;
				model.addAttribute("upResult", upResult);

				return "community/uploadResult";
			}
		}
		if (size > 0) { // 첨부파일이 전송된 경우

			multiFile.transferTo(new File(path + "/" + newFileName));
		}
		community.setCom_file(newFileName);
		
		int result = service.insertBoard(community);
		System.out.println("result:" + result);

		model.addAttribute("result", result);

		return "community/insertResult";
	}
	
	// 글목록
	@RequestMapping("/boardList")
	public String boardList(String pageNum, Community community, Model model) {
		
		// 정렬 값(sortValue)이 없는 경우(초기 실행)
	      if(community.getSortValue() == null ) {
	    	  community.setSortValue("recent");
	      }
	      String sortValue = community.getSortValue();
		
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		System.out.println("currentPage:"+currentPage);
		
		// int total = bs.getTotal();
		int total = service.Total(community); // 검색 (데이터 갯수)
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm paging = new PagingPgm(total, rowPerPage, currentPage);

		community.setStartRow(startRow);
		community.setEndRow(endRow);
		
		// List<Board> list = bs.list(startRow, endRow);
//		int com_no = total - (currentPage - 1) + rowPerPage;		// 화면 출력 번호
		int com_no = total - startRow + 1;		// 화면 출력 번호
		List<Community> list = service.List(community);
		System.out.println("com_no:"+com_no);
		System.out.println("list:"+list);
		
		int totalPage = (int) Math.ceil((double) total / rowPerPage);
		int startPage = ((currentPage - 1)/10) * 10 + 1;		// 1,  11, 21...
		int endPage = startPage + 10 - 1;						// 10, 20, 30...
		if (endPage > totalPage)
			endPage = totalPage; 		
		
		model.addAttribute("sortValue", sortValue);
		
		model.addAttribute("list", list);
		model.addAttribute("com_no", com_no);
		model.addAttribute("paging", paging);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
     	model.addAttribute("currentPage", currentPage);
		
		// 검색
		model.addAttribute("search", community.getSearch());
		model.addAttribute("keyword", community.getKeyword());
		
		return "community/boardList";
	}
	
	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
	
	@RequestMapping("/boardContent")
	public String boardContent(int com_no, String page, Model model) {
	
		service.updateCount(com_no); // 조회수 1증가
		Community community = service.getBoard(com_no); // 상세 정보 구하기
		String Content = community.getCom_content().replace("\n", "<br>");

		model.addAttribute("community", community);
		model.addAttribute("Content", Content);
		model.addAttribute("page", page);

		return "community/boardContent";
	}

	
	// 수정 폼
		@RequestMapping("/boardUpdateForm")
		public String boardUpdateForm(int com_no, String page, Model model) {
			
			Community community = service.getBoard(com_no);		// 상세 정보 구하기
			
			model.addAttribute("community", community);
			model.addAttribute("page", page);
			
			return "community/boardUpdateForm";
		}

		// 글수정
	@RequestMapping("/boardUpdate")
	public String boardupdate(@RequestParam("com_file1") MultipartFile multiFile,
							  @ModelAttribute Community community
			,HttpServletRequest request,
							  Model model) throws Exception{

		// 필요한 변수 생성
		String filename = multiFile.getOriginalFilename();
		int size = (int) multiFile.getSize();
		int result = 0;

		String path = request.getRealPath("upload/community");
		System.out.println("path: " + path);
		String[] file;
		String newFileName = "";


		int com_no = Integer.parseInt(request.getParameter("com_no"));

		Community selectedBoard = service.getBoard(com_no);

		// 파일이 전송된 경우
		if (filename != "") {

			file = filename.split("\\.");

			String extension = "." + file[1];

			UUID uuid = UUID.randomUUID();

			newFileName = uuid + extension;
			System.out.println(newFileName);

			if (size > 10000000) { // 파일크기가 지정 한도를 초과하는 경우
				result = 1;
				model.addAttribute("result", result);

				return "community/uploadResult";
			} else if (!file[1].equals("jpg") &&
					!file[1].equals("gif") &&
					!file[1].equals("png")) { // 파일의 확장자가 가능한 확장자가 아닌 경우

				result = 2;
				model.addAttribute("result", result);

				return "community/uploadResult";
			}


		}

		if (size > 0) {
			String originalProfile = selectedBoard.getCom_file();
			if(originalProfile != null){
				File needToDelete = new File(path + "/" + originalProfile);
				needToDelete.delete();
			}
			multiFile.transferTo(new File(path + "/" + newFileName));
			community.setCom_file(newFileName);
		} else {
			community.setCom_file(selectedBoard.getCom_file());
		}
		
		int updateResult = service.boardUpdate(community);

		String page = request.getParameter("page");

			model.addAttribute("result",result);
			model.addAttribute("page", page);
			model.addAttribute("com_no",com_no);
			model.addAttribute("updateResult", updateResult);
			System.out.println(page);
			return "community/uploadResult";
		}


		// 글삭제
	
	@RequestMapping("/boardDelete")
	public String boardDelete(int com_no, String page, Model model) {

		service.boardDelete(com_no);
		Community community = service.getBoard(com_no); 
		int result = service.boardDelete(com_no);
		
		model.addAttribute("result",result);
		model.addAttribute("community", community);
		model.addAttribute("page", page);
		
		return "community/deleteResult";
	}
}
	