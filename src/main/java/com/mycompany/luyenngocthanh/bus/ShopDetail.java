/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.ProductDAO;
import com.mycompany.luyenngocthanh.dtos.Product;
import com.mycompany.luyenngocthanh.dtos.ShoppingCart;
import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thanh
 */
@WebServlet("/shop-detail")
public class ShopDetail extends HttpServlet {

    private final ProductDAO productDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Product product = productDao.readDetail(id);
            if (product != null) {
                req.setAttribute("product", product);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/shopdetail.jsp");
                rd.forward(req, res);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/shop.jsp");
                rd.forward(req, res);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ShopDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        HttpSession session = req.getSession();
        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("cart");
        if(cart == null){
            cart = new ArrayList<>();
        }
        ShoppingCart shoppingCart = new ShoppingCart(product_id, quantity);
        int flag = 0;
        for(int i = 0;i<cart.size();i++){
            ShoppingCart temp = cart.get(i);
            if(temp.getProductId() == product_id){
                temp.setQuantity(temp.getQuantity() + quantity);
                flag = 1;
            }
        }
        if(flag == 0){
            cart.add(shoppingCart);
        }
        session.setAttribute("cart", cart);
        res.sendRedirect(req.getContextPath() + "/shop");
    }
}
