package com.project.withpet.controller;

import com.project.withpet.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    

    // 사업자 변경 신청 페이지

    // 사업자 변경 신청

    // 사업 삭제 페이지

    // 사업 삭제


}
