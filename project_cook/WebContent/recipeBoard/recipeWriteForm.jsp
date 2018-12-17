
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../view/color.jsp" %>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 글쓰기</title>
<link rel="icon" href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="shortcut icon" href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/TMGPrototype2.css">
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery-migrate-1.1.1.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/superfish.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/TMGPrototype2.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.equalheights.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>
<script src="${ pageContext.request.contextPath }/view/script.js"></script>
<style type="text/css">
table.type06 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 20px 10px;
}
table.type06 th {
	width: 80px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
}
table.type06 td {
	width: 600px;
	padding: 10px;
	vertical-align: top;
}
table.type06 .even {
	background: #efefef;
}
table.type06 .ev {
	width : 500px;
	max-width: 500px;
}
</style>

</head>


<body >
<center><h3><b style="font-family:고딕">글쓰기</b></h3><br>

<form action = "recipeWritePro.do" method="post" name = "recipeWriteform" enctype="multipart/form-data" onsubmit="return writeSave()">
<input type="hidden" name="recipe_num" value="${num }">
<input type="hidden" name="id" value="${ sessionScope.memId }">
<input type="hidden" name="mem_id" value="${ sessionScope.memId }">



<table class="type06">
	<tr>
		<th scope="row" align = "center">아이디</th>
		<td>${ sessionScope.memId }</td>
	</tr>
	<tr>
		<th scope="row" class="even" align = "center" >제목</th>
		<td class="even"><input type= "text" name = "recipe_subject" class="ev" style="width:600px; max-width:600px"></td>
	</tr>
<tr>
	<th align = "center"> 요리이름</th>
	<td><input type="text" name = "recipe_title" style="width:600px; max-width:600px"></td>
</tr>


<tr>
	<th align = "center" class="even">요리재료</th>
	<td class="even"><textarea rows="6"  name = "recipe_material" style="width:600px; max-width:600px"></textarea></td>
</tr>
<tr>
	<th  align = "center"> 레시피</th>
	<td><textarea rows="10" cols="50" name = "recipe_recipe" style="width:600px; max-width:600px"></textarea></td>
</tr>
<tr>
	<th  class="even" align = "center"> 사  진</th>
	<td  class="even">
	<img id="img_preview" style="display:none;"/>
	<input type="file" id="input_file" name="recipe_pic"/>
	</td>
</tr>
<tr>
	<td align="center" colspan="2" >
	<input type = "submit" value = "글쓰기" class="btdesign">
	<input type= "reset" value = "다시작성" class="btdesign" >
	<input type = "button" value = "목록보기"	class="btdesign" onclick="document.location.href='recipeList.do'">
	                             
</tr>
</table>
</form>
</body>
</html>

 
 
 








