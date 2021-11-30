package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.CommunityDAO;
import com.project.withpet.model.Community;


@Service
public class CommunityService {

	@Autowired
	private CommunityDAO dao;
	
	public int insertBoard(Community community) {
		return dao.insertBoard(community);
	}
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}
//	public List<Community> getBoardList(int page) {		
//		return dao.getBoardList(page);
//    }
	public void updateCount(int com_no) {
		// TODO Auto-generated method stub
		dao.updateCount(com_no);
	}
	public Community getBoard(int com_no) {
		// TODO Auto-generated method stub
		return dao.getBoard(com_no);
	}
	public int boardUpdate(Community community) {
		// TODO Auto-generated method stub
		return dao.boardUpdate(community);
	}
	public int boardDelete(int com_no) {
		// TODO Auto-generated method stub
		return dao.boardDelete(com_no);
	}
	public int Total(Community community) {
		// TODO Auto-generated method stub
		return dao.Total(community);
	}
	public List<Community> List(Community community) {
		// TODO Auto-generated method stub
		return dao.List(community);
	}
	public void updateLike(int com_no) {
		// TODO Auto-generated method stub
		 dao.updateLike(com_no);
	}
}