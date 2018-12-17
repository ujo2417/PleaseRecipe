<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../view/color.jsp" %>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="icon"
	href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="shortcut icon"
	href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/decanter/css/TMGPrototype2.css">
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery-migrate-1.1.1.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/superfish.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/TMGPrototype2.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery.equalheights.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/style.css">

<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/table.css">
<title>글쓰기</title>


</head>

<!-- 답변글의 경우 : 부모글의 글번호, 그룹화번호, 그룹화내의 순서, 들여쓰기  
		<=== content.jsp 페이지에서 넘어옴.....
-->
<body >
<center><h3><b>글 수정하기</b></h3><br>
<form action = "updatePro.do?pageNum=${ pageNum }" method="post" name = "updateForm" onsubmit="return writeSave()">

<table class="type06" align="center">

<%-- <tr>
	<td align = "right" colspan="2"  bgcolor="${ value_c }">
	<a href = "list.do"> 글목록 보기</a>
	</td>
</tr> --%>
<tr>
	<input type="hidden" name="num" value="${bean.free_num }">
	<th scope="row" align = "center"> 아이디</th>
	<td>&nbsp;${sessionScope.memId }</td>
	</td>
	
</tr>
<tr>
	<th scope="row" class="even" align = "center"> 제  목</th>
	<td class="even">
<!-- 	답변인것에 대한 처리 -->
<input type= "text"  class="ev" name = "subject" value = "${ bean.free_subject }"></td>
</tr>

<!--  --------------------------------------------------------------------------------------------- -->

<tr>
	<th scope="row" align = "center"> 내  용</th>
	<td><textarea class="ev" rows="15" cols="30" name = "content" >${ bean.free_content }</textarea></td>
</tr>

<tr>
	<td align="center" colspan="2">
	<input class="btdesign" type = "submit" value = "글수정">
	<input class="btdesign" type= "reset" value = "다시작성">
	<input class="btdesign" type = "button" value = "목록보기" onclick="location.href='list.do?pageNum=${ pageNum }'">
</tr>
</table>
</form>
</center>
<Br><br>
</body>

</html>