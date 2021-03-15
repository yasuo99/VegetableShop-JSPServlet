/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.daos;

import com.mycompany.luyenngocthanh.connection.MyConnection;
import com.mycompany.luyenngocthanh.dtos.Order;
import com.mycompany.luyenngocthanh.dtos.OrderDetail;
import java.sql.Date;
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
public class OrderDAO {

    private MyConnection conn;

    public OrderDAO() {
    }
    public List<Order> getAll() throws SQLException {
        List<Order> orders = new ArrayList<>();
        conn = new MyConnection();
        try {
            conn.init();
            String sql = "Select * from user_order order by orderDate desc";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int accountId = rs.getInt("account_id");
                Date orderDate = rs.getDate("orderDate");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String zipcode = rs.getString("zipcode");
                String status = rs.getString("status");
                int total = rs.getInt("total");
                Order order = new Order(id, accountId, orderDate, fullname, phone, address, zipcode, status, total);
                orders.add(order);
            }
            return orders;
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return null;
    }
    public List<Order> getAll(int accountId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        conn = new MyConnection();
        try {
            conn.init();
            String sql = "Select * from user_order where account_id = ?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                Date orderDate = rs.getDate("orderDate");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String zipcode = rs.getString("zipcode");
                String status = rs.getString("status");
                int total = rs.getInt("total");
                Order order = new Order(id, accountId, orderDate, fullname, phone, address, zipcode, status, total);
                orders.add(order);
            }
            return orders;
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return null;
    }

    public Order getOrderDetail(int id) throws ClassNotFoundException, SQLException {
        conn = new MyConnection();
        try {
            conn.init();
            String sql = "Select * from user_order where id = ?";
            String sql2 = "Select * from order_detail where order_id = ?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            PreparedStatement ps2 = conn.getConnection().prepareStatement(sql2);
            ps2.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Date orderDate = rs.getDate("orderDate");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String zipcode = rs.getString("zipcode");
                String status = rs.getString("status");
                int total = rs.getInt("total");
                ResultSet rs2 = ps2.executeQuery();
                List<OrderDetail> orderDetails = new ArrayList<>();
                while (rs2.next()) {
                    int orderId = rs2.getInt("order_id");
                    int productId = rs2.getInt("product_id");
                    int quantity = rs2.getInt("quantity");
                    int subtotal = rs2.getInt("total");
                    OrderDetail orderDetail = new OrderDetail(orderId, productId, quantity, subtotal);
                    orderDetails.add(orderDetail);
                }
                Order order = new Order(id, total, orderDate, fullname, phone, address, zipcode, status, total, orderDetails);
                return order;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return null;
    }

    public boolean createOrder(Order order) throws ClassNotFoundException, SQLException {
        conn = new MyConnection();
        try {
            conn.init();
            String[] returnId = {"BATCHID"};
            String sql = "Insert into user_order(account_id, orderDate, fullname, phone,address,zipcode,status,total) values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, order.getAccountId());
            ps.setDate(2, order.getOrderDate());
            ps.setString(3, order.getFullname());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getAddress());
            ps.setString(6, order.getZipCode());
            ps.setString(7, order.getStatus());
            ps.setInt(8, order.getTotal());
            int result = ps.executeUpdate();
            int orderId = 0;
            int queryCount = 0;
            String orderIdQuery = "Select max(id) from user_order where account_id = ?";
            PreparedStatement ps2 = conn.getConnection().prepareStatement(orderIdQuery);
            ps2.setInt(1, order.getAccountId());
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
            if (result > 0) {
                for (OrderDetail orderDetail : order.getOrderDetails()) {
                    String sql1 = "Insert into order_detail(order_id,product_id, quantity, total) values(?,?,?,?)";
                    PreparedStatement ps1 = conn.getConnection().prepareStatement(sql1);
                    ps1.setInt(1, orderId);
                    ps1.setInt(2, orderDetail.getProductId());
                    ps1.setInt(3, orderDetail.getQuantity());
                    ps1.setInt(4, orderDetail.getTotal());
                    int result1 = ps1.executeUpdate();
                    if (result1 > 0) {
                        queryCount++;
                    }
                }
            }
            return queryCount == order.getOrderDetails().size();
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return false;
    }

    public void deleteOrder(int id) throws SQLException {
        conn = new MyConnection();
        try {
            conn.init();
            String sql = "Delete from user_order where id = ?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
    }

    public boolean approveDeclineOrder(int id, String type) throws SQLException {
        conn = new MyConnection();
        try {
            conn.init();
            String sql = "Update user_order set status = ? where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, type);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            conn.getConnection().close();
        }
        return false;
    }
}
