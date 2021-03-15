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
@WebServlet("/admin/accounts")
public class AdminAccountServlet extends HttpServlet {

    private AccountDAO accountDao = new AccountDAO();

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
                    List<Account> accounts = accountDao.getAll();
                    req.setAttribute("accounts", accounts);
                } catch (SQLException ex) {
                    Logger.getLogger(AdminAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminaccount.jsp");
                rd.forward(req, res);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        int accountId = Integer.parseInt(req.getParameter("accountId"));
        String type = req.getParameter("type");
        try {
            if (accountDao.deleteAccount(accountId, type)) {
                res.sendRedirect(req.getContextPath() + "/admin/accounts");
            }else{
                req.setAttribute("notification", "Lỗi");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminaccount.jsp");
                rd.forward(req, res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
