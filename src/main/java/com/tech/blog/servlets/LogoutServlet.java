package com.tech.blog.servlets;

import com.tech.blog.entities.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) {
      //  resp.setContentType("text/html");

        try {
            PrintWriter out = resp.getWriter();

            HttpSession session = req.getSession();
            session.removeAttribute("currentUser");

            Message m = new Message("Logout Successfully","success","alert-success");
            session.setAttribute("msg",m);
            resp.sendRedirect("login.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }
}
