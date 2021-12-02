package com.project.withpet.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.withpet.model.Business;
import com.project.withpet.model.Member;
import com.project.withpet.model.Qna;
import com.project.withpet.service.BusinessService;
import com.project.withpet.service.ManagerService;
import com.project.withpet.service.PagingPgm;

// roll 값 정리
// 최고 관리자 : master
// 쇼핑몰 관리자 : product
// 커뮤니티 관리자 : community
// 공지사항 관리자 : notice
// Q/A 관리자 : qna
// 병원 관리자 :hospital
// 쇼핑몰 업체 :product_bus
// 병원 업체 : hospital_bus

@Controller
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	@Autowired
	private BusinessService businessService;

	// 관리자 메인 페이지
	@RequestMapping(value = "manager", method = RequestMethod.GET)
	public String mangerPage() {
		return "manager/manager";
	}

//	
//	//회원 목록 틀
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	public String memberList() {
		return "manager/memberList";

	}

//	
	// 회원 목록 출력
	@RequestMapping(value = "memberListPage", method = RequestMethod.GET)
	public String memberListPage(Member member, String search, String keyword, Model model) {

		// 총 데이터 구해오기
		int memberTotal = managerService.getCount(member);
		System.out.println("totalData:" + memberTotal);

		// 회원 목록 출력
		List<Member> memberList = managerService.memberList(member);
		System.out.println("memberList : " + memberList);

		model.addAttribute("memberList", memberList);
		model.addAttribute("memberTotal", memberTotal);

		// 검색
		model.addAttribute("search", member.getSearch());
		model.addAttribute("keyword", member.getKeyword());

		return "manager/memberListPage";
	}

	// 회원 상세
	@RequestMapping(value = "memberView", method = RequestMethod.GET)
	public String memberView(String id, Model model) {

		Member member = managerService.memberSelect(id);

		model.addAttribute("member", member);

		return "manager/memberView";
	}

	// 회원 삭제
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public String memberDelete(String id, Model model) {
		System.out.println("회원 삭제 컨트롤러");

		System.out.println(id);

		managerService.memberDelete(id);

		return "redirect:memberListPage";
	}

	// 회원 관리자 등록
	// 관리자 등록
		@RequestMapping(value = "managerInsert", method = RequestMethod.GET)
		public String hospitalInsert(Member member, Model model) {
			System.out.println("id : "+ member.getId());
			System.out.println("role : "+ member.getRole());
			
			int result = managerService.managerInsert(member);
			System.out.println("result : "+ result);
			return "redirect:memberView?id="+member.getId();		
		}

		
		

//	//관리자 목록 틀
	@RequestMapping(value = "managerList", method = RequestMethod.GET)
	public String managerList() {
		return "manager/managerList";

	}

	// 관리자 목록 출력
	@RequestMapping(value = "managerListPage", method = RequestMethod.GET)
	public String managerListPage(Member member, String search, String keyword, Model model) {

		// 총 데이터 구해오기
		int memberTotal = managerService.getCount(member);
		System.out.println("totalData:" + memberTotal);

		// 회원 목록 출력
		List<Member> memberList = managerService.memberList(member);
		System.out.println("memberList : " + memberList);

		model.addAttribute("memberList", memberList);
		model.addAttribute("memberTotal", memberTotal);

		// 검색
		model.addAttribute("search", member.getSearch());
		model.addAttribute("keyword", member.getKeyword());

		return "manager/managerListPage";
	}

	// 관리자 상세
	@RequestMapping(value = "managerView", method = RequestMethod.GET)
	public String managerView(String id, Model model) {

		Member member = managerService.memberSelect(id);

		model.addAttribute("member", member);

		return "manager/managerView";
	}

	// 관리자 삭제
	@RequestMapping(value = "managerDelete", method = RequestMethod.POST)
	public String managerDelete(String id, Model model) {
		System.out.println("관리자 삭제 컨트롤러");

		System.out.println(id);

		managerService.memberDelete(id);

		return "redirect:managerListPage";
	}

	
	
	
	
	
	//사업체 승인
	@RequestMapping(value = "businessAccept")
	public String businessAccept(Member member, Business business, Model model) throws Exception {
		String bus_no = business.getBus_no();
		
		// 사업자 요청 목록 출력
		Business selectedBusiness = businessService.selectBusiness(bus_no);
		
//		// 요청 승인
//		int businessAccept = managerService.businessAccept(bus_no);
//		System.out.println("businessAccept : " +businessAccept);
		
		// 요청 승인된 사업자 조회
		
		// sort에 따른 롤 부여
//		int roleResult = managerService.roleChange(member);
		
		model.addAttribute("selectedBusiness",selectedBusiness);
		
		return "redirect:businessListPage";
	}
	
	
	
	
	// 사업체 등록
//	@RequestMapping(value = "businessInsert")
//	public String businessInsert() {
//		
//	}
	
	
	
	
	// 회원 목록 틀
	@RequestMapping(value = "businessListForm", method = RequestMethod.GET)
	public String businessList() {
		return "manager/businessListForm";

	}

	// 사업자 목록 출력
	@RequestMapping(value = "businessListPage", method = RequestMethod.GET)
	public String businessListPage(Member member, String search, String keyword, Model model) {
		// 총 데이터 구해오기
		int memberTotal = managerService.getCount(member);
		System.out.println("totalData:" + memberTotal);

		// 회원 목록 출력
		List<Member> memberList = managerService.memberList(member);
		System.out.println("memberList : " + memberList);

		model.addAttribute("memberList", memberList);
		model.addAttribute("memberTotal", memberTotal);

		// 검색
		model.addAttribute("search", member.getSearch());
		model.addAttribute("keyword", member.getKeyword());

		return "manager/businessListPage";
	}

	// 사업체 상세
	@RequestMapping(value = "businessView", method = RequestMethod.GET)
	public String businessView(String id, Model model) {

		Member member = managerService.memberSelect(id);

		model.addAttribute("member", member);

		return "manager/businessView";
	}

	// 사업체 삭제
	@RequestMapping(value = "businessDelete", method = RequestMethod.POST)
	public String businessDelete(String id, Model model) {
		System.out.println("사업체 삭제 컨트롤러");

		System.out.println(id);

		managerService.memberDelete(id);

		return "redirect:businessListPage";
	}

}
