package com.project.withpet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.LikesDAO;
import com.project.withpet.model.Comlike;
import com.project.withpet.model.Hoslike;
import com.project.withpet.model.Prolike;

@Service
public class LikesService {
	
	@Autowired
	private LikesDAO likesDAO;

	// 1. 병원 게시판
	// 추천 이력 조회(병원)
	public Hoslike select(Hoslike hoslike) {
		return likesDAO.select(hoslike);
	}
	
	// 추천 이력 삽입(병원)
	public void insert(Hoslike hoslike) {
		likesDAO.insert(hoslike);
	}

	
	// 2. 커뮤니티 게시판
	// 추천 이력 조회(커뮤니티)
	public Comlike select(Comlike comlike) {
		return likesDAO.select(comlike);
	}
		
	// 추천 이력 삽입(커뮤니티)
	public void insert(Comlike comlike) {
		likesDAO.insert(comlike);
	}

	// 3. 상품 게시판
	// 추천 이력 조회(상품)
	public Prolike select(Prolike prolike) {
		return likesDAO.select(prolike);
	}
			
	// 추천 이력 삽입(상품)
	public void insert(Prolike prolike) {
		likesDAO.insert(prolike);
	}	

}
