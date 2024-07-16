package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
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
public class AddPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) {

        try {
            PrintWriter out = resp.getWriter();
            int cid = Integer.parseInt(req.getParameter("cid"));
            String pTitle = req.getParameter("pTitle");
            String pContent = req.getParameter("pContent");
            String pCode = req.getParameter("pCode");
            Part part = req.getPart("pic");

            // getting current user id
            HttpSession session = req.getSession();
            Users users = (Users) session.getAttribute("currentUser");


            Post p = new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,users.getId());

            PostDao dao = new PostDao(ConnectionProvider.getCon());

            // save file in directory
            String path = req.getServletContext().getRealPath("/")+"blog_pics"+ File.separator+part.getSubmittedFileName();

            if (Helper.saveFile(part.getInputStream(),path)){
                //out.println("file saved in directory...");
            }
            if (dao.savePost(p)){
                out.println("done");
            }
            else {
                out.println("something went wrong");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
