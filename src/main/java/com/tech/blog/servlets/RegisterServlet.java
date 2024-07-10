package com.tech.blog.servlets;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@MultipartConfig
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String check = req.getParameter("check_box");

        if (check==null){
            out.println("box is not checked");
        }
        else {
            // get the data
            String name = req.getParameter("user_name");
            String email = req.getParameter("user_email");
            String password = req.getParameter("user_password");
            String gender = req.getParameter("gender");
            String about = req.getParameter("about");

            Users users = new Users(name,email,password,gender,about,"default.png");
            UserDao dao = new UserDao(ConnectionProvider.getCon());

           if (dao.saveUser(users)){
               //save
               out.println("done");
           }
           else {
               out.println("error");
           }

        }
    }
}
