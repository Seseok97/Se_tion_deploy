<%@page import="com.setion.CoffeeDAO"%>
<%@page import="com.setion.CoffeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoffeeUpdateSet</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String pageNum = request.getParameter("pageNum");

if(pageNum == null){
	pageNum = "1";
}

CoffeeDTO dto = new CoffeeDTO();
dto.setId(Integer.parseInt(request.getParameter("id")));
dto.setBean_country(request.getParameter("bean_country"));
dto.setBean_info(request.getParameter("bean_info"));
dto.setBean_process(request.getParameter("bean_process"));
dto.setBean_process_detail(request.getParameter("bean_process_detail"));
dto.setGrind_method(request.getParameter("grind_method"));
dto.setGrind_click(request.getParameter("grind_click"));
dto.setBrew_method(request.getParameter("brew_method"));
dto.setBrew_info(request.getParameter("brew_info"));
dto.setTasting_result(request.getParameter("tasting_result"));
dto.setTasting_info(request.getParameter("tasting_info"));

CoffeeDAO dao = new CoffeeDAO();
int result = dao.coffeeUpdate(dto);

response.sendRedirect("coffeeContent.jsp?id="+request.getParameter("id")+"&pageNum="+pageNum);
%>

</body>
</html>