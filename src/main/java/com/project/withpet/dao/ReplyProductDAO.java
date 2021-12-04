package com.project.withpet.dao;

import com.project.withpet.model.ReplyNotice;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.withpet.model.ReplyProduct;

@Repository
public class ReplyProductDAO {
    @Autowired
    private SqlSessionTemplate proReplySql;

    // 글 목록 구하기
    public List<ReplyProduct> proRelist(int pro_no) {
        System.out.println("댓글 목록 DAO");
        return proReplySql.selectList("proReplyns.proRelist", pro_no);
    }

    // 댓글 입력
    public void proReInsert(ReplyProduct replyProduct) {
        System.out.println("댓글 입력 DAO");
        proReplySql.insert("proReplyns.proReInsert", replyProduct);

    }

    // 댓글 수정
    public int proReUpdate(ReplyProduct replyProduct) {
        System.out.println("댓글 수정 DAO");
        return proReplySql.update("proReplyns.proReUpdate", replyProduct);
    }

    // 댓글 삭제
    public void proReDelete(int proReply) {
        System.out.println("댓글 삭제 DAO");
        proReplySql.delete("proReplyns.proReDelete", proReply);
    }

}
