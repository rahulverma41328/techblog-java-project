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
      <!--navbar -->

      <nav class="navbar navbar-expand-lg navbar-dark primary-background">
          <div class="container-fluid">
              <a class="navbar-brand" href="#">Tech Blog</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="#">Link</a>
                      </li>
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              Categories
                          </a>
                          <ul class="dropdown-menu">
                              <li><a class="dropdown-item" href="#">Project</a></li>
                              <li><a class="dropdown-item" href="#">code</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="#">other</a></li>
                          </ul>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="contact.jsp">Contact</a>
                      </li>


                  </ul>

                  <ul class="navbar-nav mr-right">
                       <li class="nav-item">
                          <a class="nav-link"href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle me-2"></span><%= users.getName() %></a>
                       </li>

                       <li class="nav-item">
                             <a class="nav-link"href="logoutServlet"><span class="fa fa-user-plus me-2"></span>Logout</a>
                       </li>
                  </ul>
              </div>
          </div>
      </nav

      <!-- navbar bar -->

      <!-- modal start -->


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header primary-background text-white text-center">
                <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="container text-center">

                  <img src="pics/<%= users.getProfile() %> " style="border-radius: 50%; max-width:150px;"></img>

                  <h5 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= users.getName() %></h5>

                  <!-- details -->
                  <div id="profile-details">
                  <table class="table">
                    <tbody>
                       <tr>
                         <th scope="row"> ID :</th>
                         <td> <%= users.getId() %> </td>
                       </tr>

                       <tr>
                          <th scope="row"> Email :</th>
                          <td> <%= users.getEmail() %> </td>
                       </tr>

                       <tr>
                          <th scope="row"> Gender :</th>
                          <td> <%= users.getGender() %> </td>
                       </tr>

                       <tr>
                          <th scope="row"> About :</th>
                          <td> <%= users.getAbout() %> </td>
                       </tr>

                       <tr>
                            <th scope="row"> Register On :</th>
                            <td> <%= users.getRdate() %> </td>
                       </tr>
                    </tbody>
                 </table>
                 </div>
                 <div id="profile-edit" style="display:none;">
                   <h3 class="mt-2">Please edit carefully</h3>
                   <form action= "EditServlet" method="post" enctype="multipart/form-data">
                     <table class="table">
                       <tr>
                         <td>ID :</td>
                         <td><%= users.getId() %></td>
                       </tr>

                       <tr>
                         <td>Email :</td>
                         <td><input type="email" class="form-control" name="user_email" value="<%= users.getEmail() %>"></td>
                       </tr>

                       <tr>
                        <td>Name :</td>
                        <td><input type="text" class="form-control" name="user_name" value="<%= users.getName()%>"></td>
                       </tr>

                       <tr>
                        <td>Password :</td>
                        <td><input type"password" class="form-control" name="user_password" value="<%= users.getPassword()%>"></td>
                       </tr>

                        <tr>
                          <td>ID :</td>
                          <td><%= users.getGender() %></td>
                        </tr>

                        <tr>
                           <td>Password :</td>
                           <td>
                           <textarea class="form-control" rows="3" name="user_about">
                               <%= users.getAbout()%>
                           </textarea>
                           </td>
                        </tr>

                        <tr>
                           <td>New Profile:</td>
                           <td>
                             <input type="file" name="image" class="form-control">
                           </td>
                        </tr>
                     </table>

                     <div class="container">
                       <button type="submit" class="btn btn-outline-primary">Save</button>
                     </div>
                   </form>

                 </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
              </div>
            </div>
          </div>
        </div>
        </div>


      <!-- modal end -->

       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
       <script src="js/myjs.js" type="text/javascript"></script>

       <script>
         $(document).ready(function() {

            let editStatus = false;

            $('#edit-profile-btn').click(function() {

              if(editStatus == false){

                 $("#profile-details").hide()
                 $("#profile-edit").show()
                 $(this).text("Back")
                 editStatus = true;
              }
              else{
                 $("#profile-details").show()
                 $("#profile-edit").hide()
                 $(this).text("Edit");
                 editStatus = false;
              }

            });
           });
       </script>

   </body>
</html>