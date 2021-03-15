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
@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            res.sendRedirect(req.getContextPath() + "/login");
        } else {
            if (!"admin".equals(account.getRole())) {
                 res.sendRedirect(req.getContextPath() + "/");
            } else {
                try {
                    List<Order> orders = orderDao.getAll();
                    req.setAttribute("orders", orders);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminorder.jsp");
                    rd.forward(req, res);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String type = req.getParameter("type");
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        try {
            if (orderDao.approveDeclineOrder(orderId, type)) {
                res.sendRedirect(req.getContextPath() + "/admin/orders");
            } else {
                req.setAttribute("Error", "Lỗi");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminorder.jsp");
                rd.forward(req, res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
