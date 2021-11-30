package com.project.withpet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.project.withpet.model.Community;


@Repository
public class CommunityDAO {

	@Autowired
	private SqlSession session;
	
	public int insertBoard(Community community) {
		return session.insert("communityns.insertBoard", community);
	}
	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("communityns.getCount");
	}
//	public List<Community> getBoardList(int page) {
//		// TODO Auto-generated method stub
//		return session.selectList("communityns.getBoardList", page);
//	}
	public void updateCount(int com_no) {
		// TODO Auto-generated method stub
		session.update("communityns.updateCount", com_no);
	}
	public Community getBoard(int com_no) {
		// TODO Auto-generated method stub
		return session.selectOne("communityns.getBoard", com_no);
	}
	public int boardUpdate(Community community) {
		// TODO Auto-generated method stub
		return session.update("communityns.boardUpdate", community);
	}
    public int boardDelete(int com_no) {
		// TODO Auto-generated method stub
		return session.delete("boardDelete", com_no);
	}
	public int Total(Community community) {
		// TODO Auto-generated method stub
		return session.selectOne("communityns.Total", community);
	}
	public List<Community> List(Community community) {
		// TODO Auto-generated method stub
		return session.selectList("communityns.getBoardList", community); 
	}
	public void updateLike(int com_no) {
		// TODO Auto-generated method stub
		session.update("communityns.updateLike",com_no);
	}
}