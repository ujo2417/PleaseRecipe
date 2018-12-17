<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>3D Shading with Box-Shadows</title>
		<meta name="description" content="A shading effect for 3D transformed elements" />
		<meta name="keywords" content="css3, transforms, shadow, shading, 3d, box shadow" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/decanter/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/decanter/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/decanter/css/component.css" />
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
		<script src="js/modernizr.custom.js"></script>
<title>레시피 검색</title>
</head>
<body>

	<div class="container">
	
			<!-- Top Navigation -->
			<!-- <div class="codrops-top clearfix">
				<a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/MultiLevelPushMenu/"><span>Previous Demo</span></a>
				<span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=16316"><span>Back to the Codrops Article</span></a></span>
			</div>
			<header>
				<h1>3D Shading with Box-Shadows <span>A shading effect for 3D transformed elements</span></h1>  
			</header> -->
			
			<div class="wrapper">
			
				<ul class="stage clearfix">
					<c:forEach var="list"  items="${ list }"> 
					<li class="scene">
						<div class="movie" onclick="return true">
							<div class="poster">
							<img src="/project_cook/recipepic/${list.recipedb_pic }" width="260px" height="200px">
							<br><br> <h4><b><center>${list.recipedb_title }</center></b></h4>
							</div>
							
							<div class="info" onclick="location.href='recipeDB.do?num=${list.recipedb_num }&pageNum=1'">
								<header>
									<span>${list.recipedb_title }</span>
									<br>
									<span >${list.recipedb_country }</span>
									<hr color="#FF5A5A">
									<span>${list.recipedb_meterial }</span>
									<hr color="#FF5A5A">
									<span >추천수 : ${list.recipedb_good }</span>
								</header>
								<p>
									<a 	href="recipeDB.do?num=${list.recipedb_num }&pageNum=1">
									<b style="float: right; color:#FF5A5A;">상세 보기</b>
									</a>
								</p>
							</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
				
			</div><!-- /wrapper -->
			
		</div><!-- /container -->
	<center>
	<c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
		<c:set  var="startPage"  value="${ 1 }" />  <!-- 차후 수정!! -->
		<c:set  var="pageBlock"  value="${ 5 }" />
		
		
		<fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" />
		<c:if  test="${ currentPage % pageBlock != 0 }" > 
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
		</c:if>
		
		<c:if  test="${ currentPage % pageBlock == 0 }" > 
			<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
		</c:if>
		
		<c:set  var="endPage"  value="${ startPage + pageBlock -1 }" />

		<c:if test="${ endPage > pageCount }" >
			<c:set  var="endPage"  value="${ pageCount }" />
		</c:if>
		
		<c:if test="${startPage >5 }" >
			<a href="recipeDBList.do?pageNum=${ startPage-5  }">[이전] </a>
		</c:if>

		<c:forEach  var="i" begin="${startPage }" end="${ endPage }">
			<a href="recipeDBList.do?pageNum=${i}"><font size="5">[${ i }]</font> </a>
	   </c:forEach>
	
	<c:if test="${ endPage < pageCount }" >
		<a href="recipeDBList.do?pageNum=${ startPage+5 }">[다음] </a>
	</c:if>
	<br>
	<table>
			<tr>
				<td>
					<form action="recipeDBsearch.do" name="search" >
						<input type="text" name="subject" placeholder="제목을 검색 하세요">
						<input class="btdesign" type="submit" value="검색">

					</form>
				</td>
			</tr>
		</table>
		<br><br>
	</center>
	
</body>
</html>