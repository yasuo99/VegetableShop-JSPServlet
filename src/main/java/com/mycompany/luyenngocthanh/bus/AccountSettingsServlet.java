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
@WebServlet("/account-settings")
public class AccountSettingsServlet extends HttpServlet {

    private AccountDAO accountDao = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/accountsettings.jsp");
            rd.forward(req, res);
        } else {
            res.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String fullname = req.getParameter("fullname");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");

        if (!"".equals(fullname)) {
            account.setFullname(fullname);
        }
        if (!"".equals(address)) {
            account.setAddress(address);
        }
        if (!"".equals(phone)) {
            account.setPhone(phone);
        }
        try {
            boolean result = accountDao.updateAccount(account.getId(), account);
            if (result) {
                session.setAttribute("account", account);
                res.sendRedirect(req.getContextPath() + "/account-settings");
            } else {
                req.setAttribute("Error", "Lỗi");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/accountsettings.jsp");
                rd.forward(req, res);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountSettingsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
