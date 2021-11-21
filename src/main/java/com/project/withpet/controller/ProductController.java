package com.project.withpet.controller;


import com.project.withpet.model.Product;
import com.project.withpet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 01. 01-1 상품 전체 목록
    @RequestMapping("/productList")
    public String productList(HttpServletRequest request, Model model){
        int page = 1;
        int limit = 10;

        if(request.getParameter("page")!= null)
            page = Integer.parseInt(request.getParameter("page"));

        // 데이터 갯수
        int listcount = productService.getCount();
        System.out.println("listcount:"+listcount);

        List<Product> productList = productService.getProductList(page);
        System.out.println("productList:"+productList);

        // 총 페이지
        int pageCount = listcount/limit+((listcount%limit==0) ? 0 : 1);

        int startPage = ((page-1)/10 * limit + 1);  // 1,  11, 21...
        int endPage = startPage + 10 - 1;			// 10, 20, 30..

        if(endPage > pageCount)
            endPage = pageCount;

        model.addAttribute("page", page);
        model.addAttribute("listcount", listcount);
        model.addAttribute("productList", productList);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "product/productList";
    }

    // 02. 02-1 상세 페이지 : 조회수 1증가 + 상세정보 구하기
    @RequestMapping("/productDetail")
    public String productDetail(@RequestParam("no") int pro_no, String page, Model model) {

-        productService.updatepro_readcnt(pro_no);				// 조회수 1증가
        Product product = productService.getProductDetail(pro_no);	    // 상세 정보 구하기
        String pro_content = product.getPro_content().replace("\n", "<br>");

        model.addAttribute("product", product);
        model.addAttribute("pro_content", pro_content);
        model.addAttribute("page", page);

        return "product/productDetail";
    }


//    // 상품 상세보기
//    @RequestMapping("productDetail/{pro_no}")
//
//    public String detail(int pro_no, String page, Model model)
//



}
