<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../view/color.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
<html>
<head>

<title>���� �۾���</title>
<link href="../view/mystyle.css" rel="stylesheet" type=text/css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type = "text/javascript" src = "${ pageContext.request.contextPath }/view/script.js"></script>
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

<!-- �亯���� ��� : �θ���� �۹�ȣ, �׷�ȭ��ȣ, �׷�ȭ���� ����, �鿩����  
		<=== content.jsp ���������� �Ѿ��.....
-->
<body>
	<center>
		<h3><b>�� �����ϱ�</b></h3>

	<br>
	<form action="recipeUpdatePro.do?pageNum=${ pageNum }" method="post"
		name="updateForm" onsubmit="return writeSave()" enctype="multipart/form-data" >

		<table class="type06" align="center">

		
			<tr>
				<th scope="row" align="center">ID</th>
				<td>${dto.mem_id }<input type="hidden" name="recipe_num" value="${dto.recipe_num }"></td>
				</td>

			</tr>
			<tr>
				<th scope="row" align="center" class="even">�� ��</th>
				<td class="even"><input class="ev" type="text" size="40" maxlength="50"
					name="recipe_subject" value="${dto.recipe_subject }"></td>
			</tr>

			<tr>
				<th scope="row" align="center">�丮 �̸�</th>
				<td><input class="ev" type="text" name="recipe_title" value="${ dto.recipe_title }"></td>
			</tr>

			<tr>
				<th class="even" scope="row" align="center">�� ��</th>
				<td class="even"><textarea class="ev" name="recipe_material" rows="6">${ dto.recipe_material }</textarea></td>
			</tr>

			<!--  --------------------------------------------------------------------------------------------- -->

			<tr>
				<th scope="row" align="center">�丮��</th>
				<td><textarea  class="ev" rows="13" cols="40" name="recipe_recipe">${ dto.recipe_recipe }</textarea></td>
			</tr>

			<tr>
				<th class="even" scope="row" align="center" >�� ��</th>
				<td class="even">
				<img src="recipeUpload/${dto.recipe_pic}" id="img_preview" width="100"><br>
				<input type="file" id="input_file" name="recipe_pic" />
				<c:if test="${recipe_pic == null}">
    			    <input type="hidden" name="recipe_pic" value="${dto.recipe_pic}">
     		   </c:if>
				
				</td>
			</tr>

			<tr>
				<td align="center" colspan="2">
				 <input class="btdesign" type="submit" value="�ۼ���">
				 <input class="btdesign" type="reset" value="�ٽ��ۼ�">
					<input class="btdesign" type="button" value="��Ϻ���"
					onclick="location.href='recipeList.do?pageNum=${ pageNum }'">
			</tr>
		</table>

	</form>
		</center>
</body>
</html>