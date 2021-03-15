/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.daos;

import com.mycompany.luyenngocthanh.connection.MyConnection;
import com.mycompany.luyenngocthanh.dtos.Account;
import java.sql.Connection;
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
public class AccountDAO {

    private MyConnection conn;

    public AccountDAO() {
    }

    public List<Account> getAll() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Select * from account";
            Statement stm = conn.getConnection().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String role = rs.getString("role");
                boolean isLocked = rs.getBoolean("isLocked");
                Account account = new Account(id, fullname, email, phone, address, password, role, isLocked);
                accounts.add(account);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return accounts;
    }

    public Account getDetail(int id) throws SQLException {
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Select * from account where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String role = rs.getString("role");
                boolean isLocked = rs.getBoolean("isLocked");
                Account account = new Account(id, fullname, email, phone, address, password, role, isLocked);
                return account;
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return null;
    }

    public boolean exists(String email) throws SQLException {
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Select Count(*) from account where email=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                if (total > 0) {
                    return true;
                }
                return false;
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return false;
    }

    public Account login(String email, String password) throws SQLException {
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Select * from account where email=? and password=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");
                boolean isLocked = rs.getBoolean("isLocked");
                Account account = new Account(id, fullname, email, phone, address, password, role, isLocked);
                return account;
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return null;
    }

    public boolean createAccount(Account account) throws SQLException {
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Insert into account(fullname,email,phone,address,password,isLocked) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, account.getFullname());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPhone());
            ps.setString(4, account.getAddress());
            ps.setString(5, account.getPassword());
            ps.setBoolean(6, false);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return false;
    }

    public boolean updateAccount(int id, Account account) throws SQLException {
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Update account set fullname=?,email=?,phone=?,address=?,password=? where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, account.getFullname());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPhone());
            ps.setString(4, account.getAddress());
            ps.setString(5, account.getPassword());
            ps.setInt(6, id);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return false;
    }

    public boolean deleteAccount(int id, String type) throws SQLException {
        try {
            conn = new MyConnection();
            conn.init();
            String sql = "Update account set isLocked = ? where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            if(!"unlock".equals(type)){
                ps.setBoolean(1, true);
            } else {
                ps.setBoolean(1, false);
            }
            
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        } finally {
            conn.getConnection().close();
        }
        return false;
    }
}
