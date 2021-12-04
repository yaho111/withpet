package com.project.withpet.controller;


import com.project.withpet.model.Basket;
import com.project.withpet.model.Order;
import com.project.withpet.model.OrderProduct;
import com.project.withpet.model.Product;
import com.project.withpet.service.BasketService;
import com.project.withpet.service.OrderService;
import com.project.withpet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @Autowired
    private BasketService basketService;

    // 01 - 1 결제 할 상품값을 basket에서 불러오기
    @RequestMapping("/orderInsert")
    public String orderInsert(HttpSession session, Model model) throws Exception {
        // session의 id
        String id = (String) session.getAttribute("id");
        Order order =new Order();
        order.setId(id);
        orderService.orderInsert(order);

        int o_no = order.getO_no();

        List<Basket> list = basketService.basketList(id); //장바구니 정보

        for (Basket basket : list) {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setO_no(o_no);
            orderProduct.setEa(basket.getEa());
            orderProduct.setPrice(basket.getPrice());
            orderProduct.setPro_name(basket.getPro_name());
            orderProduct.setPro_no(basket.getPro_no());
            orderService.orderProductInsert(orderProduct);

        }
        model.addAttribute("o_no",o_no );


        return "redirect:/orders";
    }

    // 01 -1 결제할 상품을 리스트로 올리기
    @RequestMapping("/orders")
    public String orders(int o_no, HttpSession session, Model model ) throws Exception {

        // session의 id
        String id = (String) session.getAttribute("id");

        Order order = new Order();

        order.setId(id);
        order.setO_no(o_no);

        order = orderService.getOrders(order);

        String[] addr = order.getAddr().split("\\+");
        String post = addr[0];
        String address = addr[1];
        String specificAddress = addr[2];

        List<OrderProduct> list = orderService.getOrderProductList(order);
        int ord_price = orderService.sumMoney(order); //장바구니 전체 금액 호출
        int shippingFee = 2500;

        String pro_name = "";
        if(list != null && !list.isEmpty()){
            pro_name = list.get(0).getPro_name();
            pro_name += list.size() > 1 ? pro_name + "외 " + (list.size() - 1) + "건" : "";   // 결제 상품명 + ~외 건수 처리
        }
        model.addAttribute("list", list);				// 장바구니 정보를 map에 저장
        model.addAttribute("count", list.size());		// 장바구니 상품의 유무
        model.addAttribute("totalOrderPrice", ord_price);		// 장바구니 전체 금액
        model.addAttribute("shippingFee", shippingFee); 				// 배송금액
        model.addAttribute("allSum", ord_price+shippingFee);	// 주문 상품 전체 금액

        model.addAttribute("post", post);               // 우편번호
        model.addAttribute("address", address);         // 주소
        model.addAttribute("specificAddress", specificAddress);     //상세주소
        model.addAttribute("pro_name", pro_name);

        model.addAttribute("order",order );
        model.addAttribute("list", list);

        return "order/orders";
    }

    // 02 주문완료 페이지
    @RequestMapping("/orderComplete")
    public String orderComplete(@RequestParam("o_no") int o_no, HttpSession session, Model model) throws Exception{
        // session의 id
        String id = (String) session.getAttribute("id");

        Order order = new Order();

        order.setId(id);
        order.setO_no(o_no);

        order = orderService.getOrders(order);

        String[] addr = order.getAddr().split("\\+");
        String post = addr[0];
        String address = addr[1];
        String specificAddress = addr[2];

        String[] ord_info = order.getOrd_info().split("\\|");
        String impuid = ord_info[0];
        String merchantUid = ord_info[1];

        List<OrderProduct> list = orderService.getOrderProductList(order);

        model.addAttribute("list", list);				// 장바구니 정보를 map에 저장
        model.addAttribute("count", list.size());		// 장바구니 상품의 유무

        model.addAttribute("post", post);               // 우편번호
        model.addAttribute("address", address);         // 주소
        model.addAttribute("specificAddress", specificAddress);     //상세주소

        model.addAttribute("impuid",impuid);            //아임포트 uid
        model.addAttribute("merchantUid",merchantUid);  //상품번호

        model.addAttribute("order",order );             //order
        model.addAttribute("list", list);

        return "order/orderComplete";
    }


    // 3 주문 상품 리스트
    @RequestMapping("/orderList")
    public String orderList(HttpSession session, Model model) throws Exception{
        // session의 id
        String id = (String) session.getAttribute("id");

        List<Order> list = orderService.getOrderList(id);

        model.addAttribute("list", list);

        return "order/orderList";
    }

    // 3-1, 3-2 주문상품 상세 , 주문취소
    @RequestMapping("/orderDetail")
    public String orderDetail(@RequestParam("o_no") int o_no,HttpSession session, Model model) throws Exception {

        String id = (String) session.getAttribute("id");

        Order order = new Order();

        order.setId(id);
        order.setO_no(o_no);

        order = orderService.getOrders(order);
//        order = orderService.getOrderComplete(order);

        String[] addr = order.getAddr().split("\\+");
        String post = addr[0];
        String address = addr[1];
        String specificAddress = addr[2];

        String[] ord_info = order.getOrd_info().split("\\|");
        String impuid = ord_info[0];
        String merchantUid = ord_info[1];

        int ord_price = orderService.sumMoney(order); //장바구니 전체 금액 호출
        int shippingFee = 2500;

        List<OrderProduct> list = orderService.getOrderProductDetail(order);

        model.addAttribute("list", list);				// 장바구니 정보를 map에 저장
        model.addAttribute("count", list.size());		// 장바구니 상품의 유무

        model.addAttribute("post", post);               // 우편번호
        model.addAttribute("address", address);         // 주소
        model.addAttribute("specificAddress", specificAddress);     //상세주소

        model.addAttribute("impuid",impuid);            //아임포트 uid
        model.addAttribute("merchantUid",merchantUid);  //상품번호

        model.addAttribute("order",order );             //order
        model.addAttribute("list", list);

        model.addAttribute("totalOrderPrice", ord_price);		// 장바구니 전체 금액
        model.addAttribute("shippingFee", shippingFee); 				// 배송금액
        model.addAttribute("allSum", ord_price+shippingFee);	// 주문 상품 전체 금액




        return "order/orderDetail";
    }



}
