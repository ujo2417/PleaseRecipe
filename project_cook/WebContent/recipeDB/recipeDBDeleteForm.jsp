<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>

<script language="JavaScript" src="../view/script.js"></script>

</head>
<body>  
<center><b>�ۻ���</b> <br>
<form action="recipeDBDeletePro.do?pageNum=${ pageNum }"  method="post" name="delForm">
	
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center"> ���� ���� �Ͻðڽ��ϱ�??
			<input type="hidden"  name="num"  value="${ num }">
			</td>
		</tr>
		<tr height="30"> 
			<td align="center">
			<input type="submit"  value="�ۻ���">
			<input type="button"  value="�۸��"  onclick="document.location.href='AdminDBList.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>



