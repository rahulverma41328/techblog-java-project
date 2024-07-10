package com.tech.blog.dao;

import com.tech.blog.entities.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    //get user by useremail and password

    public Users getUserByEmailAndPassword(String email,String password){
        Users users = null;

        try {
            String query = "select * from Users where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1,email);
            pstmt.setString(2,password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()){
                users = new Users();
                // data from db
                String name = set.getString("username");
                // set to user object
                users.setName(name);
                users.setId(set.getInt("id"));
                users.setAbout(set.getString("about"));
                users.setGender(set.getString("gender"));
                users.setEmail(set.getString("email"));
                users.setPassword(set.getString("password"));
                users.setRdate(set.getTimestamp("rdate"));
                users.setProfile(set.getString("profile"));

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

}
