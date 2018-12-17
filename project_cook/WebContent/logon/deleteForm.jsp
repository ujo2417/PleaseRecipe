<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

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
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/table.css"/>
<title>회원탈퇴</title>
<link href="../view/style.css" rel="stylesheet" type="text/css">

   <script language="javascript">
     <!--
       function begin(){
         document.myform.passwd.focus();
       }

       function checkIt(){
		  if(!document.myform.passwd.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }
	   }   
     -->
   </script>
</head>
<BODY onload="begin()">


<form name="myform" action="deletePro.do" method="post" onSubmit="return checkIt()">
<center>
<TABLE class="type09" width="600px">
  <thead>
  <TR>
    <th scope="cols" colspan="2" align="middle">
	  <b><h3>회원 탈퇴</h3></b></TD></th>
     </thead>
     <tbody>
  <TR height="60">
    <TD  bgcolor="${value_c}" align=center>비밀번호</TD>
    <TD align=center>
      <INPUT type="password" name="passwd"  size="30" maxlength="12">
	  <input type="hidden" name="id" value="${sessionScope.memId}">
	  </TD></TR>
  <TR height="60">
    <TD colspan="2" align="middle"  >
      <INPUT class="btdesign" type=submit value="회원탈퇴"> 
      <input class="btdesign" type="button" value="취  소" onclick="document.location.href='main.do'"></TD></TR>
</tbody>
</TABLE>
</center>
</form>
<Br><Br><Br>
</BODY>
</HTML>
