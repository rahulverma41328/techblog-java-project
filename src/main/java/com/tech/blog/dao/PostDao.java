package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();

        try {
             String q = "select * from categories";

            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);

            while (set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid,name,description);

                list.add(c);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p){
        boolean f = false;

        try {
            String q = "insert into posts(ptitle,pcontent,pcode,ppic,cat,userId) values(?,?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1,p.getPtitle());
            pstmt.setString(2,p.getPcontent());
            pstmt.setString(3,p.getPcode());
            pstmt.setString(4,p.getPpic());
            pstmt.setInt(5,p.getCat());
            pstmt.setInt(6,p.getUserId());

            pstmt.executeUpdate();

            f = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }
}
