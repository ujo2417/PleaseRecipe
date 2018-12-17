<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"  errorPage="../error/404code.jsp" %>	
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
<title>������ recipeDBList �Խ���</title>
</head>

<body>
<center>

	<b>�� ������ �� : (${ count }) </b>
	
<table width="700">
	<tr>
		<td bgcolor="${ value_c }" align="right">
			<form method="post" name="userinput">				
				<input type="button" value="DB �߰�" onClick="location.href='recipeDBWriteForm.do'">
			</form>
		</td>
	</tr>		
</table>

<!-- // DB ������ ������ ��� -->	
<c:if test="${ count == 0 }">	
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
	</tr>
</table>	
</c:if>
	
	
<!-- //���� DB num title��� ����	 -->
<c:if test="${ count > 0 }">	
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr height="20" bgcolor="${ value_c }">
		<th align="center" width="50">�� ȣ</th>
		<th align="center" width="50">�� ��</th>
		<th align="center" width="50">����</th>
		
	</tr>
	
<c:forEach var="list"  items="${ list }">    		
	<tr height="20">
		<td align="center" width="50">
		<c:out value="${ number }" />
		<c:set  var="number"   value="${ number - 1 }" />
		</td>
		<td width="555">
			<a href="recipeDBContent.do?num=${list.recipeDB_num }&pageNum=${ currentPage }">
			${ list.recipeDB_title }
			</a>
		</td>
		<td align="center">
			${ list.recipeDB_country }
		</td>
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



<c:if test="${ count > 0 }">
	<!--  ��ü �������� ���� ���� -->
	<c:set var="pageCount" value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
	<c:set var="startPage" value="${ 1 }" />
	<!-- ���� ����!! -->
	<c:set var="pageBlock" value="${ 5 }" />
	<fmt:parseNumber var="result" value="${ currentPage / pageBlock }" integerOnly="true" />
	<c:if test="${ currentPage % pageBlock != 0 }">
		<c:set var="startPage" value="${ result * pageBlock + 1 }" />
	</c:if>
	<c:if test="${ currentPage % pageBlock == 0 }">
		<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
	</c:if>
	<c:set var="endPage" value="${ startPage + pageBlock -1 }" />
	<c:if test="${ endPage > pageCount }">
		<c:set var="endPage" value="${ pageCount }" />
	</c:if>
	<c:if test="${startPage >5 }">
		<a href="AdminDBList.do?pageNum=${ startPage-5  }">[����] </a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${ endPage }">
		<a href="AdminDBList.do?pageNum=${i}">[${ i }] </a>
	</c:forEach>
	<c:if test="${ endPage < pageCount }">
		<a href="AdminDBList.do?pageNum=${ startPage+5 }">[����] </a>
	</c:if>
</c:if>

<table>
			<tr>
				<td>
					<form action="AdminRecipeDBSearch.do" name="search">
						<input type="text" name="subject" placeholder="������ �˻� �ϼ���">
						<input class="btdesign" type="submit" value="�˻�">

					</form>
				</td>
			</tr>
		</table>
</body>
</center>
</html>