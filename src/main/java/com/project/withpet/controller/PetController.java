package com.project.withpet.controller;

import com.project.withpet.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PetController {

    @Autowired
    private PetService petService;

    // 펫 등록 페이지
    @RequestMapping(value = "/petEnrollForm")
    public String forwardPetEnrollForm() {
        return "pet/petEnrollForm";
    }
    // 펫 등록

    // 펫 조회

    // 펫 정보 수정 페이지

    // 펫 정보 수정

    // 펫 삭제
}
