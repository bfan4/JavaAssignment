<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">   
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<title>Mall Lobby</title>
</head>
<style>
body{
      background-image: url("https://images.pexels.com/photos/349610/pexels-photo-349610.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
}

</style>
<body style="height:700px">


<c:if test="${!empty user}">
<div class="container" style="height:100px">
<div class="row">
<div class="col-8"></div>
    <div class="col-4">
        <div class="row" style="margin-top:30px; margin-left:100px;">
        <i class="fas fa-user fa-2x"></i>
        <h4 style="margin-left:8px;">Hi ${user.name}! Welcome! </h4>
        </div>
    </div>
</div>
</div>
</c:if>

<div class="container" >
<div class="row">
<div class="col-2"></div>
<div class="col-8">
<table class="table table-striped">
    <thead class="thead-dark">
    <tr>
        <th scope="col" style="display:none">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Stock</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <c:forEach items="${products}" var="product" varStatus="st">
        <tr>
            <td style="display:none">${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.stock}</td>
            <td>

                <form action="addOrderItem" method="post">

                    Quantity
                    <!-- <input type="text" value="1" name="num"> -->
                    <select name="num">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select>
                    
                    <input type="hidden" name="pid" value="${product.id}">
                    <button class="btn btn-primary" type="submit" style="margin-left:10px;padding: 5px 32px;">Add</button>
                </form>
            </td>

        </tr>
    </c:forEach>
</table>
</div>
<div class="col-2"></div>
</div>
</div>
</body>