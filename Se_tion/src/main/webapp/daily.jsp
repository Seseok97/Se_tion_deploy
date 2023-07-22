<%@page import="com.setion.dailyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>daily_checkList</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="daily.css" rel="stylesheet" type="text/css" >
</head>
<body>
<script type="text/javascript">
	function dayCheck(){
		<% 
		dailyDAO dao = new dailyDAO();
		int result = dao.dayCheck();
		if(result == 1){
			%>
			alert('You already did this!');
			return false
			
			<%
		}else{
			%>return true<%
		}
		%>
	}
</script>
	<h1 onclick="location.href='main.jsp';">DAILY</h1>
	<fieldset>
		<form action="dailySet.jsp" method="post" onsubmit="return dayCheck();">
		<table>
			<tr>
				<td><input type="checkbox" id="check1" name="one" value="Morning GYM"><label for="check1"></label></td>
       			<td><a>Morning GYM</a></td>
       		 </tr>
       		<tr>
       			<td><input type="checkbox" id="check2" name="two" value="Get Ready for today Class"><label for="check2"></label></td>
       			<td><a>Get Ready for today Class</a></td>
       		 </tr>
       		<tr>
     	 		<td><input type="checkbox" id="check3" name="three" value="Study"><label for="check3"></label></td>
       			<td><a>Study</a></td>
       		 </tr>
       		<tr>
       			<td><input type="checkbox" id="check4" name="four" value="Move your code to GitHub"><label for="check4"></label></td>
       		 	<td><a>Move your code to GitHub</a></td>
       		 </tr>
       		<tr>
       			<td><input type="checkbox" id="check5" name="five" value="Review and Blog"><label for="check5"></label></td>
       			<td><a>Review and Blog</a></td>
       		 </tr>
       		 
       		<input type="submit" id="submit" value="send">
       		<label for="submit"><div>Submit</div></label>
       		
       	</table>
       		<input type="button" id="submit" value="To List" onclick="location.href='dailyView.jsp'">
       		<label for="submit"><div>List</div></label>
		</form>
	</fieldset>

</body>
</html>