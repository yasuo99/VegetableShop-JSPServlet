/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thanh
 */
@WebServlet("/logout")
public class LogoutSevlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
        HttpSession session = req.getSession();
        session.removeAttribute("account");
        res.sendRedirect(req.getContextPath() + "/");
    }
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res){
        
    }
}
