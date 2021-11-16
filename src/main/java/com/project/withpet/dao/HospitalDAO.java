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

	public int getTotal(Hospital hospital) {
		return sqlSession.selectOne("hospitalns.getTotal", hospital);
	}

	public void insert(Hospital hospital) {
		sqlSession.insert("hospitalns.insert", hospital);
	}

	public List<Hospital> list(Hospital hospital) {
		return sqlSession.selectList("hospitalns.list", hospital);
	}
	
}
