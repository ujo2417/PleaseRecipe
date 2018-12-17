<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>
</head>
<body>
<form name="myform" action="researchIdPro.do" method="post" >
<center>
<table class="type09" width="500px">
  
  <TR>
  	<thead>
    <th scope="cols" colspan="2" align="middle"><h3><b>아이디 찾기</b></h3></th></TR>
  </thead>
  <tbody>
  <TR height="30">
    <TD   align=center>이름</TD>
    <TD align=center >
       <INPUT type="text" name="mem_name" size="20" maxlength="20"></TD></TR>
  <TR height="30">
    <TD align=center>전화번호</TD>
    <TD align=center>
      <INPUT type="text" name="mem_phone"  size="20" maxlength="20"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle" bgcolor="${title_c}" >
      <INPUT class="btdesign" type="submit" value="ID 찾기"> 
      <input class="btdesign" type="reset" value="다시쓰기" >
      <input class="btdesign" type="button" value="메인으로" onclick="document.location.href='main.do'">
      </TD></TR>
      </tbody>
</TABLE>
</center>
</form>
<br><br>
</body>
</html>