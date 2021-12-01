package com.project.withpet.model;

import java.util.Date;

public class Order {

    private int o_no;
    private Date ord_regdate;
    private String ord_info;
    private String id;
    private String addr;
    private int ord_price;
    private String ord_step;
    private Date ord_canceldate;
    private String name;
    private String phone;
    private String pro_name;

    public int getO_no() {
        return o_no;
    }

    public void setO_no(int o_no) {
        this.o_no = o_no;
    }

    public Date getOrd_regdate() {
        return ord_regdate;
    }

    public void setOrd_regdate(Date ord_regdate) {
        this.ord_regdate = ord_regdate;
    }

    public String getOrd_info() {
        return ord_info;
    }

    public void setOrd_info(String ord_info) {
        this.ord_info = ord_info;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public int getOrd_price() {
        return ord_price;
    }

    public void setOrd_price(int ord_price) {
        this.ord_price = ord_price;
    }

    public String getOrd_step() {
        return ord_step;
    }

    public void setOrd_step(String ord_step) {
        this.ord_step = ord_step;
    }

    public Date getOrd_canceldate() {
        return ord_canceldate;
    }

    public void setOrd_canceldate(Date ord_canceldate) {
        this.ord_canceldate = ord_canceldate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPro_name() {return pro_name;}

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

}
