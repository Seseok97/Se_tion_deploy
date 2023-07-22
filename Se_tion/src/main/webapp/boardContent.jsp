<%@page import="com.setion.dailyDTO"%>
<%@page import="com.setion.dailyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setion_Daily</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="boardContent.css" rel="stylesheet" type="text/css" >
</head>
<body>
<h1 onclick="history.back();">DAILY</h1>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	String pageNum = request.getParameter("pageNum");
	dailyDAO dao = new dailyDAO();
	// id 정보 저장
	dailyDTO dto = dao.getBoard(id);
	%>
	
	<table border="1">
		<tr>
			<td>NUMBER</td>
			<td><%=dto.getId() %></td>
		 </tr>
		<tr>
			<td>DATE</td>
			<td><%=dto.getDate() %></td>
		 </tr>
		<tr>
			<td>1</td>
			<td><%=dto.getOne() %></td>
		</tr>
		<tr>
			<td>2</td>
			<td><%=dto.getTwo() %></td>	
		</tr>
		<tr>	
			<td>3</td>
			<td><%=dto.getThree() %></td>	
		</tr>
		<tr>	
			<td>4</td>
			<td><%=dto.getFour() %></td>	
		</tr>
		<tr>	
			<td>5</td>
			<td><%=dto.getFive() %></td>			
		</tr>
	
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>