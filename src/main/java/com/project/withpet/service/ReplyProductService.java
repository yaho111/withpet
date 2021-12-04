package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.ReplyProductDAO;
import com.project.withpet.model.ReplyProduct;

@Service
public class ReplyProductService {

    @Autowired
    private ReplyProductDAO replyProductDAO;

    // 댓글 목록
    public List<ReplyProduct> proRelist(int pro_no) {
        System.out.println("댓글 목록 서비스");
        return replyProductDAO.proRelist(pro_no);
    }

    // 댓글 입력
    public void proReInsert(ReplyProduct replyProduct) {
        System.out.println("댓글 입력 서비스");
        replyProductDAO.proReInsert(replyProduct);
    }

    // 댓글 수정
    public int proReUpdate(ReplyProduct replyProduct) {
        System.out.println("댓글 수정 서비스");
        return replyProductDAO.proReUpdate(replyProduct);
    }

    // 댓글 삭제
    public void proReDelete(int proReply) {
        System.out.println("댓글 삭제 서비스");
        replyProductDAO.proReDelete(proReply);
    }


}
