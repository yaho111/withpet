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
import com.siot.IamportRestClient.request.CancelData;
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
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
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

    private final IamportClient api;


    public ImportController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("6032636191231713","56c5a2e7c127cf30d7684bea851063f24f5bd768ab8e2aae4d65f70bc371decac415ef67b671075a");
    }


    // 결제
    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}")
    public HashMap<String, Object> paymentByImpUid(@RequestParam(required = false, value = "o_no")int o_no, Model model , Locale locale , HttpSession session , @PathVariable(value= "imp_uid") String imp_uid) throws Exception
    {
        HashMap<String, Object> resMap = new HashMap<>();
        int code = -1;
        String msg = "";

        String id = (String) session.getAttribute("id");
        Order order = new Order();
        order.setO_no(o_no);
        order.setId(id);
        int ord_price = orderService.sumMoney(order); //장바구니 전체 금액 호출
        int shippingFee = 2500;

        int pay_price = ord_price + shippingFee;

        IamportResponse<Payment> resp = new IamportResponse<>();

        try {
            resp = api.paymentByImpUid(imp_uid);
            code = resp.getCode();
            msg = resp.getMessage();

            if (String.valueOf(pay_price).equals(resp.getResponse().getAmount().toString())) {
                order.setOrd_info(resp.getResponse().getImpUid() + "|" + resp.getResponse().getMerchantUid() );
                order.setOrd_step("주문완료");
                order.setOrd_price(pay_price);
                order.setAddr(resp.getResponse().getBuyerPostcode()+"\\+"+resp.getResponse().getBuyerAddr());
                 orderService.updateOrder(order);
//                 paidAt = 주문번호
//                  ord_info  impUid | MerchantUid 로 결제 취소시 필요한 정보가 저장됨


                List<OrderProduct> list = orderService.getOrderProductList(order);

                for (OrderProduct orderProduct : list) {
                    orderService.productUpdateStock(orderProduct);
                }


            } else {

                code = 8000;
                msg = "결제 금액 불일치";

            }
        } catch (IamportResponseException ie) {
            switch(ie.getHttpStatusCode()) {
                case 401:
                    code = 401;
                    msg = "가맹점 미등록";
                    break;
                case 404:
                    code = 404;
                    msg = "거래내역을 찾을 수 없습니다.";
                    break;
                case 500:
                    code = 500;
                    msg = "결제를 완료할 수 없습니다. 잠시후에 다시 시도해주세요.";
                    break;
            }
        } catch (Exception e){
            e.printStackTrace();
            code = 9999;
            msg = "검증에 실패하였습니다.";
        }

        resMap.put("imp", resp);
        resMap.put("code", code);
        resMap.put("msg", msg);

        return resMap;

    }


    //결제 취소
    @ResponseBody
    @RequestMapping(value="/canceliamport/{imp_uid}")
    public HashMap<String, Object> canceliamport(@RequestParam(required = false, value = "o_no")int o_no, Model model , Locale locale , HttpSession session , @PathVariable(value= "imp_uid") String imp_uid) throws Exception {
        HashMap<String, Object> resMap = new HashMap<>();
        int code = -1;
        String msg = "";

        String id = (String) session.getAttribute("id");
        Order order = new Order();
        order.setO_no(o_no);
        order.setId(id);
        int ord_price = orderService.sumMoney(order); //장바구니 전체 금액 호출
        int shippingFee = 2500;

        int pay_price = ord_price + shippingFee;
        BigDecimal allsum = new BigDecimal(pay_price);
        IamportResponse<Payment> resp = new IamportResponse<>();


        try {
            CancelData cancelData = new CancelData(imp_uid, true, allsum);

            resp = api.cancelPaymentByImpUid(cancelData);
            code = resp.getCode();
            msg = resp.getMessage();

            if (String.valueOf(pay_price).equals(resp.getResponse().getAmount().toString())) {
                order.setOrd_info(resp.getResponse().getImpUid() + "|" + resp.getResponse().getMerchantUid() );
                order.setOrd_step("주문취소");
                order.setOrd_price(pay_price);
                order.setAddr(resp.getResponse().getBuyerPostcode()+"\\+"+resp.getResponse().getBuyerAddr());
                orderService.updateOrder(order);
//                 paidAt = 주문번호
//                  ord_info  impUid | MerchantUid 로 결제 취소시 필요한 정보가 저장됨


                List<OrderProduct> list = orderService.getOrderProductList(order);

                for (OrderProduct orderProduct : list) {
                    orderService.productUpdateStock(orderProduct);
                }


            } else {

                code = 8000;
                msg = "결제 금액 불일치";

            }
        } catch (IamportResponseException ie) {
            switch(ie.getHttpStatusCode()) {
                case 401:
                    code = 401;
                    msg = "가맹점 미등록";
                    break;
                case 404:
                    code = 404;
                    msg = "거래내역을 찾을 수 없습니다.";
                    break;
                case 500:
                    code = 500;
                    msg = "결제를 완료할 수 없습니다. 잠시후에 다시 시도해주세요.";
                    break;
            }
        } catch (Exception e){
            e.printStackTrace();
            code = 9999;
            msg = "검증에 실패하였습니다.";
        }

        resMap.put("imp", resp);
        resMap.put("code", code);
        resMap.put("msg", msg);

        return resMap;


    }

}

