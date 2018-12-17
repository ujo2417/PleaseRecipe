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
		<script src="js/modernizr.custom.js"></script>
<title>������ �˻�</title>
</head>
<body>
		<c:if test="${list ==null && list1 ==null }">
			<font ><h4><center>�˻� �� ����� �����ϴ�.</center></h4></font><br>
		</c:if>
			
	
			<!-- Top Navigation -->
			<!-- <div class="codrops-top clearfix">
				<a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/MultiLevelPushMenu/"><span>Previous Demo</span></a>
				<span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=16316"><span>Back to the Codrops Article</span></a></span>
			</div>
			<header>
				<h1>3D Shading with Box-Shadows <span>A shading effect for 3D transformed elements</span></h1>  
			</header> -->
		<c:if test="${list != null}">
		<div class="container">
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
									<span class="year">��õ�� : ${list.recipedb_good }</span>
								</header>
								<p>
									<a 	href="recipeDB.do?num=${list.recipedb_num }&pageNum=1">
									<b style="float: right;">�� ����</b>
									</a>
								</p>
							</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
				
			</div><!-- /wrapper -->
			
		</div><!-- /container -->
		</c:if>
		
		
		<c:if test="${list1 != null}">
		<div class="container">
		<div class="wrapper">
			
				<ul class="stage clearfix">
					<c:forEach var="list"  items="${ list1 }"> 
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
									<span class="year">��õ�� : ${list.recipedb_good }</span>
								</header>
								<p>
									<a 	href="recipeDB.do?num=${list.recipedb_num }&pageNum=1">
									<b style="float: right;">�� ����</b>
									</a>
								</p>
							</div>
						</div>
					</li>
					</c:forEach>
					
				</ul>
				
			</div><!-- /wrapper -->
			
		</div><!-- /container -->
		</c:if>
		
<div style="float: right; margin-right:200px">
            <form action="main.do" name="golist" >
            <input type="submit" value="�������� ����" class="button">
           
         </form>
 	  </div>
		<br><br>
</body>
</html>