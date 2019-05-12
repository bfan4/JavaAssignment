package com.dao;

import com.bean.Order;
import com.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDAO {
    public void insert(Order o) {
        String sql = "insert into orders_ values(null,?)";

        try (Connection c = DBUtil.getConnection();PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, o.getUser().getId());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                o.setId(id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
