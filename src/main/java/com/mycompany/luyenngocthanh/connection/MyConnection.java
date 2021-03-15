/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Thanh
 */
public class MyConnection {
    private static final String DB_URL ="jdbc:mysql://localhost/cnpmm?useUnicode=yes&characterEncoding=UTF-8";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    
    private Connection conn;
    public MyConnection(){
        
    }
    public Connection getConnection(){
        return conn;
    }
    public void init() throws ClassNotFoundException, SQLException{
        Class.forName(JDBC_DRIVER);
        System.out.println("Connecting to db...");
        conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
    } 
}
