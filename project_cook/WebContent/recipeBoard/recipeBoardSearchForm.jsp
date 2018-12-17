<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자유게시판 검색</title>

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
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;

}
table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #ff4a4a;
}
table.type09 tbody th {

	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type09 td {

	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}



</style>

</head>
<body id="listfont" >
<center>
<c:if test="${list == null }">
	<font ><h4><center>검색 된 결과가 없습니다.</center></h4></font><br>
</c:if>
<c:if test="${list != null }">
 <table class="type09" align="center" width = "900">
   	<thead>
      <tr height="60px">
         
         <th scope="cols" align="center" width="50">번호</th>
        <th scope="cols" align="center" width="400">제목</th>
        <th scope="cols" align="center" width="80">ID</th>
         <th scope="cols" align="center" width="70">작성일</th>
         <th scope="cols" align="center" width="70">조회수</th>
      </tr> 
   </thead>
	<c:forEach var="list"  items="${ list }">    		
	   	<tbody>
		<tr>
			<td align="center" width="50" id="hrid">${ list.recipe_num }</td>
			<td align="center" width="400"> <a 	href="recipeContent.do?num=${list.recipe_num }&pageNum=1">
					${ list.recipe_subject }</a></td>
			<td id ="hrid2" align="center" width="80">${ list.mem_id }</td>
			<td class="aaa" align="center" width="70">${ list.recipe_date }</td>
			<td id="hrid" align="center" width="70">${ list.recipe_readcount }</td>
		</tr>
		</tbody>
	</c:forEach>
	</table>
	</c:if>
	<br>
	<div style="float: right; margin-right:200px">
            <form action="recipeList.do" name="golist" >
            <input type="submit" value="목록보기" class="button">
           
         </form>
   </div>
   	</center>
	<br><br><br>
	
</body>
</html>




