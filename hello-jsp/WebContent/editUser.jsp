<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.UserService"/>
<jsp:useBean id="user" class="com.demo.model.User"/>

<%  
    /* UserService user = new UserService(); */
    /* System.out.print(request.getParameter("name")); */
    String sid = request.getParameter("id");
    int id = Integer.parseInt(sid);
    String name = request.getParameter("name");
    String sage = request.getParameter("age");
    int age = Integer.parseInt(sage);
    String email = request.getParameter("email");
    
    user.setId(id);
    user.setName(name);
    user.setAge(age);
    user.setEmail(email);
    
    
    int result = service.update(user);
    System.out.println("Update Done!");
    System.out.println("Updated Info: " + name + ": " + age + ", " + email);
/*     if(result > 0)
        response.sendRedirect("homepage.jsp");
    else
        response.sendRedirect("xxxx.html");  */   

%>



</body>
</html>