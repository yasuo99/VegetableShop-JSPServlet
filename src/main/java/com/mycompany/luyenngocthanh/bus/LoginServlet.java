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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AccountDAO accountDao = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
        HttpSession session = req.getSession();
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
        rd.forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String email = req.getParameter("emailLogin");
        String password = req.getParameter("passwordLogin");
        try {
            Account account = accountDao.login(email, password);
            if (account != null) {
                if (account.isIsLocked() == false) {
                    HttpSession session = req.getSession();
                    session.setAttribute("account", account);
                    if (account.getRole().equals("admin")) {
                        res.sendRedirect(req.getContextPath() + "/admin/products");
                    } else {
                        res.sendRedirect(req.getContextPath() + "/");
                    }
                } else {
                    req.setAttribute("notification", "Tài khoản đã bị khóa");
                    req.setAttribute("notificationType", 2);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                    rd.forward(req, res);
                }

            } else {
                req.setAttribute("notification", "Tài khoản hoặc mật khẩu không chính xác");
                req.setAttribute("notificationType", 2);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                rd.forward(req, res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
