package com.project.withpet.dao;


import com.project.withpet.model.Member;
import com.project.withpet.model.Order;
import com.project.withpet.model.OrderProduct;
import com.project.withpet.model.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAO {

    @Autowired
    private SqlSession sqlSession;

    public int orderInsert(Order order) throws Exception{
        return sqlSession.insert("orders.orderInsert", order);
    }

    public int orderProductInsert(OrderProduct orderProduct) throws Exception{
        return sqlSession.insert("orders.orderProductInsert", orderProduct);
    }

    public Order getOrders(Order order) throws Exception {
        return sqlSession.selectOne("orders.orders", order);
    }

    public List<OrderProduct> getOrderProductList(Order order) throws Exception{
        return sqlSession.selectList("orders.orderProductList", order);
    }

    public int sumMoney(Order order) throws Exception {
        return sqlSession.selectOne("orders.sumMoney", order);
    }

    public int productUpdateStock(OrderProduct orderProduct) throws Exception{
        return sqlSession.update("orders.productUpdateStock", orderProduct);
    }

    public int updateOrder(Order order) throws Exception{
        return sqlSession.update("orders.updateOrder", order);
    }

    public List<Order> getOrderList(String id) throws Exception{
        return sqlSession.selectList("orders.getOrderList", id);
    }

    public List<OrderProduct> getOrderProductDetail(Order order) throws Exception{
        return sqlSession.selectList("orders.getOrderProductDetail", order);
    }


}
