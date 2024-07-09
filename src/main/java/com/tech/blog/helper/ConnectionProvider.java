package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionProvider {

    private static Connection con;

    public static Connection getCon(){
        try {
            // driver class
           if (con==null){
               Class.forName("com.mysql.cj.jdbc.Driver");

               // create a connection
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","rahul");

           }
        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }

    public static void main(String[] args) {
        System.out.println(getCon());
    }
}
