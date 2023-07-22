<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setion_coffee</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="coffee.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<h1 onclick="history.back()">COFFEE</h1>
<!-- 	<div id="box"> -->
<!-- 	<textarea rows="20" cols="200" id="coffeeWrite"></textarea> -->
<!-- 	</div> -->
	<form action="coffeeSet.jsp" method="post">
	<input type="submit" value="등록">
	<input type="button" value="뒤로가기" onclick="history.back()">
	<input type="button" value="리스트로 이동" onclick="location.href='coffeeSet.jsp'">
	<table>
		<tr>
			<td><select name="bean_country" required="required">
			<optgroup label="중남미">
				<option value="브라질">브라질</option>
				<option value="과테말라">과테말라</option>
				<option value="콜롬비아">콜롬비아</option>
				<option value="페루">페루</option>
				<option value="멕시코">멕시코</option>
				<option value="파나마">파나마</option>
				<option value="볼리비아">볼리비아</option>
			</optgroup>
			<optgroup label="아프리카">
				<option value="에티오피아">에티오피아</option>
				<option value="케냐">케냐</option>
				<option value="르완다">르완다</option>
				<option value="탄자니아">탄자니아</option>
			</optgroup>
			<optgroup label="기타">
				<option value="중국">중국</option>
				<option value="하와이">하와이</option>
				<option value="블렌딩">블렌딩</option>
				<option value="인스턴트">인스턴트</option>
			</optgroup>
			</select></td>
			<td><input type="text" name="bean_info" size="53px" placeholder="생산지,등급" required="required"></td>
		</tr>
		<tr>
			<td><select name="bean_process" required="required">
				<option value="워시드">워시드</option>
				<option value="내추럴">내추럴</option>
				<option value="인스턴트">인스턴트</option>
			</select></td>
			<td><input type="text" name="bean_process_detail" size="53px" placeholder="가공방식" required="required"></td>
		</tr>
		<tr>
			<td><select name="grind_method" required="required">
				<option value="코만단테">코만단테</option>
				<option value="800n">800N</option>
				<option value="인스턴트">인스턴트</option>
			</select></td>
			<td><input type="number" step="0.5" name="grind_click" size="53px" placeholder="클릭수" required="required"></td>
		</tr>
		<tr>
			<td><select name="brew_method" required="required">
			<optgroup label="드립">
				<option value="하리오">하리오</option>
				<option value="칼리타">칼리타</option>
				<option value="칼리타 웨이브">칼리타 웨이브</option>
				<option value="멜리타">멜리타</option>
				<option value="클레버">클레버</option>
			</optgroup>
			<optgroup label="에스프레소">
				<option value="컴프레소">컴프레소</option>
				<option value="모카포트">모카포트</option>
			</optgroup>
			<optgroup label="기타">
				<option value="에어로프레스">에어로프레스</option>
				<option value="트리콜레이트">트리콜레이트</option>
				<option value="프렌치프레스">프렌치프레스</option>
				<option value="인스턴트">인스턴트</option>
			</optgroup>
			</select></td>
			<td><input type="text" name="brew_info" size="53px" placeholder="0:00(시간), 00:000(비율)" required="required"></td>
		</tr>
		<tr>
			<td><select name="tasting_result" required="required">
			<optgroup label="산미">
				<option value="핵과류">핵과류</option>
				<option value="감귤류">감귤류</option>
				<option value="복합적">복합적</option>
			</optgroup>
			<optgroup label="단맛">
				<option value="초콜릿">초콜릿</option>
				<option value="설탕">설탕</option>
				<option value="시럽">시럽</option>
				<option value="사탕수수">사탕수수</option>
			</optgroup>
			<optgroup label="고소한맛">
				<option value="견과류">견과류</option>
				<option value="과자">과자</option>
				<option value="탄맛">탄맛</option>
			</optgroup>
			</select></td>
			<td><input type="text" name="tasting_info" size="53px" placeholder="맛" required="required"></td>
		</tr>
	
	</table>
	</form>
	

</body>
</html>