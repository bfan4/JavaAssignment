<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.demo.service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.UserService"/>
<jsp:useBean id="user" class="com.demo.model.User"/>
<jsp:setProperty property="*" name="user"/>

<%    
    int result = service.add(user);
    if(result > 0)
        response.sendRedirect("homepage.jsp");
    else
        response.sendRedirect("error.html");	
%>


</body>
</html>