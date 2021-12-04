package com.project.withpet.controller;

import com.project.withpet.model.Product;
import com.project.withpet.model.ReplyProduct;
import com.project.withpet.service.ProductService;
import com.project.withpet.service.ReplyProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ReplyProductController {
    @Autowired
    private ReplyProductService replyProductService;
    @Autowired
    private ProductService productService;

    // 목록 구해오기
    @RequestMapping("proReList")
    public String proRelist(int pro_no, ReplyProduct replyProduct, Model model) {
        System.out.println("controller in");
        // 부모 테이블 상세정보 구해오기
        Product product = productService.getProductDetail(pro_no);
        System.out.println("product:"+product);

        // 목록 구해오기
        List<ReplyProduct> proReList = replyProductService.proRelist(pro_no);
        System.out.println("proReList:"+proReList);

        System.out.println(replyProduct.getProReply_no());

        model.addAttribute("proReList", proReList);
        model.addAttribute("product", product);
        return "product/proReList";
    }

    // 댓글 입력
    @RequestMapping("proReInsert")
    public String proReInsert(int pro_no, ReplyProduct replyProduct, Model model) {
        replyProductService.proReInsert(replyProduct);
        return "redirect:proReList?pro_no="+replyProduct.getPro_no();
    }

    // 댓글 수정
    @RequestMapping("proReUpdate")
    public String reProUpdate(int pro_no, int proReply_no, ReplyProduct replyProduct, Model model) {
        System.out.println("댓글 수정 controller in");

        System.out.println("proReply_no1:"+proReply_no);
        System.out.println("proReply_no2:"+replyProduct.getProReply_no());
        System.out.println("proReply_content:"+replyProduct.getProReply_content());
        System.out.println("pro_no:"+replyProduct.getPro_no());


//			replyNotice.setNotReply_no(notReply_no);
        int result = replyProductService.proReUpdate(replyProduct);
        System.out.println("result:"+result);
//			if(result == 1) {
//				model.addAttribute("result", result);
//			}
        return "redirect:proReList?pro_no="+replyProduct.getPro_no();
    }

    // 댓글 삭제
    @RequestMapping("proReDelete")
    public String proReDelete(int pro_no, ReplyProduct replyProduct, Model model) {
        replyProductService.proReDelete(replyProduct.getProReply_no());
        return "redirect:proReList?pro_no="+replyProduct.getPro_no();
    }
}
