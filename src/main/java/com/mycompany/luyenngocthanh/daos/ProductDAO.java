/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.daos;

import com.mycompany.luyenngocthanh.connection.MyConnection;
import com.mycompany.luyenngocthanh.dtos.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thanh
 */
public class ProductDAO {

    public ProductDAO() {
    }

    public List<Product> getAll() throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql = "Select * from product";
            Statement stm = conn.getConnection().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                String detail = rs.getString("detail");
                int oldPrice = rs.getInt("oldPrice");
                int price = rs.getInt("price");
                int remain = rs.getInt("remain");
                Product product = new Product(id, name, image, detail, oldPrice, price, remain);
                products.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return products;
    }

    public List<Product> getTopSeller() throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql = "Select * from product order by sold desc limit 4";
            Statement stm = conn.getConnection().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                String detail = rs.getString("detail");
                int oldPrice = rs.getInt("oldPrice");
                int price = rs.getInt("price");
                int remain = rs.getInt("remain");
                Product product = new Product(id, name, image, detail, oldPrice, price, remain);
                products.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return products;
    }

    public boolean createProduct(Product product) throws SQLException {
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql = "Insert into product(image,name,price,remain) values(?,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, product.getImage());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getPrice());
            ps.setInt(4, product.getRemain());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return false;
    }
    public boolean updateProduct(int id, Product product) throws SQLException{
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql = "update product set image=?,name=?,oldPrice = ?,price=?,remain=? where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, product.getImage());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getOldPrice());
            ps.setInt(4, product.getPrice());
            ps.setInt(5, product.getRemain());
            ps.setInt(6, id);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return false;
    }
    public List<Product> search(String search) throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql = "Select * from product where name like ?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                String detail = rs.getString("detail");
                int oldPrice = rs.getInt("oldPrice");
                int price = rs.getInt("price");
                int remain = rs.getInt("remain");
                Product product = new Product(id, name, image, detail, oldPrice, price, remain);
                products.add(product);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return products;
    }

    public Product readDetail(int id) throws ClassNotFoundException, SQLException {
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql1 = "Select * from product where id=?";
            PreparedStatement ps1 = conn.getConnection().prepareStatement(sql1);
            ps1.setInt(1, id);
            String sql2 = "Select product_image.link from product join product_image on product.id = product_image.product_id where product.id=?";
            PreparedStatement ps2 = conn.getConnection().prepareStatement(sql2);

            ps2.setInt(1, id);
            ResultSet rs1 = ps1.executeQuery();
            ResultSet rs2 = ps2.executeQuery();
            List<String> links = new ArrayList<>();
            while (rs1.next()) {
                String name = rs1.getString("name");
                String image = rs1.getString("image");
                String detail = rs1.getString("detail");
                int oldPrice = rs1.getInt("oldPrice");
                int price = rs1.getInt("price");
                int remain = rs1.getInt("remain");
                while (rs2.next()) {
                    String link = rs2.getString("link");
                    links.add(link);
                }
                Product product = new Product(id, name, image, detail, oldPrice, price, remain, links);
                return product;
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return null;
    }

    public void deleteProduct(int id) throws SQLException {
        MyConnection conn = new MyConnection();
        try {
            conn.init();
            String sql = "Delete from product where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (ClassNotFoundException | SQLException e) {

        } finally {
            conn.getConnection().close();
        }
    }
}
