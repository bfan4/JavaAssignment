package com.dao;

import com.bean.Product;
import com.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> listProduct() {
        List<Product> products = new ArrayList<Product>();
        String sql = "select * from products order by id";
        try (Connection c = DBUtil.getConnection(); PreparedStatement s = c.prepareStatement(sql)) {
            ResultSet rs = s.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                
                int id = rs.getInt(1);
                String name = rs.getString(2);
                float price = rs.getFloat(3);
                int stock = rs.getInt(4);

                product.setId(id);
                product.setName(name);
                product.setPrice(price);
                product.setStock(stock);
                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;

    }


    public Product getProduct(int id) {
        Product result = null;
        String sql = "select * from products where id=?";
        try (Connection c = DBUtil.getConnection();PreparedStatement ps=c.prepareStatement(sql);){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = new Product();
                result.setId(id);
                String name = rs.getString(2);
                float price = rs.getFloat(3);

                result.setName(name);
                result.setPrice(price);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getProduct(1).getName());
    }
}














