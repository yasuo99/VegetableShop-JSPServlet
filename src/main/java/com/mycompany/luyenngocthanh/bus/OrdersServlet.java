/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.OrderDAO;
import com.mycompany.luyenngocthanh.dtos.Account;
import com.mycompany.luyenngocthanh.dtos.Order;
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
@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

    private OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
//        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            res.sendRedirect(req.getContextPath() + "/login");
        } else {
            try {
                List<Order> orders = orderDao.getAll(account.getId());
                req.setAttribute("orders", orders);
            } catch (SQLException ex) {
                Logger.getLogger(OrdersServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/orders.jsp");
            rd.forward(req, res);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            orderDao.deleteOrder(id);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/orders.jsp");
            rd.forward(req, res);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
