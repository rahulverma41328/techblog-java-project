package com.tech.blog.dao;

import com.tech.blog.entities.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // method to insert user to database;

    public boolean  saveUser(Users users){
        boolean f= false;
        try {

            String query = "insert into users(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setString(1,users.getName());
            pstmt.setString(2,users.getEmail());
            pstmt.setString(3,users.getPassword());
            pstmt.setString(4,users.getGender());
            pstmt.setString(5,users.getAbout());

            pstmt.executeUpdate();
            f=true;
           // pstmt.close();
            //this.con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
