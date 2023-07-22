<%@page import="java.util.ArrayList"%>
<%@page import="com.setion.dailyDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.setion.dailyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="dailySet.css" rel="stylesheet" type="text/css" >
</head>
<body>
<h1 onclick="history.back();">DAILY</h1>
<%
request.setCharacterEncoding("UTF-8");
dailyDTO dto = new dailyDTO();
dto.setOne(request.getParameter("one"));
dto.setTwo(request.getParameter("two"));
dto.setThree(request.getParameter("three"));
dto.setFour(request.getParameter("four"));
dto.setFive(request.getParameter("five"));

if(request.getParameter("one") == null){
	System.out.println("공백");
}


dailyDAO dao = new dailyDAO();
dao.setData(dto);

System.out.println("정보저장 페이지 지나갔음.");

response.sendRedirect("dailyView.jsp");
%>

</body>
</html>