<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../view/color.jsp"%>  

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>

<link href="../view/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../view/script.js"></script>

</head>
<body bgcolor=" ${ bodyback_c }">  
<center><b>�ۻ���</b> <br>
<form action="recipeDeletePro.do?pageNum=${ pageNum }"  method="post" name="delForm">
	
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center"> ���� ���� �Ͻðڽ��ϱ�??
			<input type="hidden"  name="num"  value="${ num }">
			</td>
		</tr>
		<tr height="30"> 
			<td align="center">
			<input class="btdesign" type="submit"  value="�ۻ���">
			<input class="btdesign" type="button"  value="�۸��"  onclick="document.location.href='recipeList.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>



