package com.project.withpet.controller;

import com.project.withpet.model.Business;
import com.project.withpet.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BusinessController {

    @Autowired
    private BusinessService businessService;

    // 사업자 등록 페이지
    @RequestMapping(value = "/businessEnrollForm")
    public String forwardBusinessEnrollForm() {
        return "business/businessEnrollForm";
    }

    // 사업자 등록 신청
    @RequestMapping(value = "/enrollBusiness", method = RequestMethod.POST)
    public String enrollBusiness (@ModelAttribute Business business, HttpServletRequest request, Model model) throws Exception{

        String bus_addr = request.getParameter("post") + "-" + request.getParameter("addr")
                + "-" + request.getParameter("specificAddress");
        String bus_tel = request.getParameter("frontNum") + "-" + request.getParameter("middleNum")
                + "-" + request.getParameter("backNum");

        business.setBus_addr(bus_addr);
        business.setBus_tel(bus_tel);

        System.out.println(business.getBus_id());
        System.out.println(business.getBus_sort());
        System.out.println(business.getBus_name());
        businessService.enrollBusiness(business);

        return "redirect:myPage";
    }

    // 사업 관리 페이지
    @RequestMapping(value = "/businessList")
    public String forwardBusinessList(HttpSession session, Model model) throws Exception{
        String id = (String) session.getAttribute("id");

        List<Business> businessList = businessService.selectBusinessList(id);

        model.addAttribute(businessList);

        return "business/businessList";
    }

//    // 사업자 변경 신청 페이지
//    @RequestMapping(value = "/businessUpdateForm")
//    public String forwardBusinessUpdateForm(HttpServletRequest request, Model model) throws Exception{
//        int bus_no = Integer.parseInt(request.getParameter("bus_no"));
//
//        Business selectedBusiness = businessService.selectBusiness(bus_no);
//
//        model.addAttribute("selectedBusiness", selectedBusiness);
//
//        return "business/businessUpdateForm";
//
//    }

    // 사업자 변경 신청

    // 사업 삭제 페이지

    // 사업 삭제


}
