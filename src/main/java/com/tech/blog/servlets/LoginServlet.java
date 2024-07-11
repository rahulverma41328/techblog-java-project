package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        // fetch username and password
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDao dao = new UserDao(ConnectionProvider.getCon());
        Users users = dao.getUserByEmailAndPassword(email,password);
        if (users==null){
            //login error
            //out.println("Invalid details. try again");
            Message msg = new Message("Invalid Details ! try with another","error","alert-danger");

            HttpSession s = req.getSession();
            s.setAttribute("msg",msg);
            resp.sendRedirect("login.jsp");
        }
        else {
            HttpSession s = req.getSession();
            s.setAttribute("currentUser",users);
            resp.sendRedirect("profile.jsp");
        }
    }
}
