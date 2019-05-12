<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
    ArrayList<String> cartList = (ArrayList<String>)session.getAttribute("cartOfLabtops");
    if(cartList == null){
    	
    	cartList = new ArrayList<String>();
    	
    }
    
    String arr[] = request.getParameterValues("laptops");
    for (int i = 0; i < arr.length; i++){
    	cartList.add(arr[i]);
    }
    
    session.setAttribute("cartOfLaptops", cartList);
    out.println("You have following item in your cart:");
    
%>

<ul>
<%  for (int i = 0; i< cartList.size(); i++){   %>
    <li> <%= cartList.get(i) %> </li>
<% }  %>

</ul>

<%

%>


</body>
</html>