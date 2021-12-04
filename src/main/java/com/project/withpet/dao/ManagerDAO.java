package com.project.withpet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Business;
import com.project.withpet.model.Member;
import com.project.withpet.service.BusinessService;

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

	// 관리자 다운
	public int managerDown(Member member) {
		System.out.println("관리자 다운 DAO");
		return managerSession.update("managerns.managerDown", member);
	}

	// 사업자 목록
	public List<Business> selectBusinessList(Business business) {
		System.out.println("사업자 목록 DAO");
		return managerSession.selectList("managerns.selectBusinessList", business);
	}
	
	//사업자 등록
	public int businessAccept(Business business) {
		System.out.println("사업체 등록 DAO");
		
		// 승인 요청 버튼 클릭하여 bus_sort 값 바꾸기
		int acceptResult = managerSession.update("managerns.businessAccept", business);
		System.out.println("acceptResult: "+acceptResult);
		
		// member 테이블에서 role 값 수정하기
		int roleChangeResult = 0;
		
		if(acceptResult == 1) {		// 승인 요청 수락에 따라 bus_sort 값이 변경되면
			
			// 승인 요청이 완료된(bus_sort 값이 업데이트된) member 객체 구해오기
			Business selectOneBusiness = managerSession.selectOne("managerns.selectOneBusiness", business);
			System.out.println("selectOneBusiness: "+selectOneBusiness);
			System.out.println("role 변경할 id: "+selectOneBusiness.getBus_id());
			
			// member의 role 값 업데이트하기
			roleChangeResult = managerSession.update("managerns.roleChange", selectOneBusiness);
			System.out.println("roleChangeResult :"+roleChangeResult);
		}
		
		return roleChangeResult;
	}
	
	// 사업자 승인 거절
	public int businessNotAccept(String bus_no) {
		System.out.println("bus_no DAO : " + bus_no);
		System.out.println("사업자 승인 거절 DAO");	
		return managerSession.delete("managerns.businessNotAccept", bus_no);
	}

	

	
}
