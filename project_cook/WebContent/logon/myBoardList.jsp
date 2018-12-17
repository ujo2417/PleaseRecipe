<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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

</head>
<body>
<center>
<h3><b>나의 게시판 목록</b></h3>
<table class="type09" width="900">
     <thead>
      <tr height="60">
         
      
      	 
        <th scope="cols" align="center" width="400">제목</th>
        <th scope="cols" align="center" width="80">ID</th>
         <th scope="cols" align="center" width="70">작성일</th>
         <th scope="cols" align="center" width="70">조회수</th>
      </tr>
      </thead>
      
   <c:forEach var="list"  items="${ list }">          
   <tbody>
      <tr height="30">
      	
         <td align="center" width="200"><a  class="abc" href="content.do?num=${list.free_num }&pageNum=1">
          ${ list.free_subject }</a></td>
         <td align="center" >${ list.mem_id }</td>
         <td align="center">${ list.free_date }</td>
         <td align="center">${ list.free_readcount }</td>
      </tr>
      </tbody>
   </c:forEach>
   </table>
   
   <center>
   <br><Br><br>
</body>
</html>