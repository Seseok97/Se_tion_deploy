<%@page import="com.setion.CoffeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoffeeDeleteAction</title>
</head>
<body>
<%
CoffeeDAO dao = new CoffeeDAO();

dao.coffeeDelete(request.getParameter("id"));

response.sendRedirect("coffeeView.jsp");
%>

</body>
</html>