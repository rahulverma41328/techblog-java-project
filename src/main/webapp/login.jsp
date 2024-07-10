<html>
   <head>
      <title>Login Page</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
   </head>

   <body>
      <%@ include file="normal_navbar.jsp"%>
      <main class="d-flex align-items-center primary-background text-white" style="height: 80vh">
         <div class="container">
            <div class="row">
               <div class="col-md-4 offset-md-4">
                  <div class="card">
                     <div class="card-header">
                        <p>Login here</p>
                     </div>

                     <div class="card-body">
                        <form action="login" method='POST'>
                          <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input name="email" required type="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                          </div>
                          <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                          </div>

                          <div class="container text-center">

                              <button type="submit" class="btn btn-primary">Submit</button>

                          </div>


                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </main>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
      <script src="js/myjs.js" type="text/javascript"></script>

   </body>
</html>