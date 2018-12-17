<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레시피 추가 recipeDBWrite</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type = "text/javascript" src = "${ pageContext.request.contextPath }/view/script.js"></script>

</head>

<body>
<center><b>DB 추가</b></center><br>
<form action = "recipeDBWritePro.do" method="post" name = "recipeDBWriteform" enctype="multipart/form-data">
<input type="hidden" name="recipeDB_num" value="${num}">

<table width='570' border='1' cellspacing='0' cellpadding='0'" align="center">
	<tr>
		<td width="70" align = "center">요리이름</td>
		<td width="500"><input type="text" name = "recipeDB_title" size="73"></td>
	</tr>
	<tr>
		<td width="70" align = "center">구분</td>
		<td width="500">
			<input type="radio" name="recipeDB_country" value="한식">한식
			<input type="radio" name="recipeDB_country" value="중식">중식
			<input type="radio" name="recipeDB_country" value="일식">일식
			<input type="radio" name="recipeDB_country" value="양식">양식
			<input type="radio" name="recipeDB_country" value="기타">기타
		</td>
	</tr>
	<tr>
		<td width="70" align = "center">요리재료</td>
		<td width="500"><textarea rows="10"  name = "recipeDB_meterial" style="width: 500px; max-width: 500px;"></textarea></td>
	</tr>
	<tr>
		<td width="70" align = "center">레시피</td>
		<td width="500"><textarea rows="15" cols="400" name = "recipeDB_recipe" style="width: 500px; max-width: 500px;"></textarea></td>
	</tr>
	<tr>
		<td width="70" align = "center">사  진</td>
		<td width="500">
			<img id="img_preview" style="display:none;"/>
			<input type="file" id="input_file" name="recipeDB_pic" />
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type = "submit" value = "DB입력">
		<input type= "reset" value = "다시작성">
		<input type = "button" value = "목록보기"	onclick="document.location.href='AdminDBList.do'">	                             
	</tr>
</table>
</form>
</body>
</html>