package com.project.withpet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Hospital;

@Repository
public class HospitalDAO {

	@Autowired
	private SqlSession sqlSession;

	// 글 작성(insert)
	public void insert(Hospital hospital) {
		sqlSession.insert("hospitalns.insert", hospital);
	}

	// 총 데이터 개수 구하기
	public int getTotal(Hospital hospital) {
		return sqlSession.selectOne("hospitalns.getTotal", hospital);
	}

	// 데이터(게시글) 10개 구하기
	public List<Hospital> list(Hospital hospital) {
		return sqlSession.selectList("hospitalns.list", hospital);
	}

	// 상세 페이지 : 조회수 증가
	public void updateReadcnt(int hos_no) {
		sqlSession.update("hospitalns.updateReadcnt", hos_no);
	}

	// 상세 페이지 : 데이터 1개 구하기
	public Hospital select(int hos_no) {
		return sqlSession.selectOne("select", hos_no);
	}

	// 글 수정(update)
	public int update(Hospital hospital) {
		return sqlSession.update("update", hospital);
	}

}
