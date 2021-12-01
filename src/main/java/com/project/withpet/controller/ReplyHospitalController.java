package com.project.withpet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.withpet.model.Hospital;
import com.project.withpet.model.ReplyHospital;
import com.project.withpet.service.HospitalService;
import com.project.withpet.service.ReplyHospitalService;

// 댓글 목록 : 총데이터 값 구해오기 or <seletekey>로 최댓값 구해오기, 목록구해오기
// 댓글 작성 : 인서트
// 대댓글 작성 : 인서트 notReply_ref, notReply_lev, notReply_seq
// 댓글 수정 : 업데이트
// 댓글 작제 : Delete

@Controller
public class ReplyHospitalController {
	@Autowired
	private ReplyHospitalService replyHospitalService;
	@Autowired
	private HospitalService hospitalService;
	
	// 목록 구해오기
		@RequestMapping("hosReList")
		public String hosRelist(int hos_no, ReplyHospital replyHospital, Model model) {
			System.out.println("controller in");
			// 부모 테이블 상세정보 구해오기
			Hospital hospital = hospitalService.select(hos_no);
			System.out.println("hospital:"+hospital);
			
			// 목록 구해오기
			List<ReplyHospital> hosReList = replyHospitalService.hosRelist(hos_no);
			System.out.println("hosReList:"+hosReList);
			
			System.out.println(replyHospital.getHosReply_no());
			
			model.addAttribute("hosReList", hosReList);
			model.addAttribute("hospital", hospital);
			return "hospital/hosReList";
		}
		
		// 댓글 입력
		@RequestMapping("hosReInsert")
		public String hosReInsert(int hos_no, ReplyHospital replyHospital, Model model) {
			replyHospitalService.hosReInsert(replyHospital);
			return "redirect:hosReList?hos_no="+replyHospital.getHos_no();
		}
		
		// 댓글 수정
		@RequestMapping("hosReUpdate")
		public String hosReUpdate(int hos_no, int hosReply_no, ReplyHospital replyHospital, Model model) {
			System.out.println("댓글 수정 controller in");
			
			System.out.println("hosReply_no1:"+hosReply_no);
			System.out.println("hosReply_no2:"+replyHospital.getHosReply_no());
			System.out.println("hosReply_content:"+replyHospital.getHosReply_content());
			System.out.println("hos_no:"+replyHospital.getHos_no());
			
			

			int result = replyHospitalService.hosReUpdate(replyHospital);
			System.out.println("result:"+result);

			return "redirect:hosReList?hos_no="+replyHospital.getHos_no();
		}
		
		// 댓글 삭제
		@RequestMapping("hosReDelete")
		public String hosRedelete(int hos_no, ReplyHospital replyHospital, Model model) {
			replyHospitalService.hosReDelete(replyHospital.getHosReply_no());
			return "redirect:hosReList?hos_no="+replyHospital.getHos_no();
		}
}
