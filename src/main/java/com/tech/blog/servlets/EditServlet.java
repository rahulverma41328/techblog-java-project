package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class EditServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // fetch all data
        String userEmail = req.getParameter("user_email");
        String userName = req.getParameter("user_name");
        String userPassword = req.getParameter("user_password");
        String userAbout = req.getParameter("user_about");

        Part part = req.getPart("image");

        String imageName=part.getSubmittedFileName();

        // get the user form the session
        HttpSession s = req.getSession();
        Users Users = (Users) s.getAttribute("currentUser");
        Users.setEmail(userEmail);
        Users.setName(userName);
        Users.setAbout(userAbout);
        Users.setPassword(userPassword);
        Users.setProfile(imageName);

        // update database...

        UserDao dao = new UserDao(ConnectionProvider.getCon());

        boolean data = dao.updateUser(Users);
        try {
            PrintWriter out = resp.getWriter();

            if (data == true){
                out.println("updated to db");
            }
            else {
                out.println("not updated..");
            }
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }
}
