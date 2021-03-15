/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.ProductDAO;
import com.mycompany.luyenngocthanh.dtos.Account;
import com.mycompany.luyenngocthanh.dtos.Product;
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
@WebServlet("/admin/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, ServletException, IOException {
//        int id = Integer.parseInt(req.getParameter("id"));
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminproduct.jsp");
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            res.sendRedirect(req.getContextPath() + "/login");
        } else {
            if (!"admin".equals(account.getRole())) {
                res.sendRedirect(req.getContextPath() + "/");
            } else {
                List<Product> products = new ArrayList<>();
                try {
                    products = productDao.getAll();
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                req.setAttribute("products", products);
                rd.forward(req, res);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");
        switch (type) {
            case "delete": {
                try {
                    int deleteId = Integer.parseInt(req.getParameter("productId"));
                    productDao.deleteProduct(deleteId);
                } catch (SQLException ex) {
                    Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "update":
                int productId = Integer.parseInt(req.getParameter("productId"));
                String image = req.getParameter("image");
                String name = req.getParameter("name");
                String detail = req.getParameter("detail");
                int oldPrice = Integer.parseInt(req.getParameter("oldPrice"));
                int price = Integer.parseInt(req.getParameter("price"));
                int remain = Integer.parseInt(req.getParameter("remain"));
                Product product = new Product(name, image, detail, oldPrice, price, remain);
                 {
                    try {
                        productDao.updateProduct(productId, product);
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
            case "create":
                String createImage = req.getParameter("image");
                String createName = req.getParameter("name");
                String createDetail = req.getParameter("detail");
                int createPrice = Integer.parseInt(req.getParameter("price"));
                int createRemain = Integer.parseInt(req.getParameter("remain"));
                Product createProduct = new Product(createName, createImage, createDetail, createPrice, createRemain);
                 {
                    try {
                        productDao.createProduct(createProduct);
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;

        }
        res.sendRedirect(req.getContextPath() + "/admin/products");
    }
}
