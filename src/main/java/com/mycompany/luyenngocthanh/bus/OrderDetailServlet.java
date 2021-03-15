/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.luyenngocthanh.bus;

import com.mycompany.luyenngocthanh.daos.OrderDAO;
import com.mycompany.luyenngocthanh.daos.ProductDAO;
import com.mycompany.luyenngocthanh.dtos.Order;
import com.mycompany.luyenngocthanh.dtos.OrderItem;
import com.mycompany.luyenngocthanh.dtos.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonObject;
import javax.json.JsonValue;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Thanh
 */
@WebServlet("/order-detail")
public class OrderDetailServlet extends HttpServlet {

    private OrderDAO orderDao = new OrderDAO();
    private ProductDAO productDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String headerName = req.getHeader("x-requested-with");
        int id = Integer.parseInt(req.getParameter("id"));
        List<OrderItem> orderItems = new ArrayList<>();
        Order order = new Order();
        try {
            order = orderDao.getOrderDetail(id);
            for (int i = 0; i < order.getOrderDetails().size(); i++) {
                Product product;

                product = productDao.readDetail(order.getOrderDetails().get(i).getProductId());
                OrderItem orderItem = new OrderItem(product, order.getOrderDetails().get(i).getQuantity());
                orderItems.add(orderItem);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (null == headerName) {
            HttpSession session = req.getSession();

            if (session.getAttribute("account") == null) {
                res.sendRedirect(req.getContextPath() + "/login");
            } else {
                req.setAttribute("order", order);
                req.setAttribute("orderitems", orderItems);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/orderdetail.jsp");
                rd.forward(req, res);
            }
        } else {
            req.setCharacterEncoding("utf8");
            //response.setCharacterEncoding("utf8");
            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            PrintWriter out = res.getWriter();
            JSONObject obj = new JSONObject();
            out.print(JSONObject.valueToString(orderItems));
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) {

    }
}
