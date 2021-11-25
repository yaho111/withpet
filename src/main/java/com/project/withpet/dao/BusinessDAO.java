package com.project.withpet.dao;

import com.project.withpet.model.Business;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BusinessDAO {

    @Autowired
    private SqlSession sqlSession;

    // 사업자 등록 신청
    public void enrollBusiness(Business business) throws Exception {
        sqlSession.insert("enroll_business", business);
    }
    // 사업자 변경 신청

    // 사업 삭제
}
