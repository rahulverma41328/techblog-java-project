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

    public boolean  saveUser(Users Users){
        boolean f= false;
        try {

            String query = "insert into Users(username,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setString(1,Users.getName());
            pstmt.setString(2,Users.getEmail());
            pstmt.setString(3,Users.getPassword());
            pstmt.setString(4,Users.getGender());
            pstmt.setString(5,Users.getAbout());

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
