package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.HospitalDAO;
import com.project.withpet.model.Hospital;

@Service
public class HospitalService {
	@Autowired
	private HospitalDAO hospitalDAO;

	// 병원 게시판 글 작성 폼
	public int getTotal(Hospital hospital) {
		return hospitalDAO.getTotal(hospital);
	}

	// 글 작성(Insert)
	public void insert(Hospital hospital) {
		hospitalDAO.insert(hospital); 
	}

	public List<Hospital> list(Hospital hospital) {
		return hospitalDAO.list(hospital);
	}

}
