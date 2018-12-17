<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


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
<form  id ="writeform" action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${num }">
<input type="hidden" name="id" value="${ sessionScope.memId }">

<table class="type06">
	<tr>
		<th scope="row">아이디</th>
		<td>${ sessionScope.memId }</td>
	</tr>
	<tr>
		<th scope="row" class="even">제목</th>
		<td class="even"><input type= "text" name = "subject" class="ev"></td>
	</tr>
	<tr>
		<th scope="row">내용</th>
		<td><textarea class="ev" rows="15" cols="30" name = "content" ></textarea></td>
	</tr>
  <tr>
 <td colspan="3"align="center">
 <input class ="btdesign" type = "submit" value = "글쓰기">
 <input class="btdesign" type= "reset" value = "재작성">
 <input class="btdesign" type = "button" value = "목록" onclick="document.location.href='list.do'">
 </td>
 
                              
</tr>
</table>
</form>
<br>
</center>
</body>
</html> 
