package com.project.withpet.service;

import com.project.withpet.dao.BusinessDAO;
import com.project.withpet.model.Business;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusinessService {

    @Autowired
    private BusinessDAO businessDAO;

    // 사업자 등록 신청
    public void enrollBusiness(Business business) throws Exception{
        businessDAO.enrollBusiness(business);
    }

    // 사업자 등록 정보 조회
    public List<Business> selectBusinessList(String bus_id) throws Exception {
        return businessDAO.selectBusinessList(bus_id);
    }

    // 사업자 등록 요청 상세 조회
    public Business selectBusiness(int bus_no) throws Exception {
        return businessDAO.selectBusiness(bus_no);
    }

    // 사업자 변경 신청
    public int updateBusiness(Business business) throws Exception {
        return businessDAO.updateBusiness(business);
    }

    // 사업 삭제

}
