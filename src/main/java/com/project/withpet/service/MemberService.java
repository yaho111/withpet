package com.project.withpet.service;

import com.project.withpet.dao.MemberDAO;
import com.project.withpet.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    // 아이디 중복 체크
    public int checkMemberId(String id) throws Exception {
        return memberDAO.checkMemberId(id);
    }

    // 회원 가입
    public void insertMember(Member member) throws Exception {
        memberDAO.insertMember(member);
    }

    // 로그인
    public Member login(String id) throws Exception {
       return memberDAO.login(id);
    }

//    // 내 정보
//    public Member selectMember(String id) throws Exception {
//        return memberDAO.selectMember(id);
//    }
//
//    // 내 정보 수정
//    public void updateMember(Member member) throws Exception {
//        memberDAO.updateMember(member);
//    }
//
//    // 회원 탈퇴
//    public void deleteMember(Member member) throws Exception {
//        memberDAO.deleteMember(member);
//    }
//
//    // 아이디 검색
//    public Member findid(Member member) throws Exception {
//        return memberDAO.findid(member);
//    }
//
//    // 비밀번호 검색
//    public Member findpwd(Member member) throws Exception {
//        return memberDAO.findpwd(member);
//    }


}
