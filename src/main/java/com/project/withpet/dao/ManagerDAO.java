package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Business;
import com.project.withpet.model.Member;

@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSessionTemplate managerSession;

	// 회원 총인원 가져오기
	public int getCount(Member member) {
		System.out.println("회원 총인원 가져오기 DAO");
		return managerSession.selectOne("managerns.managerGetCount", member);
	}

	// 회원 목록 구해오기
	public List<Member> memberList(Member member) {
		System.out.println("회원 목록 구해오기 DAO");
		return managerSession.selectList("managerns.managerList", member);
	}

	// 회원 삭제
	public void memberDelete(String id) {
		System.out.println("회원 삭제 DAO");
		managerSession.delete("managerns.memberDelete", id);
	}

	// 회원 상세보기
	public Member memberSelect(String id) {
		System.out.println("회원 상세보기 DAO");
		return managerSession.selectOne("managerns.memberSelect", id);
	}

	// 관리자 등록
	public int managerInsert(Member member) {
		System.out.println("관리자 등록 DAO");
		return managerSession.update("managerns.managerInsert", member);
	}

	// 사업체 등록 승인 
	public int businessAccept(String bus_no) {
		System.out.println("사업체 등록 승인 DAO");
		return managerSession.update("managerns.businessAccept", bus_no);
	}

	// 사업체 롤 부여
	public int roleChange(Member member) {
		// TODO Auto-generated method stub
		return managerSession.update("managerns.busRoleChange", member);
	}
		
	
}
