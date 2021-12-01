package com.project.withpet.controller;


import com.project.withpet.model.Product;
import com.project.withpet.service.ProductService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;
import java.util.UUID;

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

        productService.updatepro_readcnt(pro_no);				// 조회수 1증가
        Product product = productService.getProductDetail(pro_no);	    // 상세 정보 구하기
        String pro_content = product.getPro_content().replace("\n", "<br>");

        model.addAttribute("product", product);
        model.addAttribute("pro_content", pro_content);
        model.addAttribute("page", page);

        return "product/productDetail";
    }
    // 03. 글작성 폼 04.수정페이지 폼
    @RequestMapping("productWrite")
    public String productForm(@RequestParam(value = "no", required = false, defaultValue = "0") String pro_no_str, Model model){
//        Product product = new Product();
        int pro_no = Integer.parseInt(pro_no_str);
        if(pro_no > 0){
            Product product = productService.getProductDetail(pro_no);	    // 상세 정보 구하기
            String pro_content = product.getPro_content().replace("\n", "<br>");

            model.addAttribute("product", product);
            model.addAttribute("pro_content", pro_content);
        }
        return "product/productWrite";
    }

    // 03-1 글작성 결과
    // 04-1 수정시 이미지 변경사항 확인
    @RequestMapping("productResult")  // 이름 변경
    public String producteWrite(HttpServletRequest req, Product product, Model model) throws Exception {
        System.out.println("bus_id:"+ product.getBus_id());
        int result = 0;
        PrintWriter printWriter = null;
        OutputStream out = null;
        BufferedOutputStream bos = null;

        int pro_no = product.getPro_no();

        MultipartFile pro_photo = product.getPro_photo();
        if(pro_photo != null){
            if(pro_photo.getSize() > 0 && StringUtils.isNotBlank(pro_photo.getName())){
                if(pro_photo.getContentType().toLowerCase().startsWith("image/")){
                    try{
                        String fileName = pro_photo.getOriginalFilename();
                        String ext = FilenameUtils.getExtension(fileName);

                        byte[] bytes = pro_photo.getBytes();
                        String uploadPath = req.getSession().getServletContext().getRealPath("/upload");
                        File uploadFile = new File(uploadPath);
                        if(!uploadFile.exists()){
                            uploadFile.mkdirs();
                        }
                        fileName = UUID.randomUUID().toString() + "." + ext;
                        uploadPath = uploadPath + "/" + fileName;
                        out = new FileOutputStream(new File(uploadPath));
//						out.write(bytes);
                        bos = new BufferedOutputStream(out); // Buffer 에 넣기 때문에 남아있는 메모리 사이즈는 신경써야 하죠.
                        bos.write(bytes, 0, bytes.length); // Buffer 에 담은 것을 파일에 I/O 합니다.
                        bos.flush(); // FileOutputStream 에는 flush 가 없지요. flush 를 해야지 메모리에 남기지 않고 몽땅 파일에 저장해요.

                        product.setPro_img(fileName);

                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(bos != null){
                            bos.close();
                        }
                        if(out != null){
                            out.close();
                        }
                    }
                }
            }
        }

        if(pro_no > 0) {
            result = productService.productUpdate(product);
        }else {
            result = productService.productInsert(product);
        }
        System.out.println("result:"+result);

        model.addAttribute("result", result);

        return "product/productResult";
    }

    //05. 게시글 삭제
    @RequestMapping("productDelete")
    public String productDelete(@RequestParam("no") int pro_no) throws Exception {
        productService.productDelete(pro_no);
        return "product/productDelete";
    }

}
