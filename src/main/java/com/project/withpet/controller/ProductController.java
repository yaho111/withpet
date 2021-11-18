package com.project.withpet.controller;


import com.project.withpet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 상품 전체 목록
    @RequestMapping("/productList")
    public String list(Model model) {
        model.addAttribute("list", productService.listProduct());
        return "product/productList";
    }

}
