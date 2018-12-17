<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page import="prject.cook.adminDBAction.RecipeDBWriteProAction"%>

<html>
<head>
<title>������DB �󼼺���</title>

<!-- ===================================================================== -->
<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	function go_popup() {
		$('#popup').bPopup();
	};
</script>
<style type="text/css">
.Pstyle {
    opacity: 0;
    display: none;
    position: relative;
    width: auto;
    
    border: 1px solid #fff; 
    padding: 1px;
    background-color: #fff;
}
 
.b-close {
    position: absolute;
    right: 5px;
    top: 5px;
    padding: 5px;
    display: inline-block;
    cursor: pointer;
}
</style>

<!-- ===================================================================== -->

</head>

<body bgcolor="${ bodyback_c }">
<center>
<b>${ dto.recipeDB_title }</b><br>
<form method="post" name="userinput">
<table width="700" border="1" cellspacing="0" cellpadding="0" align="center">

	<tr height="30">
		<td align="center" width="100">��ȣ</td>
		<td align="center" width="50">${ dto.recipeDB_num }</td>
		<td align="center" width="100">�丮�̸�</td>
		<td align="center" width="450">${ dto.recipeDB_title }</td>
	</tr>
		<tr>
		<td width="70" align = "center">����</td>
		<td width="500" colspan="3">
			${ dto.recipeDB_country }
		</td>
	</tr>		
	<tr>
		<td align="center">�丮����</td>
		<td colspan="3" align="center" width="125" height="100"">
<%-- 		<img src="/project_cook/recipeDBUpload/${dto.recipeDB_pic}" border="0">1<br> --%>
<div style="cursor:pointer" onclick="go_popup()"> <!-- ================= �˾� ================= -->
			<img src="recipepic/${dto.recipeDB_pic}" border="0" width="300"><br>	
			�̹������� �̸� : ${dto.recipeDB_pic}
</div>			
		</td>
		
<!-- ================= �˾� ================= -->       
<div id="popup" class="Pstyle">
<span class="b-close">X</span>
<div style="height: auto; width: auto;">			
<img src="recipepic/${dto.recipeDB_pic}" border="0" width="800" >                 
</div>
</div>
<!-- ================= �˾� ================= --> 		
		
	</tr>
	
	<tr>
		<td align="center">�丮���</td>
		<td colspan="3" align="center" width="125">
			${dto.recipeDB_meterial}
		</td>
	</tr>
	<tr>
		<td align="center">������</td>
		<td colspan="3" align="center" width="125">
			${dto.recipeDB_recipe}
		</td>
	</tr>				
	<tr height="30">
		<td align="center" bgcolor="${ value_c }"><input type="button"
			value="�ۼ���" onclick="document.location.href='recipeDBUpdateForm.do?num=${ dto.recipeDB_num }&pageNum=${ pageNum }'"></td>
		<td align="center" bgcolor="${ value_c }"><input type="button"
			value="�ۻ���" onclick="document.location.href='recipeDBDeleteForm.do?num=${ dto.recipeDB_num }&pageNum=${ pageNum }'"></td>
		<td colspan="2" align="center" bgcolor="${ value_c }"><input
			type="button" value="��� ����"
			onclick="document.location.href='AdminDBList.do?pageNum=${ pageNum }'">
		</td>
	</tr>
</table>
</form>
</body>
</center>
</html>