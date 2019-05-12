<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demo.service.UserService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="com.demo.service.UserService"/>


<%  
int result ;
    /* UserService user = new UserService(); */
    /* System.out.print(request.getParameter("name")); */
    String name = request.getParameter("name");
    
    result = user.delete(name);
    System.out.println("Delete Done!");
    System.out.println("Deleted " + name);
/*     if(result > 0)
        response.sendRedirect("homepage.jsp");
    else
        response.sendRedirect("xxxx.html");  */   

%>

</body>
</html>