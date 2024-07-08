<html>
   <head>
      <title>Register Page</title>

      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
   </head>

   <body>

      <main>
         <div class="container mt-5">
            <div class="col-md-6 offset-md-3">
               <div class="card">
                  <div class="card-header text-center">
                    <span class="fa fa-3x fa-user-circle"></span>
                    <br>
                    Register Here
                  </div>
                  <div class="card-body">
                     <form action="register" method="POST">
                        <div class="mb-3">
                           <label for="user_name" class="form-label">User Name</label>
                           <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">

                        </div>


                       <div class="mb-3">
                         <label for="exampleInputEmail1" class="form-label">Email address</label>
                         <input type="email" name="user_email"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder"Enter email">

                       </div>


                       <div class="mb-3">
                         <label for="exampleInputPassword1" class="form-label">Password</label>
                         <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                       </div>

                        <div class="mb-3">
                          <label for="gender" class="form-label">Select Gender</label>
                          <br>
                          <input type="radio" id="gender" name="gender">Male
                          <input type="radio" id="gender" name="gender">Female
                        </div>


                       <div class="mb-3 form-check">
                         <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                         <label class="form-check-label" for="exampleCheck1">terms and condition</label>
                       </div>

                       <div class="form-floating">
                         <textarea class="form-control" name="about" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
                         <label for="floatingTextarea2">tell about yourself</label>
                       </div>
                       <br>
                       <button type="submit" class="btn btn-primary">Submit</button>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </main
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
      <script src="js/myjs.js" type="text/javascript"></script>
   </body>
</head>