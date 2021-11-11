package com.project.withpet.controller;

import com.project.withpet.model.Member;
import com.project.withpet.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {

    @Autowired
    private MemberServiceImpl memberService;

    // 로그인 폼
    @RequestMapping(value = "/login_form.do")
    public String member_loginForm() {
        System.out.println("login_form");
        return "member/loginForm";
    }

    // 로그인
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
                        HttpSession session, Model model) throws Exception {
        System.out.println("login");

        // 로그인 실패 시 다른 결과값을 보여주기 위한 변수 result
        int result = 0;
        Member member = memberService.login(id);

        // 등록되지 않은 맴버일 경우
        if(member == null) {

            result = 1;
            model.addAttribute("result", result);

            return "member/loginFail";
        } else {
            // 로그인 성공할 경우
            if( member.getPwd().equals(pwd)) {
                session.setAttribute("id", id);

                String name = member.getName();
                String profile = member.getProfile();

                model.addAttribute("name", name);
                model.addAttribute("profile", profile);

                return "home";
            } else {
                // 비밀번호가 일치하지 않을 경우
                result = 2;
                model.addAttribute("result", result);
                return "member/loginFail";
            }
        }
    }

    // 로그아웃
    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession session) {
        System.out.println("logout");
        session.invalidate();

        return "member/loginForm";
    }

    // 회원 가입 폼


    // 회원 가입


    // 비밀번호 찾기 폼


    // 비밀번호 찾기

    // 내 정보

    // 내 정보 수정 폼

    // 내 정보 수정

    // 회원 탈퇴 폼

    // 회원 탈퇴

    // 펫 등록 폼

    // 펫 등록

    // 사업자 등록 폼

    // 사업자 등록


}
