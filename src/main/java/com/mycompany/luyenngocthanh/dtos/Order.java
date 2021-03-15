/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.dtos;

import java.sql.Date;
import java.util.List;
import javax.persistence.GeneratedValue;

/**
 *
 * @author Thanh
 */
public class Order {

    @GeneratedValue
    private int id;
    private int accountId;
    private Date orderDate;
    private String fullname;
    private String phone;
    private String address;
    private String zipCode;
    private String status;
    private int total;
    private List<OrderDetail> orderDetails;

    public Order(int id, int accountId, Date orderDate, String fullname, String phone, String address, String zipCode, String status, int total) {
        this.id = id;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.zipCode = zipCode;
        this.status = status;
        this.total = total;
    }

    public Order(int accountId, Date orderDate, String fullname, String phone, String address, String zipCode, String status, int total) {
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.zipCode = zipCode;
        this.status = status;
        this.total = total;
    }

    public Order(int accountId, Date orderDate, String fullname, String phone, String address, String zipCode, String status, int total, List<OrderDetail> orderDetails) {
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.zipCode = zipCode;
        this.status = status;
        this.total = total;
        this.orderDetails = orderDetails;
    }

    public Order(int id, int accountId, Date orderDate, String fullname, String phone, String address, String zipCode, String status, int total, List<OrderDetail> orderDetails) {
        this.id = id;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.zipCode = zipCode;
        this.status = status;
        this.total = total;
        this.orderDetails = orderDetails;
    }

    public Order() {
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public int getId() {
        return id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public String getFullname() {
        return fullname;
    }

    public String getAddress() {
        return address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getTotal() {
        return total;
    }
}
