/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.dtos;

import java.util.List;

/**
 *
 * @author Thanh
 */
public class Product {

    private int id;
    private String name;
    private String image;
    private String detail;
    private int oldPrice;
    private int price;
    private int remain;
    private int sold;
    private List<String> productImages;

    public Product() {
    }

    public Product(String name, String image, String detail, int price, int remain) {
        this.name = name;
        this.image = image;
        this.detail = detail;
        this.price = price;
        this.remain = remain;
    }

    public Product(String name, String image, String detail, int oldPrice, int price, int remain) {
        this.name = name;
        this.image = image;
        this.detail = detail;
        this.oldPrice = oldPrice;
        this.price = price;
        this.remain = remain;
    }

    public Product(int id, String name, String image, String detail, int oldPrice, int price, int remain) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.detail = detail;
        this.oldPrice = oldPrice;
        this.price = price;
        this.remain = remain;
    }

    public Product(String name, String image, String detail, int oldPrice, int price, int remain, List<String> productImages) {
        this.name = name;
        this.image = image;
        this.detail = detail;
        this.oldPrice = oldPrice;
        this.price = price;
        this.remain = remain;
        this.productImages = productImages;
    }

    public Product(int id, String name, String image, String detail, int oldPrice, int price, int remain, List<String> productImages) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.detail = detail;
        this.oldPrice = oldPrice;
        this.price = price;
        this.remain = remain;
        this.productImages = productImages;
    }

    public Product(int id, String name, String image, String detail, int oldPrice, int price, int remain, int sold, List<String> productImages) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.detail = detail;
        this.oldPrice = oldPrice;
        this.price = price;
        this.remain = remain;
        this.sold = sold;
        this.productImages = productImages;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setOldPrice(int oldPrice) {
        this.oldPrice = oldPrice;
    }

    public int getOldPrice() {
        return oldPrice;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getRemain() {
        return remain;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDetail() {
        return detail;
    }

    public void setProductImages(List<String> productImages) {
        this.productImages = productImages;
    }

    public List<String> getProductImages() {
        return productImages;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getSold() {
        return sold;
    }

}
