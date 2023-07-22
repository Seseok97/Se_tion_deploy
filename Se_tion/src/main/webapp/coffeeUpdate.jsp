<%@page import="com.setion.CoffeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoffeeUpdate</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="coffee.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<h1 onclick="location.href='coffeeView.jsp'">COFFEE</h1>
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


%>
<%-- 	<form action="coffeeContent.jsp?id=<%=dto.getId() %>&pageNum=<%=pageNum %>" method="post"> --%>
	<form action="coffeeUpdateSet.jsp?id=<%=dto.getId() %>&pageNum=<%=pageNum %>" method="post">
	<input type="submit" value="수정">
	<input type="button" value="삭제" onclick="location.href='coffeeDelete.jsp?id=<%=dto.getId() %>'">
	<input type="button" value="뒤로가기" onclick="history.back()">
	<table>
		<tr>
			<td><select name="bean_country" required="required">
			<optgroup label="중남미">
			
			<option value="브라질" 
			<%if(dto.getBean_country().equals("브라질")){%>
				selected
			<% }%>>브라질</option>
			
			<option value="과테말라" 
			<%if(dto.getBean_country().equals("과테말라")){%>
				selected
			<% }%>>과테말라</option>
			
			<option value="콜롬비아" 
			<%if(dto.getBean_country().equals("콜롬비아")){%>
				selected
			<% }%>>콜롬비아</option>
			
			<option value="페루" 
			<%if(dto.getBean_country().equals("페루")){%>
				selected
			<% }%>>페루</option>
			
			<option value="멕시코" 
			<%if(dto.getBean_country().equals("멕시코")){%>
				selected
			<% }%>>멕시코</option>
			
			<option value="파나마" 
			<%if(dto.getBean_country().equals("파나마")){%>
				selected
			<% }%>>파나마</option>
			
			<option value="볼리비아" 
			<%if(dto.getBean_country().equals("볼리비아")){%>
				selected
			<% }%>>볼리비아</option>

			</optgroup>
			<optgroup label="아프리카">
			<option value="에티오피아" 
			<%if(dto.getBean_country().equals("에티오피아")){%>
				selected
			<% }%>>에티오피아</option>
			<option value="케냐" 
			<%if(dto.getBean_country().equals("케냐")){%>
				selected
			<% }%>>케냐</option>
			<option value="르완다" 
			<%if(dto.getBean_country().equals("르완다")){%>
				selected
			<% }%>>르완다</option>
			<option value="탄자니아" 
			<%if(dto.getBean_country().equals("탄자니아")){%>
				selected
			<% }%>>탄자니아</option>
			</optgroup>
			<optgroup label="기타">
			<option value="중국" 
			<%if(dto.getBean_country().equals("중국")){%>
				selected
			<% }%>>중국</option>
			<option value="하와이" 
			<%if(dto.getBean_country().equals("하와이")){%>
				selected
			<% }%>>하와이</option>
			<option value="블렌딩" 
			<%if(dto.getBean_country().equals("블렌딩")){%>
				selected
			<% }%>>블렌딩</option>
			<option value="인스턴트" 
			<%if(dto.getBean_country().equals("인스턴트")){%>
				selected
			<% }%>>인스턴트</option>

			</optgroup>
			</select></td>
			<td><input type="text" name="bean_info" size="53px" required="required" value="<%=dto.getBean_info() %>"></td>
		</tr>
		<tr>
			<td><select name="bean_process" required="required">
			<option value="워시드" 
			<%if(dto.getBean_process().equals("워시드")){%>
				selected
			<% }%>>워시드</option>
			<option value="내추럴" 
			<%if(dto.getBean_process().equals("내추럴")){%>
				selected
			<% }%>>내추럴</option>
			<option value="인스턴트" 
			<%if(dto.getBean_process().equals("인스턴트")){%>
				selected
			<% }%>>인스턴트</option>
			</select></td>
			<td><input type="text" name="bean_process_detail" size="53px" required="required" value="<%=dto.getBean_process_detail() %>"></td>
		</tr>
		<tr>
			<td><select name="grind_method" required="required">
			<option value="코만단테" 
			<%if(dto.getGrind_method().equals("코만단테")){%>
				selected
			<% }%>>코만단테</option>
			<option value="800n" 
			<%if(dto.getGrind_method().equals("800n")){%>
				selected
			<% }%>>800n</option>
			<option value="인스턴트" 
			<%if(dto.getGrind_method().equals("인스턴트")){%>
				selected
			<% }%>>인스턴트</option>
			</select></td>
			<td><input type="number" step="0.5" name="grind_click" size="53px" required="required" value="<%=dto.getGrind_click() %>"></td>
		</tr>
		<tr>
			<td><select name="brew_method" required="required">
			<optgroup label="드립">
			<option value="하리오" 
			<%if(dto.getBrew_method().equals("하리오")){%>
				selected
			<% }%>>하리오</option>
			<option value="칼리타" 
			<%if(dto.getBrew_method().equals("칼리타")){%>
				selected
			<% }%>>칼리타</option>
			<option value="칼리타 웨이브" 
			<%if(dto.getBrew_method().equals("칼리타 웨이브")){%>
				selected
			<% }%>>칼리타 웨이브</option>
			<option value="멜리타" 
			<%if(dto.getBrew_method().equals("멜리타")){%>
				selected
			<% }%>>멜리타</option>
			<option value="클레버" 
			<%if(dto.getBrew_method().equals("클레버")){%>
				selected
			<% }%>>클레버</option>
			</optgroup>
			<optgroup label="에스프레소">
			<option value="컴프레소" 
			<%if(dto.getBrew_method().equals("컴프레소")){%>
				selected
			<% }%>>컴프레소</option>
			<option value="모카포트" 
			<%if(dto.getBrew_method().equals("모카포트")){%>
				selected
			<% }%>>모카포트</option>
			</optgroup>
			<optgroup label="기타">
			<option value="에어로프레스" 
			<%if(dto.getBrew_method().equals("에어로프레스")){%>
				selected
			<% }%>>에어로프레스</option>
			<option value="트리콜레이트" 
			<%if(dto.getBrew_method().equals("트리콜레이트")){%>
				selected
			<% }%>>트리콜레이트</option>
			<option value="프렌치프레스" 
			<%if(dto.getBrew_method().equals("프렌치프레스")){%>
				selected
			<% }%>>프렌치프레스</option>
			<option value="인스턴트" 
			<%if(dto.getBrew_method().equals("인스턴트")){%>
				selected
			<% }%>>인스턴트</option>
			</optgroup>
			</select></td>
			<td><input type="text" name="brew_info" size="53px" required="required" value="<%=dto.getBrew_info() %>"></td>
		</tr>
		<tr>
			<td><select name="tasting_result" required="required">
			<optgroup label="산미">
			<option value="핵과류" 
			<%if(dto.getTasting_result().equals("핵과류")){%>
				selected
			<% }%>>핵과류</option>
			<option value="감귤류" 
			<%if(dto.getTasting_result().equals("감귤류")){%>
				selected
			<% }%>>감귤류</option>
			<option value="복합적" 
			<%if(dto.getTasting_result().equals("복합적")){%>
				selected
			<% }%>>복합적</option>
			</optgroup>
			<optgroup label="단맛">
			<option value="초콜릿" 
			<%if(dto.getTasting_result().equals("초콜릿")){%>
				selected
			<% }%>>초콜릿</option>
			<option value="설탕" 
			<%if(dto.getTasting_result().equals("설탕")){%>
				selected
			<% }%>>설탕</option>
			<option value="시럽" 
			<%if(dto.getTasting_result().equals("시럽")){%>
				selected
			<% }%>>시럽</option>
			<option value="사탕수수" 
			<%if(dto.getTasting_result().equals("사탕수수")){%>
				selected
			<% }%>>사탕수수</option>
			</optgroup>
			<optgroup label="고소한맛">
			<option value="견과류" 
			<%if(dto.getTasting_result().equals("견과류")){%>
				selected
			<% }%>>견과류</option>
			<option value="과자" 
			<%if(dto.getTasting_result().equals("과자")){%>
				selected
			<% }%>>과자</option>
			<option value="탄맛" 
			<%if(dto.getTasting_result().equals("탄맛")){%>
				selected
			<% }%>>탄맛</option>
			</optgroup>
			</select></td>
			<td><input type="text" name="tasting_info" size="53px" required="required" value="<%=dto.getTasting_info() %>"></td>
		</tr>
	
	</table>
	</form>
</body>
</html>