<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.tech.blog.entities.Users" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page errorPage="error_page.jsp" %>
<%@ page import="com.tech.blog.entities.Message"%>

<% Users users = (Users) session.getAttribute("currentUser");
   if(users==null){
     response.sendRedirect("login.jsp");
   }
%>

<% int postId = Integer.parseInt(request.getParameter("post_id"));
   PostDao d = new PostDao(ConnectionProvider.getCon());
   Post p = d.getPostByPostId(postId);
%>

<html>
  <head>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
     <title>
       <%= p.getPtitle() %>
     </title>
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

                           <li class="nav-item">
                              <a class="nav-link" data-bs-toggle="modal" data-bs-target="#add-post-modal" href="#!">Post</a>
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
           </nav>

            <%
               Message m = (Message)session.getAttribute("msg");
               if(m!=null){
               %>
               <div class="alert <%= m.getCssClass()%>" role="alert">
               <%= m.getContent() %>
               </div>
               <%
                 session.removeAttribute("msg");
               }
            %>

           <!-- navbar bar -->



           <!-- main content of the body -->

           <div class="container mt-2">
              <div class="col-md-8 offset-md-2">
                 <div class="card">
                    <div class="card-header">
                       <h4><%= p.getPtitle() %>
                    </div>
                    <div class="card-body">
                       <img class="card-img-top" src="blog_pics/<%=p.getPpic() %>" alt="card image cap"></img>
                       <p><%= p.getPcontent() %>
                       <br>
                       <br>
                       <pre><%= p.getPcode() %></pre>
                    </div>

                    <div class="card-footer">
                         <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                         <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>4</span></a>
                    </div>

                 </div>
              </div>
           </div>
           <!-- end of main content -->


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

                             <img src="pics/<%=users.getProfile() %> " style="border-radius: 50%; max-width:150px;"></img>

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

                 <!-- post modal -->

                 <!-- Modal -->
                 <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                     <div class="modal-content">
                       <div class="modal-header">
                         <h1 class="modal-title fs-5" id="exampleModalLabel">Provide the post details</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">

                         <form action="AddPostServlet" method="post" id="add-post-form">
                            <div class = "form-group">
                              <select class="form-control" name="cid">
                               <option selected disabled>---select category---</option>
                               <%
                                 PostDao postD = new PostDao(ConnectionProvider.getCon());
                                 ArrayList<Category> list = postD.getAllCategories();
                                 for(Category c:list){

                               %>
                               <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                               <%
                                 }
                               %>

                             </select>
                            </div>
                            <div class="form-group mt-3">
                               <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"></input>
                            </div>

                            <div class="form-group mt-3">
                               <textarea name="pContent" type="text" placeholder="Enter your content" class="form-control"></textarea>
                            </div>

                            <div class="form-group mt-3">
                               <textarea name="pCode" type="text" placeholder="Enter your program (if any)" class="form-control"></textarea>
                            </div>

                            <div class="form-group mt-3">
                               <label>select your pic</label>
                               <br>
                               <input type="file" name="pic"></input>
                            </div>

                            <div class="container text-center mt-3">

                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                         </form>
                       </div>

                     </div>
                   </div>
                 </div>
                 <!-- post modal end -->

                  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
                  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                  <script src="js/myjs.js" type="text/javascript"></script>
                  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

                  <!-- now add post js-->

                  <script>

                     $(document).ready(function(e){

                        $("#add-post-form").on("submit",function(event){

                          // this code gets called when form is submit
                          event.preventDefault();

                          console.log("you have clicked on submit");



                          let form = new FormData(this);

                          $.ajax({

                            url:"AddPostServlet",
                            type: "POST",
                            data: form,
                            success : function(data,textStatus,jqXHR){
                                console.log(data);
                               if(data.trim()=="done"){
                                  Swal.fire("Post Uploaded...");

                               }
                            },
                            error: function(jqXHR,textStatus,errorThrown){
                             // error
                            },

                            processData:false,
                            contentType:false
                          })

                        })
                     })
                  </script>


  </body>
</html