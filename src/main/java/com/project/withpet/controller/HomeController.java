package com.project.withpet.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.project.withpet.model.Community;
import com.project.withpet.model.Hospital;
import com.project.withpet.model.Member;
import com.project.withpet.model.Product;
import com.project.withpet.service.CommunityService;
import com.project.withpet.service.HospitalService;
import com.project.withpet.service.MemberService;
import com.project.withpet.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import scala.sys.process.ProcessBuilderImpl.Simple;

import javax.servlet.http.HttpSession;


@Controller
public class HomeController {

	@Autowired
	private CommunityService communityService;

	@Autowired
	private ProductService productService;

	@Autowired
	private HospitalService hospitalService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(HttpSession session, Community community, Hospital hospital, Product product, Model model) throws Exception{

		String loginId = (String) session.getAttribute("id");

		if(loginId != null){
			Member loginMember = memberService.selectMember(loginId);
			String address = loginMember.getAddr().split("\\+")[1];

			System.out.println(address);

			hospital.setSearch("hos_loc");
			hospital.setKeyword(address);
		}



		community.setSortValue("readcnt");
		community.setStartRow(1);
		community.setEndRow(8);


		List<Community> communityList = communityService.List(community);

		hospital.setSortValue("readcnt");
		hospital.setStartRow(1);
		hospital.setEndRow(8);

		List<Hospital> hospitalList = hospitalService.list(hospital);

		product.setSortValue("readcnt");
		product.setStartRow(1);
		product.setEndRow(8);

		List<Product> productList = productService.list(product);

		model.addAttribute("communityList", communityList);
		model.addAttribute("hospitalList",hospitalList);
		model.addAttribute("productList", productList);

		return "home";
	}
	
}
