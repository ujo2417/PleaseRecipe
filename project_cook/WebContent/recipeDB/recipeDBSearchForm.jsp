<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������DB �Խ��� �˻�</title>
</head>
<body>
<center>
<c:if test="${list == null }">
	<font ><h4><center>�˻� �� ����� �����ϴ�.</center></h4></font><br>
</c:if>
<c:if test="${list != null }">
<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr height="30" bgcolor="${ value_c }">
			
			<td align="center" width="50">�� ��</td>
			<td align="center" width="50">����</td>
			
		</tr>
	<c:forEach var="list"  items="${ list }">    		
		<tr height="30">
			<td align="center" width="150"> <a 	href="recipeDBContent.do?num=${list.recipeDB_num }&pageNum=1">
					${ list.recipeDB_title }</a></td>
			<td align="center" width="150">${ list.recipeDB_country}</td>
			<td>
		<form action="recipeDBDeleteForm.do" name="recipeDB_num" >
		<input type="hidden" name="num" value="${list.recipeDB_num }">
		<input type="submit" value="����">
		</form>
		</td>	

		</tr>
	</c:forEach>
	</table>
</c:if>
<div align = "center">
            <form action="AdminDBList.do" name="golist" >
            <input type="submit" value="��Ϻ���">
           
         </form>
   </div>
   </center>
</body>
</html>