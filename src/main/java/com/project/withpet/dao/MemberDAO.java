package com.project.withpet.dao;

import com.project.withpet.model.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@Repository
public class MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    // 아이디 중복 체크
    public int checkMemberId(String id) throws Exception {

        int result = -1; // 사용 가능한 ID
        Member member = sqlSession.selectOne("check_id", id);

        if (member != null) result = 1; // 중복 ID

        return result;
    }

    // 회원 가입
    public void insertMember(Member member) throws Exception {
        sqlSession.insert("join", member);
    }

    // 로그인
    public Member login(String id) throws Exception {
        return sqlSession.selectOne("check_id", id);
    }

    // 비밀번호 검색
    public Member findPwd(Member member) throws Exception {
        return sqlSession.selectOne("pwd_find", member);
    }

    // 아이디 검색
    public Member findId(Member member) {
        return sqlSession.selectOne("id_find", member);
    }

    // 내 정보, 내 정보 수정 폼
    public Member selectMember(String id) throws Exception {
        return sqlSession.selectOne("check_id", id);
    }

    // 내 정보 수정
    public void updateMember(Member member) throws Exception {
        sqlSession.update("info_update", member);
    }

    // 회원 탈퇴
    public void deleteMember(String id) throws Exception {
        sqlSession.delete("member_delete", id);
    }




}
