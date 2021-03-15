/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.ProductDAO;
import com.mycompany.luyenngocthanh.dtos.CartItem;
import com.mycompany.luyenngocthanh.dtos.Product;
import com.mycompany.luyenngocthanh.dtos.ShoppingCart;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet("/shop")
public class ShopServlet extends HttpServlet {

    private ProductDAO productDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {

        try {
            List<Product> products = productDao.getAll();
            req.setAttribute("products", products);
            HttpSession session = req.getSession();
            List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            List<CartItem> cartDetail = new ArrayList<>();
            for (int i = 0; i < cart.size(); i++) {
                Product product = productDao.readDetail(cart.get(i).getProductId());
                CartItem item = new CartItem(product, cart.get(i).getQuantity());
                cartDetail.add(item);
            }
            req.setAttribute("cart", cartDetail);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/shop.jsp");
            rd.forward(req, res);
        } catch (SQLException ex) {
            Logger.getLogger(ShopServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShopServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String search = req.getParameter("search");
        try {
            List<Product> products = productDao.search(search);
            req.setAttribute("products", products);
            HttpSession session = req.getSession();
            List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            List<CartItem> cartDetail = new ArrayList<>();
            for (int i = 0; i < cart.size(); i++) {
                Product product = productDao.readDetail(cart.get(i).getProductId());
                CartItem item = new CartItem(product, cart.get(i).getQuantity());
                cartDetail.add(item);
            }
            req.setAttribute("cart", cartDetail);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/shop.jsp");
            rd.forward(req, res);
        } catch (SQLException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
