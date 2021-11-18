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
	
	public int insert(Community community) {
		return dao.insert(community);
	}
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}
	public List<Community> getBoardList(int page) {		
		return dao.getBoardList(page);
    }
	public void updatecount(int com_no) {
		// TODO Auto-generated method stub
		dao.updatecount(com_no);
	}

	public Community getBoard(int com_no) {
		// TODO Auto-generated method stub
		return dao.getBoard(com_no);
	}


	
	
//	public Community getBoard(int no) {
		// TODO Auto-generated method stub
//		return dao.getBoard(no);
//	}

//	public int getCount() {
//		// TODO Auto-generated method stub
//		return dao.getCount();
//	}
//
//	public List<Community> getCommunityList(int page) {
//		// TODO Auto-generated method stub
//		return dao.getCommunityList(page);
//	}

}