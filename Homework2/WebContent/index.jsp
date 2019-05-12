<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">   

<title>Mall Lobby</title>
</head>
<style>
    body {
      background-image: url("https://images.pexels.com/photos/997719/pexels-photo-997719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
    }

</style>
<body>



<div class="container" style="margin-top: 200px; height: 600px;">
<div class="row">
    <div class="col-3"></div>
       <div class="col-6">
        <form  class="form-horizontal" action="login" method="post">
            <div class="form-group ">
                <label>User name：</label>
                    <input class="form-control" type="text" name="name" placeholder="Your username">
            </div>
            <br>
            <div class="form-group">
                <label>Password：</label>
                <input class="form-control" type="password" name="password" placeholder="Password">
                <small id="emailHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>  
                <br>
            </div>
            <div class="form-group">
                  <div class="checkbox">
                    <label>
                        <input name="autoLogin" type="checkbox">Remember me
                    </label>
                   </div>
              </div>
            <!-- <input type="submit" value="Login"> -->
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
            <button class="btn btn-primary btn-block" type="submit" style="margin-left:10px;">Login</button>
            </div>
            </div>
        </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>

</body>
</html>
