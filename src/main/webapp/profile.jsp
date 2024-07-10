<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.Users"%>
<%@ page errorPage="error_page.jsp"%>

<%
  Users users = (Users)session.getAttribute("currentUser");
  if(users==null){
     response.sendRedirect("login.jsp");
  }
%>
<html>

   <head>
      <title>profile page</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

      <style>
           .banner-background{
             clip-path: polygon(30% 0%,70% 0%,100% 0, 100% 91%, 63% 100%, 22% 91% , 0  99% 0 0);
           }
      </style>
   </head>

   <body>
     <%= users.getEmail() %>
   </body>
</html>