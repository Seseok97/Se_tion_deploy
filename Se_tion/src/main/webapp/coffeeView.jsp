<%@page import="java.util.ArrayList"%>
<%@page import="com.setion.CoffeeDTO"%>
<%@page import="com.setion.CoffeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee_view</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="coffeeView.css" rel="stylesheet" type="text/css" >
</head>
<body>
<h1 onclick="location.href='main.jsp';">COFFEE</h1>

<%
CoffeeDAO dao = new CoffeeDAO();
CoffeeDTO dto = new CoffeeDTO();

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
			<td>추출일자</td>
			<td>생산지</td>
			<td>가공방식</td>
			<td>분쇄</td>
			<td>추출</td>
			<td>맛</td>
		</tr>
		<%
		for(int i=0;i<boardList.size();i++){
			dto = (CoffeeDTO)boardList.get(i);
			%>
			<tr>
				<td><a href="coffeeContent.jsp?id=<%=dto.getId() %>&pageNum=<%=pageNum%>"><%=dto.getDate() %></a></td>
				<td><%=dto.getBean_country()+", "+dto.getBean_info() %></td>
				<td><%=dto.getBean_process()+", "+dto.getBean_process_detail() %></td>
				<td><%=dto.getGrind_method()+", "+dto.getGrind_click()+"클릭" %></td>
				<td><%=dto.getBrew_method()+", "+dto.getBrew_info() %></td>
				<td><%=dto.getTasting_result()+", "+dto.getTasting_info() %></td>
			</tr>
			<% }// for end %>
</table>
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
					<a href="coffeeView.jsp?pageNum=<%=startPage-pageBlock %>" id="numA">[Prev]</a>
					<%
				}
				// [1][2][3] ... 
				for(int i=startPage;i<=endPage;i++){
					%>
					<a href="coffeeView.jsp?pageNum=<%=i%>" id="numA">[<%=i %>]</a>
					<%
				}
				//다음
				if(endPage < pageCount){
					%>
					<a href="coffeeView.jsp?pageNum=<%=endPage+1 %>" id="numA">[Last]</a>
					<%
				}
				
			}// if end
			
			
			%>

</body>
</html>