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
public class ShoppingCart {
    private int productId;
    private int quantity;

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public ShoppingCart(int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public ShoppingCart() {
    }

}
