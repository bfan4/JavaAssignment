package com.servlet;

import com.bean.OrderItem;
import com.bean.Product;
import com.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderItemAddServlet")
public class OrderItemAddServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("num"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product p = new ProductDAO().getProduct(pid);

        OrderItem oi = new OrderItem();
        oi.setNum(num);
        oi.setProduct(p);

        List<OrderItem> ois = (List<OrderItem>) request.getSession().getAttribute("ois");
        if (null == ois) {
            ois = new ArrayList<OrderItem>();
            request.getSession().setAttribute("ois", ois);
        }
        ois.add(oi);
        response.sendRedirect("listOrderItem");
        //System.out.println(num);
        //System.out.println("DONE");
    }
}

