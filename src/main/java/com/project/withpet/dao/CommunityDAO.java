package com.project.withpet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.withpet.model.Community;

@Repository
public class CommunityDAO {

	@Autowired
	private SqlSession session;
	
	public int insert(Community community) {
		return session.insert("insertBoard", community);
	}

//	public int getCount() {
//		// TODO Auto-generated method stub
//		return session.selectOne("communityns.count");
//	}
//
//	public List<Community> getCommunityList(int page) {
//		// TODO Auto-generated method stub
//		return session.selectList("list", page);
//	}
//	
//	public void updatecount(int no) {
//		// TODO Auto-generated method stub
//		session.update("hit", no);
//	}
//
//	public Community getCommunity(int no) {
//		// TODO Auto-generated method stub
//		return session.selectOne("content", no);
//	}

	
}