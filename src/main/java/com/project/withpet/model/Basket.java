package com.project.withpet.model;

import java.util.List;

public class Basket {

//	pro_no NUMBER NOT NULL, /* 상품 번호 */
//	id VARCHAR2(20) NOT NULL, /* 아이디 */
//	price VARCHAR2(50) NOT NULL, /* 가격 */
//	ea NUMBER NOT NULL /* 수량 */

    private int pro_no;
    private String id;
    private int basket_no;
    private int ea;
    private String pro_name;
    private String pro_img;
    private int stock;
    private int order_price;

    public int getOrder_price() {
        return order_price;
    }

    public void setOrder_price(int order_price) {
        this.order_price = order_price;
    }

    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getBasket_no() {
        return basket_no;
    }

    public void setBasket_no(int basket_no) {
        this.basket_no = basket_no;
    }

    public int getEa() {
        return ea;
    }

    public void setEa(int ea) {
        this.ea = ea;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getPro_img() {
        return pro_img;
    }

    public void setPro_img(String pro_img) {
        this.pro_img = pro_img;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    private int price;

    @Override
    public String toString() {
        return "Basket [pro_no=" + pro_no + ", id=" + id + ", basket_no=" + basket_no + ",ea=" + ea + ", pro_name=" + pro_name + ", pro_img=" + pro_img + ",stock=" + stock + ",price=" + price + "]";
    }

}
