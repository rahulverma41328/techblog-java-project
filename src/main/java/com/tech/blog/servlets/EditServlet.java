package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Users;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.File;
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
        String oldFile = Users.getProfile();
        Users.setProfile(imageName);

        // update database...

        UserDao dao = new UserDao(ConnectionProvider.getCon());

        boolean data = dao.updateUser(Users);
        try {
            PrintWriter out = resp.getWriter();
            out.println(Users.getProfile());

            if (data == true){
                out.println("updated to db");

                String path = req.getServletContext().getRealPath("/") + "pics"+ File.separator+Users.getProfile();
                String oldPath = req.getServletContext().getRealPath("/")+"pics"+File.separator+oldFile;

                if (!oldPath.equals("default.png")){
                    Helper.deleteFile(oldPath);
                }
                if (Helper.saveFile(part.getInputStream(),path)){
                     //   out.println("profile photo updated...");
                    Message m = new Message("profile photo updated","success","alert-success");
                    s.setAttribute("msg",m);
                }
                else {
                    //out.println("profile not updated...");
                    Message m = new Message("something went wrong...","error","alert-danger");
                    s.setAttribute("msg",m);
                }
            }
            else {
                //out.println("not updated..");
                Message m = new Message("something went wrong..","error","alert-danger");
                s.setAttribute("msg",m);
            }
            resp.sendRedirect("profile.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }
}
