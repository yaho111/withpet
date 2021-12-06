package com.project.withpet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
// 쇼핑몰 업체 :product_pro
// 병원 업체 : hospital_pro

@Controller
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	@Autowired
	private BusinessService businessService;

	// 관리자 메인 페이지
	@RequestMapping(value = "managerwithpet", method = RequestMethod.GET)
	public String mangerPage() {
		return "manager/manager";
	}

	// 회원 목록 출력
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
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

		return "manager/memberList";
	}

	// 회원 상세
	@RequestMapping(value = "memberView", method = RequestMethod.GET)
	public String memberView(String id, Model model) {

		Member member = managerService.memberSelect(id);

		model.addAttribute("member", member);

		return "manager/memberView";
	}

	// 회원 삭제
	@RequestMapping(value = "memberDelete", method = RequestMethod.GET)
	public String memberDelete(String id, Model model) {
		System.out.println("회원 삭제 컨트롤러");

		System.out.println(id);

		managerService.memberDelete(id);

		return "redirect:memberList";
	}

	
	
	
	// 관리자 목록 출력
	@RequestMapping(value = "managerList", method = RequestMethod.GET)
	public String managerListPage(Member member, String search, String keyword, Model model) {

		// 총 데이터 구해오기
		int memberTotal = managerService.getCount(member);
		System.out.println("totalData:" + memberTotal);

		// 회원 목록 출력
		List<Member> memberList = managerService.memberList(member);
		System.out.println("memberList : " + memberList);

		model.addAttribute("memberList", memberList);
		model.addAttribute("memberTotal", memberTotal);

		return "manager/managerList";
	}

	// 관리자 상세
	@RequestMapping(value = "managerView", method = RequestMethod.GET)
	public String managerView(String id, Model model) {

		Member member = managerService.memberSelect(id);

		model.addAttribute("member", member);

		return "manager/managerView";
	}

	// 관리자 등록
	@RequestMapping(value = "managerInsert", method = RequestMethod.GET)
	public String hospitalInsert(Member member, Model model) {
		System.out.println("id : " + member.getId());
		System.out.println("role : " + member.getRole());

		int result = managerService.managerInsert(member);
		System.out.println("result : " + result);
		return "redirect:managerView?id=" + member.getId();
	}

	// 관리자 직위 해제
	@RequestMapping(value = "managerDown", method = RequestMethod.GET)
	public String managerDown(String id, Model model) {
		System.out.println("관리자 다운 컨트롤러");

		Member member = managerService.memberSelect(id);

		System.out.println(id);

		int down = managerService.managerDown(member);
		System.out.println("down : " + down);

		return "redirect:managerList";
	}

	
	
	
	
	// 사업자 목록 출력
	@RequestMapping(value = "businessPeople", method = RequestMethod.GET)
	public String businessListPage(Business business, Member member, String search, String keyword, Model model) {
		// 총 데이터 구해오기
		int memberTotal = managerService.getCount(member);
		System.out.println("totalData:" + memberTotal);

		// 사업자 목록 출력
		List<Member> memberList = managerService.memberList(member);
		System.out.println("memberList : " + memberList);

		// 사업자 목록 불러오기
		List<Business> selectWaitAccept = managerService.selectBusinessList(business);
		System.out.println("selectWaitAccept: " + selectWaitAccept);

		// 회원
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberTotal", memberTotal);

		// 검색
		model.addAttribute("search", member.getSearch());
		model.addAttribute("keyword", member.getKeyword());
		
		// 사업자
		model.addAttribute("selectWaitAccept", selectWaitAccept);

		return "manager/businessPeople";
	}

	// 사업체 상세
	@RequestMapping(value = "businessView", method = RequestMethod.GET)
	public String businessView(String id, Model model) {

		Member member = managerService.memberSelect(id);

		model.addAttribute("member", member);

		return "manager/businessView";
	}

	// 사업체 삭제
	@RequestMapping(value = "businessDelete", method = RequestMethod.GET)
	public String businessDelete(String id, Model model) throws Exception {
		System.out.println("사업체 삭제 컨트롤러");

		Member member = managerService.memberSelect(id);

		System.out.println(id);

		int down = managerService.managerDown(member);
		System.out.println("down : " + down);
		
		String bus_id = member.getId();
		System.out.println("bus_id : "+bus_id);
		
		businessService.deleteBusiness(bus_id);

		return "redirect:businessPeople";
	}

//	// 사업 승인 대기 목록 페이지
//	@RequestMapping(value = "selectWaitAccept")
//	public String selectWaitAccept(Business business, Model model) throws Exception {
//		System.out.println("Cotroller 사업자 승인");
//
//		// 사업자 목록 불러오기
//		List<Business> selectWaitAccept = managerService.selectBusinessList(business);
//		System.out.println("selectWaitAccept: " + selectWaitAccept);
//
//		model.addAttribute("selectWaitAccept", selectWaitAccept);
//
//		return "redirect:businessList";
//	}

	// 사업체 승인
	@RequestMapping(value = "businessAccept", method = RequestMethod.GET)
	public String businessAccept(String bus_no, Business business, Model model) throws Exception{
		System.out.println("승인 요청 번호 bus_no : " + bus_no);

		// 사업자 아이디를 통한 상새정보 불러오기
		Business selectedBusiness = businessService.selectBusiness(bus_no);
		System.out.println("selectedBusiness: " + selectedBusiness);
		System.out.println("선택된 business 객체의 id " + selectedBusiness.getBus_id());

		// 요청 승인
		int businessAccept = managerService.businessAccept(selectedBusiness);
		System.out.println("businessAccept : " + businessAccept);	// DAO의 roleChangeResult의 값을 돌려준다. 

		return "redirect:businessPeople";
	}

	// 사업체 거절
	@RequestMapping(value = "businessNotAccept", method = RequestMethod.GET)
	public String businessNotAccept(String bus_no, Model model) throws Exception {

		Business business = businessService.selectBusiness(bus_no);
		System.out.println("business : "+business);
		
		int businessNotAccept = managerService.businessNotAccept(bus_no);
		System.out.println("businessNotAccept : "+businessNotAccept);

		return "redirect:businessPeople";
	}

}
