<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>

<script language="JavaScript" src="../view/script.js"></script>

</head>
<body>  
<center><b>글삭제</b> <br>
<form action="recipeDBDeletePro.do?pageNum=${ pageNum }"  method="post" name="delForm">
	
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center"> 정말 삭제 하시겠습니까??
			<input type="hidden"  name="num"  value="${ num }">
			</td>
		</tr>
		<tr height="30"> 
			<td align="center">
			<input type="submit"  value="글삭제">
			<input type="button"  value="글목록"  onclick="document.location.href='AdminDBList.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>



