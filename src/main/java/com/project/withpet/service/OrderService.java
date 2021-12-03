package com.project.withpet.service;


import com.project.withpet.dao.OrderDAO;
import com.project.withpet.model.Order;
import com.project.withpet.model.OrderProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderDAO orderDAO;

    // 아이디 중복 체크
    public int orderInsert(Order order) throws Exception {
        return orderDAO.orderInsert(order);
    }

    public int orderProductInsert(OrderProduct orderProduct) throws Exception {
        return orderDAO.orderProductInsert(orderProduct);
    }

    public Order getOrders(Order order) throws Exception{
        return orderDAO.getOrders(order);
    }

    public List<OrderProduct> getOrderProductList(Order order) throws Exception{
        return orderDAO.getOrderProductList(order);
    }

    public int sumMoney(Order order) throws Exception {
        return orderDAO.sumMoney(order);
    }

    public int productUpdateStock(OrderProduct orderProduct) throws Exception{
        return orderDAO.productUpdateStock(orderProduct);
    }

    public int updateOrder(Order order) throws Exception{
        return orderDAO.updateOrder(order);
    }

    public List<Order> getOrderList(String id) throws Exception{
        return orderDAO.getOrderList(id);
    }

    public List<OrderProduct> getOrderProductDetail(Order order) throws Exception{
        return  orderDAO.getOrderProductDetail(order);
    }


}
