<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/decanter/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/decanter/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/decanter/css/component.css" />
		<script src="js/modernizr.custom.js"></script>
<title>사용자 레시피DB 게시판 검색</title>
</head>
<body>
<c:if test="${list == null }">
	<font ><h4><center>검색 된 결과가 없습니다.</center></h4></font><br>
</c:if>
<c:if test="${list !=null }">
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
									<span class="year">${list.recipedb_title }</span>
									<br>
									<span class="year">${list.recipedb_country }</span>
									<hr>
									<span class="year">${list.recipedb_meterial }</span>
									<hr>
									<span class="year">추천수 : ${list.recipedb_good }</span>
								</header>
								<p>
									<a 	href="recipeDB.do?num=${list.recipedb_num }&pageNum=1">
									<b style="float: right;">상세 보기</b>
									</a>
								</p>
							</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
				
			</div><!-- /wrapper -->
			</c:if>
		</div><!-- /container --> 
	
	
<div align = "center">
            <form action="recipeDBList.do" name="golist" >
            <input class="btdesign" type="submit" value="목록보기">
           
         </form>
   </div>
   </center>
   <Br><br>
</body>
</html>