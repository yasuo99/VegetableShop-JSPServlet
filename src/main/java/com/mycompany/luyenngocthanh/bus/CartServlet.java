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
import java.util.Hashtable;
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
import javax.ws.rs.core.Response;

/**
 *
 * @author Thanh
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private ProductDAO productDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
        try {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/cart.jsp");
            HttpSession session = req.getSession();
            List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            List<CartItem> cartDetail = new ArrayList<>();
            for (int i = 0; i < cart.size(); i++) {
                Product product;

                product = productDao.readDetail(cart.get(i).getProductId());

                CartItem item = new CartItem(product, cart.get(i).getQuantity());
                cartDetail.add(item);
            }
            req.setAttribute("cart", cartDetail);
            rd.forward(req, res);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            String type = req.getParameter("type");
            switch (type) {
                case "delete":
                    int id = Integer.parseInt(req.getParameter("id"));
                    cart.removeIf(item -> item.getProductId() == id);
                    break;
                case "update":
                    String[] data = req.getParameterValues("data[]");
                    for (int i = 0; i < cart.size(); i++) {
                        cart.get(i).setQuantity(Integer.parseInt(data[i]));
                    }
                    break;

                default:
                    break;
            }
            List<CartItem> cartDetail = new ArrayList<>();
            for (int i = 0; i < cart.size(); i++) {
                Product product;
                product = productDao.readDetail(cart.get(i).getProductId());
                CartItem item = new CartItem(product, cart.get(i).getQuantity());
                cartDetail.add(item);
            }
            req.setAttribute("cart", cartDetail);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/cart.jsp");
            rd.forward(req, res);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
