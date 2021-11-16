package com.project.withpet.controller;

import com.project.withpet.model.Member;
import com.project.withpet.service.MemberService;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 로그인 폼
    @RequestMapping(value = "/loginForm")
    public String forwardLoginForm() {
        System.out.println("loginForm");
        return "member/loginForm";
    }

    // 로그인
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
                        HttpSession session, Model model) throws Exception {
        System.out.println("login");

        // 로그인 실패 시 다른 결과값을 보여주기 위한 변수 result
        int result = 0;
        Member member = memberService.login(id);

        // 등록되지 않은 맴버일 경우
        if (member == null) {

            result = 1;
            model.addAttribute("result", result);

            return "member/loginFail";
        } else {
            // 로그인 성공할 경우
            if (member.getPwd().equals(pwd)) {
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
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        System.out.println("logout");
        session.invalidate();

        return "member/loginForm";
    }

    // 회원 가입 폼
    @RequestMapping(value = "/joinForm")
    public String forwardJoinForm() {
        return "member/joinForm";
    }

    // 아이디 중복 검사
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    public String idCheck(@RequestParam("id") String id, Model model) throws Exception {
        int result = memberService.checkMemberId(id);
        System.out.println(result);

        model.addAttribute("result", result);

        return "member/idCheckResult";
    }

    // 회원 가입
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(Member member, HttpServletRequest request) throws Exception {

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

        return "redirect:loginForm";

    }

    // 비밀번호 찾기 폼
    @RequestMapping(value = "/pwdFindForm")
    public String forwardFindPwdForm() {
        return "member/pwdFindForm";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "/findPwd", method = RequestMethod.POST)
    public String findPwd(@ModelAttribute Member member, HttpServletResponse response, Model model) throws Exception {


        Member foundMember = memberService.findPwd(member);

        if(foundMember == null) {
            return "member/pwdResult";
        } else {

            // Mail Server 설정
            String charSet = "utf-8";
            String hostSmtp = "smtp.naver.com";
            String hostSmtpId = "byeongchae44@naver.com";
            String hostSmtpPwd = "xptmxmdyd123*";

            // 보내는 사람 Email, 제목, 내용
            String emailSender = "byeongchae44@naver.com";
            String senderName = "withpet 사이트 관리자";
            String content = "비밀번호 찾기";

            // 받는 사람 Email 주소
            String mail = foundMember.getEmail();

            try {
                HtmlEmail htmlEmail = new HtmlEmail();
                htmlEmail.setDebug(true);
                htmlEmail.setCharset(charSet);
                htmlEmail.setSSL(true);
                htmlEmail.setHostName(hostSmtp);
                htmlEmail.setSmtpPort(465);

                htmlEmail.setAuthentication(hostSmtpId, hostSmtpPwd);
                htmlEmail.setTLS(true);
                htmlEmail.addTo(mail, charSet);
                htmlEmail.setFrom(emailSender, senderName, charSet);
                htmlEmail.setSubject(content);
                htmlEmail.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
                        + foundMember.getPwd() + "</div>");
                htmlEmail.send();
            } catch (Exception e) {
                System.out.println(e);
            }

            model.addAttribute("pwdResult", "등록된 Email 을 확인하세요.");
            return "member/pwdFindForm";
        }

    }
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
