package com.project.withpet.dao;

import com.project.withpet.model.Business;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BusinessDAO {

    @Autowired
    private SqlSession sqlSession;

    // 사업자 등록 신청
    public void enrollBusiness(Business business) throws Exception {
        sqlSession.insert("enroll_business", business);
    }

    // 사업자 등록 정보 조회
    public List<Business> selectBusinessList(String bus_id) throws Exception {
        return sqlSession.selectList("select_businessList", bus_id);
    }

    // 사업자 등록 요청 상세 조회
    public Business selectBusiness(String bus_no) throws Exception {
        return sqlSession.selectOne("select_business", bus_no);
    }

    // 사업자 변경 신청
    public int updateBusiness(Business business) throws  Exception {
        return sqlSession.update("update_business", business);
    }

    // 사업 삭제
    public void deleteBusiness(String bus_no) throws Exception {
        sqlSession.delete("delete_business", bus_no);
    }
}
