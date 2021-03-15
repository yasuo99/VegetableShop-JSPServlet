/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.OrderDAO;
import com.mycompany.luyenngocthanh.daos.ProductDAO;
import com.mycompany.luyenngocthanh.dtos.Account;
import com.mycompany.luyenngocthanh.dtos.CartItem;
import com.mycompany.luyenngocthanh.dtos.Order;
import com.mycompany.luyenngocthanh.dtos.OrderDetail;
import com.mycompany.luyenngocthanh.dtos.Product;
import com.mycompany.luyenngocthanh.dtos.ShoppingCart;
import java.io.IOException;
import java.sql.Date;
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
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private ProductDAO productDao = new ProductDAO();
    private OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
//        int id = Integer.parseInt(req.getParameter("id"));
        try {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
            HttpSession session = req.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                res.sendRedirect(req.getContextPath() + "/login");
            } else {
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
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String shippingoption = req.getParameter("shippingoption");
        String zipcode = req.getParameter("zipcode");

        java.util.Date date = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        HttpSession session = req.getSession();
        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("cart");
        Account account = (Account) session.getAttribute("account");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        int total = 0;
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (int i = 0; i < cart.size(); i++) {
            Product product = new Product();
            try {
                product = productDao.readDetail(cart.get(i).getProductId());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            total += cart.get(i).getQuantity() * product.getPrice();
            OrderDetail orderDetail = new OrderDetail(product.getId(), cart.get(i).getQuantity(), cart.get(i).getQuantity() * product.getPrice());
            orderDetails.add(orderDetail);
        }
        Order order = new Order(account.getId(), sqlDate, fullname, phone, address, zipcode, "new", total, orderDetails);
        try {
            boolean result = orderDao.createOrder(order);
            if (result) {
                session.removeAttribute("cart");
                res.sendRedirect(req.getContextPath() + "/orders");
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
                rd.forward(req, res);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
