<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/user.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>User Management</title>
</head>
<!-- <style>
    body{
        background-image:
    }
</style> -->
<body>
<%
    
    String driveName = "com.mysql.cj.jdbc.Driver";
    String userName = "root";
    String pwd = "admin";
    String dbName = "tryout";
    String tbName = "users1000";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tryout?serverTimezone=UTC", "root", "admin");
    Statement s = con.createStatement();
    String sql = "select * from users1000";
    ResultSet rs = s.executeQuery(sql);
    
%>
<div class="container">
    <div class="row">
    <h2 style="margin-top: 70px;">Please add user below</h2>
    
    </div>

</div>

<div class="container">
    <div class="row">
        <div class="col">
        <form method="post" action="register.jsp" style="margin-top:10px;">
            Name: <input type= "text" name="name"/>
            Age: <input type= "text" name="age"/>
            E-mail: <input type= "text" name="email"/>
            <!-- <input type="submit" value="Insert"/> -->
            <button class="btn btn-primary" type="submit" style="margin-left:10px;">Add</button>
        </form>
        </div>
    </div>
</div>

<div class="container" style="margin-top:30px;">
<table class="table table-striped">
   <thead class="thead-dark">
   
    <tr>
      <!-- <th scope="col">ID</th> -->
      <th scope="col">Name</th>
      <th scope="col">Age</th>
      <th scope="col">Email</th>
      <th scope="col">Save</th>
      <th scope="col">Edit</th>
      <th scope="col">Delete</th>
    </tr>
    
   </thead> 
   <tbody>
   <%
       while(rs.next()){
              
   %>
    <tr>
    
     <% String name = rs.getString("name"); %>
     <td style="display:none;"><%= rs.getInt("id")%></td>
     <td><%= rs.getString("name")  %> </td>
     <td><%= rs.getInt("age")      %> </td>
     <td><%= rs.getString("email") %> </td>
     <td>
        <button class="savebtn" style="border: none;background: transparent">
            <i class="fas fa-save" ></i>
        </button> 
     </td> 
     <td>
        <button class="editbtn" style="border: none;background: transparent">
            <i class="fas fa-edit" ></i>
        </button> 
     </td>
     <td>        
        <button class="delbtn" style="border: none;background: transparent">
            <i class="fas fa-trash-alt"></i>
        </button>         
     </td>
       
    </tr>
    
    <% } %>
       
   </tbody>
</table>
</div>

<!-- <script type="text/javascript">

$(document).ready(function () {
	console.log("Hello!");
	
    $(".delbtn").bind("click", Delete);
    $(".editbtn").bind("click", Edit);
    $(".savebtn").bind("click", Save);

    $(".delbtn").click(function () {
        var par = $(this).parent().parent();
        var tdName = par.children("td:nth-child(2)");
        console.log(tdName.text());
        $.post("deleteUser.jsp",
        	{
                name: tdName.text()
            },
            function () {

            })
    });
    
    $(".savebtn").click(function () {

        var par = $(this).parent().parent();
        
        var tdId = par.children("td:nth-child(1)");
        var tdName = par.children("td:nth-child(2)");
        var tdAge = par.children("td:nth-child(3)");
        var tdEmail = par.children("td:nth-child(4)");


        $.post("editUser.jsp",
            {
        	    id: tdId.text().trim(),
                name: tdName.text().trim(),
                age: tdAge.text().trim(),
                email: tdEmail.text().trim()
            },
            function () {

            })

    });
    
    
    
});

function Delete() {
    var par = $(this).parent().parent();
    par.remove();
};

function Edit() {
    var par = $(this).parent().parent();
    var tdName = par.children("td:nth-child(2)");
    var tdAge = par.children("td:nth-child(3)");
    var tdEmail = par.children("td:nth-child(4)");
    

    tdName.html("<input type='text' id='txtName' value='" + tdName.html() + "'/>");
    tdAge.html("<input type='text' id='txtAge' value='" + tdAge.html() + "'/>");
    tdEmail.html("<input type='text' id='textEmail' value='" + tdEmail.html() + "'/>");

};

function Save() {
    var par = $(this).parent().parent();
    var tdName = par.children("td:nth-child(2)");
    var tdAge = par.children("td:nth-child(3)");
    var tdEmail = par.children("td:nth-child(4)");


    tdName.html(tdName.children("input[type=text]").val());
    tdAge.html(tdAge.children("input[type=text]").val());
    tdEmail.html(tdEmail.children("input[type=text]").val());

};

</script> -->




</body>
</html>