package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.ManagerDAO;
import com.project.withpet.model.Business;
import com.project.withpet.model.Member;

@Service
public class ManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	// 회원 총 데이터
	public int getCount(Member member) {
		System.out.println("회원 총인원 가져오기 서비스");
		return managerDAO.getCount(member);
	}

	// 회원 목록 구해오기
	public List<Member> memberList(Member member) {
		System.out.println("회원 목록 구해오기 서비스");
		return managerDAO.memberList(member);
	}
	
	// 회원 삭제
	public void memberDelete(String id) {
		System.out.println("회원 삭제 구해오기 서비스");
		managerDAO.memberDelete(id);
	}

	// 회원 상세
	public Member memberSelect(String id) {
		System.out.println("회원 상세 서비스");
		return managerDAO.memberSelect(id);
	}

	// 관리자 등록
	public int managerInsert(Member member) {
		System.out.println("관리자 등록 서비스");
		return managerDAO.managerInsert(member);
	}

	// 사업체 요청 승인
	public int businessAccept(String bus_no) {
		System.out.println("사업체 요청 서비스");
		return managerDAO.businessAccept(bus_no);
	}

	// 사업체 롤 부여
	public int roleChange(Member member) {
		System.out.println("사업체 롤 부여 서비스");
		return managerDAO.roleChange(member);
	}
	
	
	
}
