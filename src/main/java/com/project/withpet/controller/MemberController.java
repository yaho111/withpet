package com.project.withpet.controller;

import com.project.withpet.model.Member;
import com.project.withpet.model.Pet;
import com.project.withpet.service.MemberService;
import com.project.withpet.service.PetService;
import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.io.Resources;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private PetService petService;

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
    public String findPwd(@ModelAttribute Member member, Model model) throws Exception {


        Member foundMember = memberService.findPwd(member);

        if (foundMember == null) {
            return "member/pwdResult";
        } else {

            // .properties 파일 읽어오기
            Properties properties = new Properties();
            try {
                Reader reader = Resources.getResourceAsReader("application.properties");
                properties.load(reader);
            } catch (IOException e) {
                e.printStackTrace();
            }


            // Mail Server 설정
            String charSet = "utf-8";
            String hostSmtp = "smtp.naver.com";
            String hostSmtpId = properties.getProperty("mail.hostSmtpId");
            String hostSmtpPwd = properties.getProperty("mail.hostSmtpPwd");

            // 보내는 사람 Email, 제목, 내용

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
                htmlEmail.setFrom(hostSmtpId, senderName, charSet);
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

    // 아이디 찾기 폼
    @RequestMapping(value = "/idFindForm")
    public String forwardIdFindForm() {
        return "member/idFindForm";
    }

    // 아이디 찾기
    @RequestMapping(value = "/findId")
    public String findId(@ModelAttribute Member member, Model model) {

        member.setName(member.getName().trim());
        member.setEmail(member.getEmail().trim());

        List<String> foundId = memberService.findId(member);


        if (foundId == null) {
            return "member/idResult";
        } else {

            model.addAttribute("idResult", foundId);
            return "member/idFindForm";
        }


    }

    // 내 정보
    @RequestMapping(value = "/myPage")
    public String myPage(HttpSession session, Model model) throws Exception {
        String id = session.getAttribute("id").toString();
        System.out.println(id);

        Member member = memberService.selectMember(id);

        List<Pet> petList = petService.selectPetList(id);


        model.addAttribute(member);
        model.addAttribute("petList", petList);

        return "member/myPage";
    }

    // 내 정보 수정 폼
    @RequestMapping(value = "/infoUpdateForm")
    public String forwardMyInfoUpdateForm(HttpSession session, Model model) throws Exception {

        String loginId = session.getAttribute("id").toString();

        Member loginMember = memberService.selectMember(loginId);

        String[] addr = loginMember.getAddr().split("-");
        String post = addr[0];
        String address = addr[1];
        String specificAddress = addr[2];

        String[] phoneNum = loginMember.getPhone().split("-");
        String frontNum = phoneNum[0];
        String middleNum = phoneNum[1];
        String backNum = phoneNum[2];

        String[] email = loginMember.getEmail().split("@");
        String mailId = email[0];
        String domain = email[1];

        model.addAttribute(loginMember);
        model.addAttribute("post", post);
        model.addAttribute("address", address);
        model.addAttribute("specificAddress", specificAddress);
        model.addAttribute("frontNum", frontNum);
        model.addAttribute("middleNum", middleNum);
        model.addAttribute("backNum", backNum);
        model.addAttribute("mailId", mailId);
        model.addAttribute("domain", domain);
        return "member/infoUpdateForm";
    }


    // 내 정보 수정
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateMyInfo(@RequestParam("profilePic") MultipartFile multipartFile,
                               Member member,
                               HttpServletRequest request,
                               HttpSession session,
                               Model model) throws Exception {

        // 필요한 변수 생성
        String filename = multipartFile.getOriginalFilename();
        int size = (int) multipartFile.getSize();
        int result = 0;

        String path = request.getRealPath("upload");
        System.out.println("path: " + path);
        String[] file;
        String newFileName = "";

        String loginId = session.getAttribute("id").toString();
        Member loginMember = memberService.selectMember(loginId);

        // 파일이 전송된 경우
        if (filename != "") {

            file = filename.split("\\.");

            String extension = "." + file[1];

            UUID uuid = UUID.randomUUID();

            newFileName = uuid + extension;
            System.out.println(newFileName);

            if (size > 1000000) { // 파일크기가 지정 한도를 초과하는 경우
                result = 1;
                model.addAttribute("result", result);

                return "member/uploadResult";
            } else if (!file[1].equals("jpg") &&
                    !file[1].equals("gif") &&
                    !file[1].equals("png")) { // 파일의 확장자가 가능한 확장자가 아닌 경우

                result = 2;
                model.addAttribute("result", result);

                return "member/uploadResult";
            }


        }

        if (size > 0) {
            multipartFile.transferTo(new File(path + "/" + newFileName));
            member.setProfile(newFileName);
        } else {
            member.setProfile(loginMember.getProfile());
        }

        // 정보 수정 입력폼에서 받은 데이터를 DB 형식에 맞게 변형
        String addr = request.getParameter("post").trim() + "-" + request.getParameter("addr").trim()
                + "-" + request.getParameter("specificAddress").trim();
        String phone = request.getParameter("frontNum").trim() + "-" + request.getParameter("middleNum").trim()
                + "-" + request.getParameter("backNum").trim();
        String email = request.getParameter("mailId").trim() + "@" + request.getParameter("domain").trim();

        member.setId(loginId);
        member.setPwd(request.getParameter("pwd").trim());
        member.setName(request.getParameter("name").trim());
        member.setAddr(addr);
        member.setPhone(phone);
        member.setEmail(email);

        memberService.updateMember(member);

        return "redirect:myPage";

    }

    // 회원 탈퇴 폼
    @RequestMapping(value = "/memberDeleteForm")
    public String forwardWithdrawForm(){
        return "member/memberDeleteForm";
    }

    // 회원 탈퇴
    @RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
    public String withdraw(@RequestParam("pwd") String pwd ,HttpSession session) throws Exception{
        String loginId = (String) session.getAttribute("id");

        Member loginMember = memberService.selectMember(loginId);

        if (loginMember.getPwd().equals(pwd)) {
            String path = session.getServletContext().getRealPath("upload");
            String profile = loginMember.getProfile();

            if(profile != null){
               File needToDelete = new File(path + "/" + profile);
               needToDelete.delete();
            }
            memberService.deleteMember(loginId);

            session.invalidate();

            return "redirect:loginForm";
        } else {
            return "member/memberDeleteResult";
        }
    }


    // 펫 등록 폼

    // 펫 등록

    // 사업자 등록 폼

    // 사업자 등록


}
