package com.project.withpet.controller;

import java.io.FileWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.withpet.model.Community;
import com.project.withpet.model.ReplyCommunity;
import com.project.withpet.service.CommunityService;
import com.project.withpet.service.ReplyCommunityService;
import com.sun.mail.iap.Response;

// 댓글 목록 : 총데이터 값 구해오기 or <seletekey>로 최댓값 구해오기, 목록구해오기
// 댓글 작성 : 인서트
// 대댓글 작성 : 인서트 notReply_ref, notReply_lev, notReply_seq
// 댓글 수정 : 업데이트
// 댓글 작제 : Delete

@Controller
public class ReplyCommunityController<ReplyNotice> {
	@Autowired
	private ReplyCommunityService replyCommunityService;
	@Autowired
	private CommunityService communityService;
	
	// 목록 구해오기
		@RequestMapping("comReList")
		public String slist(int com_no, ReplyCommunity replyCommunity, Model model) {
			System.out.println("controller in");
			// 부모 테이블 상세정보 구해오기
			Community community = communityService.getBoard(com_no);
			System.out.println("community:"+community);
			
			// 목록 구해오기
			List<ReplyCommunity> comReList = replyCommunityService.comRelist(com_no);
			System.out.println("comReList:"+comReList);
			
			
			model.addAttribute("comReList", comReList);
			model.addAttribute("community", community);
			return "community/comReList";
		}
		
		// 댓글 입력
		@RequestMapping("comReInsert")
		public String comReInsert(int com_no, ReplyCommunity replycommunity, Model model) {
			replyCommunityService.comReInsert(replycommunity);
			return "redirect:comReList?com_no="+replycommunity.getCom_no();
		}
		
		// 댓글 수정
		@RequestMapping("comReUpdate")
		public String repUpdate(int com_no, int comReply_no, ReplyCommunity replyCommunity, Model model) {
			System.out.println("댓글 수정 controller in");
			
			System.out.println("comReply_no1:"+comReply_no);
			System.out.println("comReply_no2:"+replyCommunity.getComReply_no());
			System.out.println("comReply_content:"+replyCommunity.getComReply_content());
			System.out.println("com_no:"+replyCommunity.getCom_no());
			
			
//			replyNotice.setNotReply_no(notReply_no);
			int result = replyCommunityService.comReUpdate(replyCommunity);
			System.out.println("result:"+result);
//			if(result == 1) {
//				model.addAttribute("result", result);
//			}
			return "redirect:comReList?com_no="+replyCommunity.getCom_no();
		}
		
		// 댓글 삭제
		@RequestMapping("comReDelete")
		public String delete(int com_no, ReplyCommunity replyCommunity, Model model) {
			replyCommunityService.comReDelete(replyCommunity.getComReply_no());
			return "redirect:comReList?com_no="+replyCommunity.getCom_no();
		}
		
		// 대댓글 입력
//		@RequestMapping("notReInsert")
//		public String notResInsert(int not_no, ReplyNotice replyNotice, Model model) {
//			replyNoticeService.notResInsert(replyNotice);
//			return "redirect:slist?num="+replyNotice.getNot_no();
//		}
	

}
