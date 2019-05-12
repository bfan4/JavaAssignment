package com.servlet;

import com.bean.Order;
import com.bean.OrderItem;
import com.bean.User;
import com.dao.OrderDAO;
import com.dao.OrderItemDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderCreateServlet")
public class OrderCreateServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        if (null == u) {
            response.sendRedirect("/index.jsp");
            return;
        }

        Order o = new Order();
        o.setUser(u);

        new OrderDAO().insert(o);

        List<OrderItem> ois = (List<OrderItem>) request.getSession().getAttribute("ois");
        for (OrderItem oi :
                ois) {
            oi.setOrder(o);
            new OrderItemDAO().insert(oi);
        }
        ois.clear();
        response.sendRedirect("Success.jsp");
//        response.getWriter().println("<div align='center'>Order placed successfully!<br>Now the cart is empty for the rest customer.</div>");

    }
}

