<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.util.ArrayList" %>

<div class="row">
<%
   Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getCon());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if(cid==0){
      posts = d.getAllPosts();
    }else{
      posts = d.getAllPosts(cid);
    }


    for(Post p:posts){

%>

<div class="col-md-6 mt-2">
    <div class="card">
       <img class="card-img-top" src="blog_pics/<%= p.getPpic() %>" alt="card image cap"></img>
       <div class="card-body">
          <b><%= p.getPtitle() %></b>
          <p><%= p.getPcontent() %></p>
          <p><%= p.getPcode() %></p>

       </div>
    </div>
</div>

<% } %>

</div>