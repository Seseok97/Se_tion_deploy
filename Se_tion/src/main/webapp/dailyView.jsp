<%@page import="com.setion.dailyDTO"%>
<%@page import="com.setion.dailyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="dailyView.css" rel="stylesheet" type="text/css" >
</head>
<body>
<h1 onclick="location.href='main.jsp';">DAILY</h1>

<%
dailyDAO dao = new dailyDAO();
dailyDTO dto= new dailyDTO();

int count = dao.getBoardCount();

int pageSize = 5;

String pageNum = request.getParameter("pageNum");

if(pageNum == null){
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize +1;
int endRow = currentPage * pageSize;

ArrayList boardList = dao.getBoardList(startRow, pageSize);
%>


	<table border="1">
		<tr>
			<td>ID</td>
			<td>Date</td>
			<td>Number of Check</td>
		</tr>
		<%
		for(int i=0;i<boardList.size();i++){
			dto = (dailyDTO)boardList.get(i);
			int result = 5;
			if(dto.getOne() == null){
				result -= 1;
			}
			if(dto.getTwo() == null){
				result -= 1;
			}
			if(dto.getThree() == null){
				result -= 1;
			}
			if(dto.getFour() == null){
				result -= 1;
			}
			if(dto.getFive() == null){
				result -= 1;
			}
			%>
			<tr>
				<td>
					<a href="boardContent.jsp?id=<%=dto.getId() %>&pageNum=<%=pageNum%>">
					<%=dto.getId() %></a></td>
				<td><%=dto.getDate() %></td>
				<td><%=result %></td>
			</tr>
			<% }// for end %>
			<%
			// 페이징처리 2 > 페이지 찾아가기
			if(count != 0){
				int pageCount= count/pageSize + (count%pageSize==0? 0:1);
				
				int pageBlock = 6;
				
				//시작 페이지
				int startPage=(((currentPage -1)/pageBlock)*pageBlock)+1;
				//끝 페이지
				int endPage = startPage+pageBlock-1;
				if(endPage>pageCount){
					endPage = pageCount;
				}
				// 이전
				if(startPage > pageBlock){
					%>
					<a href="dailyView.jsp?pageNum=<%=startPage-pageBlock %>" id="numA">[Prev]</a>
					<%
				}
				// [1][2][3] ... 
				for(int i=startPage;i<=endPage;i++){
					%>
					<a href="dailyView.jsp?pageNum=<%=i%>" id="numA">[<%=i %>]</a>
					<%
				}
				//다음
				if(endPage < pageCount){
					%>
					<a href="dailyView.jsp?pageNum=<%=endPage+1 %>" id="numA">[Last]</a>
					<%
				}
				
			}// if end
			
			
			%>

</body>
</html>