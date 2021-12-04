package com.project.withpet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.withpet.model.Comlike;
import com.project.withpet.model.Hoslike;
import com.project.withpet.model.Prolike;
import com.project.withpet.service.CommunityService;
import com.project.withpet.service.HospitalService;
import com.project.withpet.service.LikesService;
import com.project.withpet.service.ProductService;

@Controller
public class LikesController {

	@Autowired
	private LikesService likesService;
	
	@Autowired
	private HospitalService hospitalService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private ProductService productService;
	
	// 1. 추천 버튼 클릭 시(병원)
	@RequestMapping("/hosLikeInsert")
	public String likeInsert(Hoslike hoslike, Model model) {

		// 브라우저 출력을 통해 전달할 메세지
		String message = "";
		
		// 추천 버튼 클릭 시 전달 받은 hos_no(글 번호)와 id 값으로 추천 테이블에 데이터 존재 여부 확인
		Hoslike result = likesService.select(hoslike);
		
		if(result != null) {	// 이미 추천 이력이 존재하면
			message = "이미 추천하셨습니다!";
		}else {					// 추천 이력이 존재하지 않으면
			message = "추천했습니다!";
			likesService.insert(hoslike);
			
			// 병원 게시판 게시글 추천수 업데이트
			hospitalService.updateLike(hoslike.getHos_no());
		}
				
		model.addAttribute("message", message);
		return "likeResult";
	}	
	
	// 2. 추천 버튼 클릭 시(커뮤니티)
	@RequestMapping("/ComLikeInsert")
	public String likeInsert(Comlike comlike, Model model) {
		
		// 브라우저 출력을 통해 전달할 메세지
				String message = "";
				
				// 추천 버튼 클릭 시 전달 받은 com_no(글 번호)와 id 값으로 추천 테이블에 데이터 존재 여부 확인
				Comlike result = likesService.select(comlike);
				
				if(result != null) {	// 이미 추천 이력이 존재하면
					message = "이미 추천하셨습니다!";
				}else {					// 추천 이력이 존재하지 않으면
					message = "추천했습니다!";
					likesService.insert(comlike);
					
					// 커뮤니티 게시판 게시글 추천수 업데이트
					communityService.updateLike(comlike.getCom_no());
				}
						
				model.addAttribute("message", message);
				return "likeResult";
	}
	
	// 3. 추천 버튼 클릭 시(상품)
	@RequestMapping("/ProLikeInsert")
	public String likeInsert(Prolike prolike, Model model) {

		// 브라우저 출력을 통해 전달할 메세지
		String message = "";
		
		// 추천 버튼 클릭 시 전달 받은 hos_no(글 번호)와 id 값으로 추천 테이블에 데이터 존재 여부 확인
		Prolike result = likesService.select(prolike);
		
		if(result != null) {	// 이미 추천 이력이 존재하면
			message = "이미 추천하셨습니다!";
		}else {					// 추천 이력이 존재하지 않으면
			message = "추천했습니다!";
			likesService.insert(prolike);
			
			// 상품 게시판 게시글 추천수 업데이트
			productService.updateLike(prolike.getPro_no());
		}
				
		model.addAttribute("message", message);
		return "likeResult";
	}
}
