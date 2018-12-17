<%@ page import="project.cook.boardBean.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"  errorPage="../error/404code.jsp" %>
	
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ include file="../view/color.jsp"%>

<html>
<head>
<title>게시판</title>
</head>
<body bgcolor="${ bodyback_c }">
	

	<table width="700" border="1" cellpadding="0" cellspacing="0"
		align="center">
		<tr height="30" bgcolor="${ value_c }">
			<td align="center" width="50">번 호</td>
			<td align="center" width="50">제 목</td>
			<td align="center" width="50">작성자</td>
			<td align="center" width="50">작성날짜</td>
			<td align="center" width="50">조회수</td>
			<td align="center" width="50">관리</td>
			
		</tr>
	<c:forEach var="list"  items="${ list }">    		
	
		<tr height="30">
			<td align="center" width="50">
			${ list.recipe_num }
			</td>
			<td width="250">
	  <a href="recipeContent.do?num=${list.recipe_num }&pageNum=1">
					${ list.recipe_subject }</a></td>
			<td align="center" width="150">${ list.mem_id }</td>
			<td align="center" width="150">${ list.recipe_date }</td>
			<td align="center" width="150">${ list.recipe_readcount }</td>
			<td align="center" width="150">
			<form action="AdminRecipeDelete.do">
				<input type="hidden" name="recipe_num" value="${list.recipe_num }">
				<input type="submit" value="삭제">
			</form>
			</td>
			
		</tr>
	</c:forEach>
	</table>
  
</body>
</center>
</html>