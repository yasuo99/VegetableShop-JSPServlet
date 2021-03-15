/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.AccountDAO;
import com.mycompany.luyenngocthanh.dtos.Account;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private AccountDAO accountDao = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Account account = new Account();
        req.setAttribute("registeraccount", account);
        session.setAttribute("notification", null);
        Account loggedinAccount = (Account) session.getAttribute("account");
        if (loggedinAccount != null) {
            res.sendRedirect(req.getContextPath() + '/');
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
            rd.forward(req, res);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
        HttpSession session = req.getSession();
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        Account account = new Account(fullname, email, phone, address, password,"user", false);
        if (!password.trim().equals(confirmPassword.trim())) {
            req.setAttribute("registeraccount", account);
            req.setAttribute("notificationType", 2);
            req.setAttribute("notification", "Password and confirm password don't match");
            rd.forward(req, res);
        } else {
            if (phone.length() > 11) {
                req.setAttribute("notificationType", 2);
                req.setAttribute("notification", "Phone must be 11 characters");
                rd.forward(req, res);
            } else {
                try {
                    if (!accountDao.exists(email)) {
                        if (accountDao.createAccount(account)) {
                            req.setAttribute("notificationType", 1);
                            req.setAttribute("notification", "Register successful");
                            rd.forward(req, res);
                        } else {
                            req.setAttribute("notificationType", 2);
                            req.setAttribute("notification", "Error");
                            rd.forward(req, res);
                        }
                    } else {
                        req.setAttribute("registeraccount", account);
                        req.setAttribute("notificationType", 2);
                        req.setAttribute("notification", "Email đã được đăng kí");
                        rd.forward(req, res);
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }
}
