
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<html>
    <head>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--navbar-->
        <%@ include file = "normal_navbar.jsp"%>

        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="bg-light p-5 rounded-lg primary-background">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>
                    <h3>Tech Blog </h3>
                    <p>"Stay updated with the latest tech trends, innovations, and insights. Discover the future of technology with our daily posts."</p>
                    <p>"Your ultimate destination for tech news, tutorials, and reviews. Dive into the world of technology with expert insights and updates."</p>
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link p-2"></span>Start ! its free</button>
                    <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa user-circle"></span>Login</a>
                </div>
            </div>

        </div>
        <br>
        <!-- card -->
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="width: 25rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java programming language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 25rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java programming language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 25rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java programming language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card" style="width: 25rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java programming language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 25rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java programming language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 25rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java programming language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
