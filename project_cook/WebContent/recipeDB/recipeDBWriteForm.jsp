<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ �߰� recipeDBWrite</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type = "text/javascript" src = "${ pageContext.request.contextPath }/view/script.js"></script>

</head>

<body>
<center><b>DB �߰�</b></center><br>
<form action = "recipeDBWritePro.do" method="post" name = "recipeDBWriteform" enctype="multipart/form-data">
<input type="hidden" name="recipeDB_num" value="${num}">

<table width='570' border='1' cellspacing='0' cellpadding='0'" align="center">
	<tr>
		<td width="70" align = "center">�丮�̸�</td>
		<td width="500"><input type="text" name = "recipeDB_title" size="73"></td>
	</tr>
	<tr>
		<td width="70" align = "center">����</td>
		<td width="500">
			<input type="radio" name="recipeDB_country" value="�ѽ�">�ѽ�
			<input type="radio" name="recipeDB_country" value="�߽�">�߽�
			<input type="radio" name="recipeDB_country" value="�Ͻ�">�Ͻ�
			<input type="radio" name="recipeDB_country" value="���">���
			<input type="radio" name="recipeDB_country" value="��Ÿ">��Ÿ
		</td>
	</tr>
	<tr>
		<td width="70" align = "center">�丮���</td>
		<td width="500"><textarea rows="10"  name = "recipeDB_meterial" style="width: 500px; max-width: 500px;"></textarea></td>
	</tr>
	<tr>
		<td width="70" align = "center">������</td>
		<td width="500"><textarea rows="15" cols="400" name = "recipeDB_recipe" style="width: 500px; max-width: 500px;"></textarea></td>
	</tr>
	<tr>
		<td width="70" align = "center">��  ��</td>
		<td width="500">
			<img id="img_preview" style="display:none;"/>
			<input type="file" id="input_file" name="recipeDB_pic" />
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type = "submit" value = "DB�Է�">
		<input type= "reset" value = "�ٽ��ۼ�">
		<input type = "button" value = "��Ϻ���"	onclick="document.location.href='AdminDBList.do'">	                             
	</tr>
</table>
</form>
</body>
</html>