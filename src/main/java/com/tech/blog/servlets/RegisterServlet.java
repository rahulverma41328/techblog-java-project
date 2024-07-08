package com.tech.blog.servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title> Servlet Register");
            out.println("</head>");

            out.println("<body>");

            // fetch all the data
            out.println("<h1> this is check</h1>");

            String check = req.getParameter("check");
            out.println(check);

            out.println("</body>");
            out.println("</html>");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
