package com.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.model.User;



public class UserService {
    
	Connection con;
	
	public UserService() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tryout?serverTimezone=UTC&useSSL=false", "root", "admin");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int add(User user) {
		
		try {			
			
			PreparedStatement ps = con.prepareStatement("insert into users1000 (name, age, email) values(?,?,?)");
			ps.setString(1, user.getName());
			ps.setInt(2,  user.getAge());
			ps.setString(3,  user.getEmail());
			
			return ps.executeUpdate();
			
			
		}catch(SQLException e ) {
			e.printStackTrace();
		}		
		return 0;
	}
	
	public int delete(User user) {
	    
	    try {
	        
	        PreparedStatement ps = con.prepareStatement("delete from users1000 where id = ?");
	        ps.setInt(1, user.getId());
            
	        
	        return ps.executeUpdate();
	        
	        
	    }catch(Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}
	
//	public int delete(String id) {
//	    String sql = "delete from users1000 where id = " + id;
//	    try {
//            
//            PreparedStatement ps = con.prepareStatement(sql);
//            
//            return ps.executeUpdate();
//        }catch(Exception e) {
//            
//            e.printStackTrace();
//            
//        }   
//	    
//        return 0;
//	    
//	}	
	
	public int delete(String name) {
	    name = name.trim();
	    String sql = "delete from users1000 where name = '" + name + "'";
	    
	    
	    try {
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            return ps.executeUpdate();
            
        }catch(Exception e) {
            
            e.printStackTrace();
            
        }   
        return 0;
	}
	
	public int delete(int id) {
	    String sql = "delete from users1000 where id = " + id;
	    
	    try {
	        	        
	        PreparedStatement ps = con.prepareStatement(sql);
	        
	        return ps.executeUpdate();
	    }catch(Exception e) {
	        
	        e.printStackTrace();
	        
	    }	    
	    return 0;
	}
	
	public User get(String name) {
	    User bean = null;
	    
	    String sql = "select * from users1000 where name = ?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, name);
	        ResultSet rs = ps.executeQuery();
	        
	        if(rs.next()) {
	            bean = new User();
	            
	            int id = rs.getInt("id");
	            bean.setId(id);
	            
	            String email = rs.getString("email");
	            bean.setEmail(email);
	            
	            int age = rs.getInt("age");
	            bean.setAge(age);
	            
	            bean.setId(id);	            
	        }
	    }catch(Exception e) {
            e.printStackTrace();
        }
	    
	    return bean;
	}
	
	public List<User> list(){
	    return list(0,Short.MAX_VALUE);
	}

    public List<User> list(int start, int count) {
        // TODO Auto-generated method stub
        List<User>beans = new ArrayList<User>();
        String sql = "select * from users1000 order by id desc limit ?, ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, start);
            ps.setInt(2, count);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                
                User bean = new User();
                
                int id = rs.getInt(1);
                bean.setId(id);
                
                String name = rs.getString("name");
                bean.setName(name);
                
                int age = rs.getInt("age");
                bean.setAge(age);
               
                String email = rs.getString("email");
                bean.setEmail(email);
                
                beans.add(bean);               
                
            }                    
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return beans;
    }
    
    public int update(User bean) {
        
        String sql = "update users1000 set name = ?, age = ?, email = ? where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, bean.getName());
            ps.setInt(2, bean.getAge());
            ps.setString(3, bean.getEmail());
            ps.setInt(4, bean.getId());
            
            return ps.executeUpdate();
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        return 0;        
    }
    
//    public static void main(String[]args) {
//        UserService user = new UserService();
//        String name = "Alice";
//        int i = user.delete(name);
//        System.out.print(i);      
//    }

}













