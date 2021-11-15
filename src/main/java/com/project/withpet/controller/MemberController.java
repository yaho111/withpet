package com.project.withpet.controller;

import com.project.withpet.model.Member;
import com.project.withpet.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 로그인 폼
    @RequestMapping(value = "/login_form.do")
    public String forwardLoginForm() {
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
    @RequestMapping(value = "/join_form.do")
    public String forwardJoinForm() {
        return "member/joinForm";
    }

    // 아이디 중복 검사
    @RequestMapping(value = "/id_check.do", method = RequestMethod.POST)
    public String idCheck(@RequestParam("id") String id, Model model) throws Exception {
        int result = memberService.checkMemberId(id);
        System.out.println(result);

        model.addAttribute("result", result);

        return "member/idCheckResult";
    }

    // 회원 가입
    @RequestMapping(value = "/join.do", method = RequestMethod.POST)
    public String join(Member member, HttpServletRequest request) throws  Exception {

        String addr = request.getParameter("post") + "-" + request.getParameter("addr")
                + "-" + request.getParameter("specificAddress");
        String email = request.getParameter("mailId") + "@" + request.getParameter("domain");
        String phone = request.getParameter("frontNum") + "-" + request.getParameter("middleNum")
                + "-" + request.getParameter("backNum");

        member.setId(request.getParameter("id").trim());
        member.setNick(request.getParameter("nick").trim());
        member.setPwd(request.getParameter("pwd").trim());
        member.setAddr(addr);
        member.setName(request.getParameter("name").trim());
        member.setEmail(email);
        member.setPhone(phone);
        member.setGender(request.getParameter("gender"));

        memberService.insertMember(member);

        return "redirect:login_form.do";

    }

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
