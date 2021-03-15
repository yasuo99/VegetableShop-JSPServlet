/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.dtos;

/**
 *
 * @author Thanh
 */
public class OrderDetail {

    public OrderDetail(int id, int productId, int quantity, int total) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
        this.total = total;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    private int id;
    private int productId;
    private int quantity;
    private int total;

    public OrderDetail(int productId, int quantity, int total) {
        this.productId = productId;
        this.quantity = quantity;
        this.total = total;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getTotal() {
        return total;
    }

}
