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
	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("count");
	}
	public List<Community> getBoardList(int page) {
		// TODO Auto-generated method stub
		return session.selectList("List", page);
	}
	public void updatecount(int com_no) {
		// TODO Auto-generated method stub
		session.update("read", com_no);
	}
	public Community getBoard(int com_no) {
		// TODO Auto-generated method stub
		return session.selectOne("Content", com_no);
	}
//	public int update(Community community) {
//		// TODO Auto-generated method stub
//		return session.update("upDateBoard", community);
//	}
//	public int delete(int com_no) {
//		// TODO Auto-generated method stub
//		return session.delete("deleteBoard", com_no);
//	}
//	
}
	
