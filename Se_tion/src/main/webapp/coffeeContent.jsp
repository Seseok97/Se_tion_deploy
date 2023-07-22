<%@page import="com.setion.CoffeeDTO"%>
<%@page import="com.setion.CoffeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setion_Daily</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="coffeeContent.css" rel="stylesheet" type="text/css" >
</head>
<body>
<h1 onclick="history.back();">COFFEE</h1>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	String pageNum = request.getParameter("pageNum");
	CoffeeDAO dao = new CoffeeDAO();
	// id 정보 저장
	CoffeeDTO dto = dao.getBoard(id);
	%>
	<form action="coffeeUpdate.jsp" method="post">
	<input type="submit" value="수정하기">
	<input type="button" value="목록으로" onclick="location.href='coffeeView.jsp?pageNum=<%=pageNum%>'">
		<input type="hidden" value="<%=dto.getId() %>" name="id">
		<input type="hidden" value="<%=dto.getDate() %>" name="date">
		<input type="hidden" value="<%=dto.getBean_country() %>" name="bean_country">
		<input type="hidden" value="<%=dto.getBean_info() %>" name="bean_info">
		<input type="hidden" value="<%=dto.getBean_process() %>" name="bean_process">
		<input type="hidden" value="<%=dto.getBean_process_detail() %>" name="bean_process_detail">
		<input type="hidden" value="<%=dto.getGrind_method() %>" name="grind_method">
		<input type="hidden" value="<%=dto.getGrind_click() %>" name="grind_click">
		<input type="hidden" value="<%=dto.getBrew_method() %>" name="brew_method">
		<input type="hidden" value="<%=dto.getBrew_info() %>" name="brew_info">
		<input type="hidden" value="<%=dto.getTasting_result() %>" name="tasting_result">
		<input type="hidden" value="<%=dto.getTasting_info() %>" name="tasting_info">
	</form>
	<table border="1">
		<tr>
			<td>추출일자</td>
			<td><%=dto.getDate() %></td>
		 </tr>
		<tr>
			<td>생산지</td>
			<td><%=dto.getBean_country()+", "+dto.getBean_info() %></td>
		 </tr>
		<tr>
			<td>가공방식</td>
			<td><%=dto.getBean_process()+", "+dto.getBean_process_detail() %></td>
		</tr>
		<tr>
			<td>분쇄</td>
			<td><%=dto.getGrind_method()+", "+dto.getGrind_click()+"클릭" %></td>
		</tr>
		<tr>	
			<td>추출</td>
			<td><%=dto.getBrew_method()+", "+dto.getBrew_info() %></td>	
		</tr>
		<tr>	
			<td>맛</td>
			<td><%=dto.getTasting_result()+", "+dto.getTasting_info() %></td>	
		</tr>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>