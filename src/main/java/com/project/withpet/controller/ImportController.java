package com.project.withpet.controller;

import com.project.withpet.model.Basket;
import com.project.withpet.model.Order;
import com.project.withpet.model.OrderProduct;
import com.project.withpet.model.Product;
import com.project.withpet.service.BasketService;
import com.project.withpet.service.OrderService;
import com.project.withpet.service.ProductService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

@Controller
public class ImportController {

    @Autowired
    private BasketService basketService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    private IamportClient api;


    public ImportController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("6032636191231713","56c5a2e7c127cf30d7684bea851063f24f5bd768ab8e2aae4d65f70bc371decac415ef67b671075a");
    }

    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@RequestParam(required = false, value = "o_no")int o_no, Model model , Locale locale , HttpSession session , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException, Exception
    {
        String id = (String) session.getAttribute("id");
        Order order = new Order();
        order.setId(id);
        order.setO_no(o_no);
        int ord_price = orderService.sumMoney(order); //장바구니 전체 금액 호출
        int shippingFee = 2500;

        int pay_price = ord_price + shippingFee;

        IamportResponse<Payment> resp = api.paymentByImpUid(imp_uid);

        if (String.valueOf(pay_price).equals(resp.getResponse().getAmount().toString()) ) {
            order.setOrd_step(resp.getResponse().getPaidAt().toString());
            order.setAddr(resp.getResponse().getBuyerAddr());
            order.setOrd_price(pay_price);
            order.setOrd_info(resp.getResponse().getImpUid() + "|" + resp.getResponse().getMerchantUid() );

            List<OrderProduct> list = orderService.getOrderProductList(order);

            for (OrderProduct orderProduct : list){
                orderService.productUpdateStock(orderProduct);
        }

        }else{

        }

        return resp;

    }

}

