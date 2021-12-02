package com.project.withpet.controller;

import java.io.FileWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.withpet.model.Notice;
import com.project.withpet.model.ReplyNotice;
import com.project.withpet.service.NoticeService;
import com.project.withpet.service.ReplyNoticeService;
import com.sun.mail.iap.Response;

// 댓글 목록 : 총데이터 값 구해오기 or <seletekey>로 최댓값 구해오기, 목록구해오기
// 댓글 작성 : 인서트
// 대댓글 작성 : 인서트 notReply_ref, notReply_lev, notReply_seq
// 댓글 수정 : 업데이트
// 댓글 작제 : Delete

@Controller
public class ReplyNoticeController {
	@Autowired
	private ReplyNoticeService replyNoticeService;
	@Autowired
	private NoticeService noticeService;
	
	// 목록 구해오기
		@RequestMapping("notReList")
		public String slist(int not_no, ReplyNotice replyNotice, Model model) {
			System.out.println("controller in");
			// 부모 테이블 상세정보 구해오기
			Notice notice = noticeService.noticeSelect(not_no);
			System.out.println("notice:"+notice);
			
			// 총 데이터 갯수
//			 int reTotal = replyNoticeService.getCount(replyNotice);
//			 System.out.println("reTotal : " + reTotal);
			// 목록 구해오기
			List<ReplyNotice> notReList = replyNoticeService.notRelist(not_no);
			System.out.println("notReList:"+notReList);
			
			System.out.println(replyNotice.getNotReply_no());
			
			model.addAttribute("notReList", notReList);
//			model.addAttribute("reTotal", reTotal);
			model.addAttribute("notice", notice);
			return "notice/notReList";
		}
		
		// 댓글 입력
		@RequestMapping("notReInsert")
		public String notReInsert(int not_no, ReplyNotice replyNotice, Model model) {
			replyNoticeService.notReInsert(replyNotice);
			return "redirect:notReList?not_no="+replyNotice.getNot_no();
		}
		
		// 댓글 수정
		@RequestMapping("notReUpdate")
		public String notReUpdate(int not_no, int notReply_no, ReplyNotice replyNotice, Model model) {
			System.out.println("댓글 수정 controller in");
			
			System.out.println("notReply_no1:"+notReply_no);
			System.out.println("notReply_no2:"+replyNotice.getNotReply_no());
			System.out.println("notReply_content:"+replyNotice.getNotReply_content());
			System.out.println("not_no:"+replyNotice.getNot_no());
			
			
//			replyNotice.setNotReply_no(notReply_no);
			int result = replyNoticeService.notReUpdate(replyNotice);
			System.out.println("result:"+result);
//			if(result == 1) {
//				model.addAttribute("result", result);
//			}
			return "redirect:notReList?not_no="+replyNotice.getNot_no();
		}
		
		// 댓글 삭제
		@RequestMapping("notReDelete")
		public String notRedelete(int not_no, ReplyNotice replyNotice, Model model) {
			replyNoticeService.notReDelete(replyNotice.getNotReply_no());
			return "redirect:notReList?not_no="+replyNotice.getNot_no();
		}
		

	

}
