<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">   
</head>
<style>
body{
      background-image: url("https://images.pexels.com/photos/346751/pexels-photo-346751.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
}

</style>
<body>
<c:if test="${!empty user}">
    <div align="center">
        <h1 style="margin-top:60px;">${user.name}'s cart</h1>
    </div>
</c:if>

<div class="container" style="margin-top:40px;">
 <div class="row">
  <div class="col-12">
   <table class="table" style="background-color:white;opacity:0.9;">
    <thead class="thead-dark">
    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
        <th>Delete Item</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ois}" var="oi" varStatus="st">
        <tr>
            <td>${oi.product.name}</td>
            <td>${oi.product.price}</td>
            <td>${oi.num}</td>
            <td>${oi.product.price*oi.num}</td>
            <td>
                <button class="delbtn" style="border: none;background: transparent">
                        <i class="fas fa-trash-alt"></i>
                </button> 
            </td>
        </tr>
    </c:forEach>
    </tbody>   
   </table> 
  </div>
 </div>
</div>
 <c:if test="${!empty ois}">
        <div class="container">
            <div class="row">
            <div class="col-2">
                <a href="listProduct">
                <button  type="button" class="btn btn-primary btn-block" >Continue      
                </button>
                </a>
            </div>
            <div class="col-8">
            </div>
            <div class="col-2">
                <a href="createOrder">
                <button  type="button" class="btn btn-success btn-block" >Place Order       
                </button>
                </a>
            </div>
            </div>
        </div>
    </c:if>
</body>
<script type="text/javascript">

$(document).ready(function () {
    console.log("Hello!");
    
    $(".delbtn").bind("click", Delete);
});

function Delete() {
    var par = $(this).parent().parent();
    par.remove();
};

</script>
</html>
