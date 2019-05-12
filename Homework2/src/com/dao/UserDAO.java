package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.util.DBUtil;

public class UserDAO {
	
	
	// Get the total number of users
	public int getTotal() {
		
		int total = 0;
		String sql = "select count(*) from User";
		
		 try {
			 
			 Connection c = DBUtil.getConnection();
			 Statement s = c.createStatement();
			 
			 ResultSet rs = s.executeQuery(sql);
			 
			 while (rs.next()) {
				 total = rs.getInt(1);
				 
			 } 
				 
		 }catch(SQLException e) {
			 
			 e.printStackTrace();
			
		 }
		return total;
	}
	
	// Create a user
	public void add(User bean) {
		
		String sql = "insert into user values(null, ?, ?)";
		
		try {
			Connection c = DBUtil.getConnection();
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getPassword());
			
			ps.execute();
			
			ResultSet rs = ps.getGeneratedKeys();
			
			if(rs.next()) {
				
				int id = rs.getInt(1);
				bean.setId(id);
				
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
			
		}
		
	}
	
	// Read a User
	public User get(int id){
		User user = null;
		String sql = "select * from User where id = " + id;
		
		try {
			Connection c = DBUtil.getConnection();
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery(sql);
			
			while(rs.next()) {
				
				user = new User();
				user.setId(id);
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				
			}
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return user;
		
	}
	
	// Update user
	public void update(User bean) {
		
		String sql = "update user set name = ? , password = ? where id = ?";
		try {
			
			Connection c = DBUtil.getConnection();
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getPassword());
			ps.setInt(3, bean.getId());
			
			ps.execute();
			
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}
	}
	
	// Delete user (invalid action)
	public void delete(int id) {
		
		String sql = "delete from user where id = " + id;
		
		try {
			
			Connection c = DBUtil.getConnection();
			Statement s = c.createStatement();
			s.execute(sql);
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
		
	}
	
	public List<User> list() {
        return list(0, Short.MAX_VALUE);
    }
  
    public List<User> list(int start, int count) {
        List<User> beans = new ArrayList<User>();
  
        String sql = "select * from User order by id desc limit ?,? ";
  
        try {
            Connection c = DBUtil.getConnection(); 
            
            PreparedStatement ps = c.prepareStatement(sql);
  
            ps.setInt(1, start);
            ps.setInt(2, count);
  
            ResultSet rs = ps.executeQuery();
  
            while (rs.next()) {
                User bean = new User();
                int id = rs.getInt(1);
 
                String name = rs.getString("name");
                bean.setName(name);
                String password = rs.getString("password");
                bean.setPassword(password);
                 
                bean.setId(id);
                beans.add(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return beans;
    }
    
    public User get(String name) {
        User bean = null;
          
        String sql = "select * from User where name = ?";
        try {
            Connection c = DBUtil.getConnection(); 
            PreparedStatement ps = c.prepareStatement(sql);
       
            ps.setString(1, name);
            ResultSet rs =ps.executeQuery();
  
            if (rs.next()) {
                bean = new User();
                int id = rs.getInt("id");
                bean.setName(name);
                String password = rs.getString("password");
                bean.setPassword(password);
                bean.setId(id);
            }
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return bean;
    }
 
    public boolean isExist(String name) {
        User user = get(name);
        return user!=null;
 
    }
 
    public User get(String name, String password) {
        User bean = null;
          
        String sql = "select * from User where name = ? and password=?";
        try {
            Connection c = DBUtil.getConnection();
            PreparedStatement ps = c.prepareStatement(sql); 
        
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet rs =ps.executeQuery();
  
            if (rs.next()) {
                bean = new User();
                int id = rs.getInt("id");
                bean.setName(name);
                bean.setPassword(password);
                bean.setId(id);
            }
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return bean;
    }	
	
}
