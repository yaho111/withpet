package com.project.withpet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetDAO {

    @Autowired
    private SqlSession sqlSession;


}
