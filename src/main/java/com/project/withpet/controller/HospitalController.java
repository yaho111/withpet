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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.withpet.model.Hospital;
import com.project.withpet.service.HospitalService;
import com.project.withpet.service.PagingPgm;

@Controller
public class HospitalController {

	@Autowired
	private HospitalService hospitalService;

	// 글 작성 폼
	@RequestMapping("insertForm")
	public String insertForm() {
		return "hospital/insertForm";
	}

	// 글 작성(insert)
	@RequestMapping("insert")
	public String insert(@RequestParam("hos_file1") MultipartFile multiFile, Hospital hospital, HttpServletRequest request,
			Model model) throws Exception {
		
		// 1) 주소 처리
		// 우편번호 + 주소 + 상세 주소
		String hos_addr = request.getParameter("post") + "-" + request.getParameter("addr")
        + "-" + request.getParameter("specificAddress");
		
		hospital.setHos_addr(hos_addr);	
		
		System.out.println("hospital.hos_loc");
		
		// 2) 전화번호 처리
		String hos_tel = request.getParameter("frontNum") + "-" + request.getParameter("middleNum") + 
							"-" + request.getParameter("backNum");
		
		hospital.setHos_tel(hos_tel);
		
		// 3) 첨부파일 처리
		String filename = multiFile.getOriginalFilename(); // 첨부파일명
		int size = (int) multiFile.getSize(); // 첨부파일의 크기 (단위: Byte)

		String path = request.getRealPath("hos_upload");
		System.out.println("multiFile=" + multiFile);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result = 0;

		String file[] = new String[2];

		String newfilename = "";
		
		if (filename != "") { // 첨부파일이 첨부된 경우
			
			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); // 파일명 Koala
			file[1] = st.nextToken(); // 확장자 jpg

			if(size > 1024000) { // 1MB
				result = 1;
				model.addAttribute("result", result);

				return "hospital/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);
				
				return "hospital/uploadResult";
			}
		}

		// 첨부파일 전송
		if (size > 0) {
			multiFile.transferTo(new File(path + "/" + newfilename)); // 첨부파일을 서버측으로 전송시키는 코드
		}
			
		hospital.setHos_file(newfilename);

		// 3) insert 수행
		int insertResult = hospitalService.insert(hospital);
		
		model.addAttribute("insertResult", insertResult);
		
		return "hospital/result";
	}

	// 게시판 목록 검색 (전체 목록, 검색 목록)
	@RequestMapping("/hospitalList")
	public String hospitalList(String page, Hospital hospital, Model model) {
		
		final int rowPerPage = 10; // 화면에 출력할 데이터 갯수
		
		if (page == null || page.equals("")) {
			page = "1";
		}
		
		int currentPage = Integer.parseInt(page); 			// 현재 페이지 번호
		int total = hospitalService.getTotal(hospital); 	// 총 데이터 개수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm paging = new PagingPgm(total, rowPerPage, currentPage);
		System.out.println("paging:" +paging);
		
		hospital.setStartRow(startRow);
		hospital.setEndRow(endRow);
		System.out.println("startRow:"+startRow);
		System.out.println("startRow:"+endRow);
		
		int no = total - startRow + 1;							// 출력할 글 번호
		List<Hospital> list = hospitalService.list(hospital);	// 10개 데이터 구하기
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("paging", paging);
		
		// 검색
		model.addAttribute("search", hospital.getSearch());
		model.addAttribute("keyword", hospital.getKeyword());
			
		return "hospital/hospitalList";
	}
	
	// 상세 페이지
	@RequestMapping("hospitalView")
	public String hospitalView(int hos_no, String page, Model model ) {
		hospitalService.updateReadcnt(hos_no);				// 조회수 증가
		Hospital hospital = hospitalService.select(hos_no);	// 데이터 1개 구하기
		//System.out.println("상세페이지 컨트롤러 in");
		
		
		// 1) 주소 처리
		// 지도 출력을 위한 '주소'만 얻기 위해 우편번호 + 주소 + 상세 주소로 나누기
		StringTokenizer st = new StringTokenizer(hospital.getHos_addr(), "-");
		
		String post = st.nextToken();
		String addr = st.nextToken();
		String specificAddress = st.nextToken();
		//System.out.println("addr:"+addr);
		
		// 2) 내용과 운영시간 줄바꿈 처리
		String hos_content = hospital.getHos_content().replace("\n", "<br>");
		String hos_time = hospital.getHos_time().replace("\n", "<br>");
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("addr", addr);
		model.addAttribute("hos_content", hos_content);
		model.addAttribute("hos_time", hos_time);
		model.addAttribute("page", page);
		
		return "hospital/hospitalView";
	}
	
	// 글 수정 폼
	@RequestMapping("updateForm")
	public String updateForm(int hos_no, String page, Model model) {
		Hospital hospital = hospitalService.select(hos_no);
		
		// 1) 주소 처리
		StringTokenizer st01 = new StringTokenizer(hospital.getHos_addr(), "-");
		
		String post = st01.nextToken();
		String addr = st01.nextToken();
		String specificAddress = st01.nextToken();
		
		// 2) 전화번호 처리
		StringTokenizer st02 = new StringTokenizer(hospital.getHos_tel(), "-");
		
		String frontNum = st02.nextToken();	// 전화번호 첫째 자리
		String middleNum = st02.nextToken();	// 전화번호 가운데 자리
		String backNum = st02.nextToken();	// 전화번호 끝자리
				
		model.addAttribute("post", post);
		model.addAttribute("addr", addr);
		model.addAttribute("specificAddress", specificAddress);
		
		model.addAttribute("frontNum", frontNum);
		model.addAttribute("middleNum", middleNum);
		model.addAttribute("backNum", backNum);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("hos_no", hos_no);
		model.addAttribute("page", page);
		
		return "hospital/updateForm";
	}
	
	// 글 수정(update)
	@RequestMapping("update")
	public String update(@RequestParam("hos_file1") MultipartFile multi, 
						Hospital hospital, 
						String page,
						HttpServletRequest request,
						Model model) throws Exception {				
		
		// 1) 주소 처리		
		// 우편번호 + 주소 + 상세 주소
		String hos_addr = request.getParameter("post") + "-" + request.getParameter("addr")
        + "-" + request.getParameter("specificAddress");
		
		hospital.setHos_addr(hos_addr);				
		System.out.println("hos_addr:"+hos_addr);
		
				
		// 2) 전화번호 처리
		String hos_tel = request.getParameter("frontNum") + "-" + request.getParameter("middleNum") + 
									"-" + request.getParameter("backNum");			
		hospital.setHos_tel(hos_tel);
				
		// 3) 첨부파일 처리				
		String filename = multi.getOriginalFilename();
		int size = (int) multi.getSize();
		
		String path = request.getRealPath("hos_upload");
		System.out.println("path:"+path);
		
		int result = 0;
		String file[] = new String[2];
		
		String newfilename = "";
		
		if(filename != "") {	// 첨부파일이 전송된 경우
			
			// 파일 중복 문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+extension);
			
			UUID uuid = UUID.randomUUID();
			
			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);
			
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();		// 파일명
			file[1] = st.nextToken();		// 확장자
			
			if(size > 1024000) {
				result = 1;
				model.addAttribute("result", result);
				
				return "hospital/uploadResult";
				
			}else if(!file[1].equals("jpg") &&
					 !file[1].equals("gif") &&
					 !file[1].equals("png") ) {
				
				result = 2;
				model.addAttribute("result", result);
				
				return "hospital/uploadResult";
			}
			
		}
		
		// 첨부파일 전송
		if(size > 0) {
			
			multi.transferTo(new File(path + "/" + newfilename));
		}
				
		if(size > 0) {		// 첨부 파일이 수정되면
			hospital.setHos_file(newfilename);
		}else {				// 첨부파일이 수정되지 않으면
			// 원본 데이터(게시글) 구하기
			Hospital oldHospital = hospitalService.select(hospital.getHos_no());
			hospital.setHos_file(oldHospital.getHos_file());
		}
		
		int updateResult = hospitalService.update(hospital);	// 수정 메소드 호출
		
		model.addAttribute("updateResult", updateResult);
		model.addAttribute("hos_no", hospital.getHos_no());
		model.addAttribute("page", page);
		
		return "hospital/result";
	}
	
	
	// 글 삭제(delete)
	@RequestMapping("delete")
	public String delete() {
		
		return "hospitalList";
	}
	
	// 정렬
	
	
	// 필터 검색

}
