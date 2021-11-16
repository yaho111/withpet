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

	// 병원 게시판 글 작성 폼
	@RequestMapping("insertForm")
	public String insertForm() {
		return "hospital/insertForm";
	}

	// 글 작성(Insert)
	@RequestMapping("insert")
	public String insert(@RequestParam("hos_file1") MultipartFile multiFile, Hospital hospital, HttpServletRequest request,
			Model model) throws Exception {
		
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

			if(size > 100000) { // 100KB
				result = 1;
				model.addAttribute("result", result);

				return "hospital/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);
				
				return "hospital/uploadResult";
			}
		}

		if (size > 0) {
			multiFile.transferTo(new File(path + "/" + newfilename)); // 첨부파일을 서버측으로 전송시키는 코드
		}
			
		hospital.setHos_file(newfilename);

		hospitalService.insert(hospital);
		return "redirect:hospitalList";
	}

	// 병원 게시판 목록 검색 (전체 목록, 검색 목록)
	@RequestMapping("hospitalList")
	public String hospitalList(String page, Hospital hospital, Model model) {
		final int rowPerPage = 10; // 화면에 출력할 데이터 갯수
		if (page == null || page.equals("")) {
			page = "1";
		}
		int currentPage = Integer.parseInt(page); 		// 현재 페이지 번호
		int total = hospitalService.getTotal(hospital); // 총 데이터 개수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		hospital.setStartRow(startRow);
		hospital.setEndRow(endRow);
		
		int no = total - startRow + 1;
		List<Hospital> list = hospitalService.list(hospital);
		
		
		return "hospital/hospitalList";
	}

}
