package com.project.withpet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Comlike;
import com.project.withpet.model.Hoslike;
import com.project.withpet.model.Prolike;

@Repository
public class LikesDAO {
	
	@Autowired()
	private SqlSession sqlSession;
	
	// 1. 병원 게시판
	// 추천 이력 조회(병원)
	public Hoslike select(Hoslike hoslike) {
		return sqlSession.selectOne("hoslikens.select", hoslike);
	}
	
	// 추천 이력 삽입(병원)
	public void insert(Hoslike hoslike) {
		sqlSession.insert("hoslikens.insert", hoslike);
	}
	
	// 2. 커뮤니티 게시판
	// 추천 이력 조회(커뮤니티)
	public Comlike select(Comlike comlike) {
		return sqlSession.selectOne("comlikens.select", comlike);
	}
		
	// 추천 이력 삽입(커뮤니티)
	public void insert(Comlike comlike) {
		sqlSession.insert("comlikens.insert", comlike);
	}
	
	// 3. 상품 게시판
	// 추천 이력 조회(상품)
	public Prolike select(Prolike prolike) {
		return sqlSession.selectOne("prolikens.select", prolike);
	}
			
	// 추천 이력 삽입(상품)
	public void insert(Prolike prolike) {
		sqlSession.insert("prolikens.insert", prolike);
	}

}
