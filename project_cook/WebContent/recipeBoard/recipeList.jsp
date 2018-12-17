<%@ page import="project.cook.boardBean.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" errorPage="../error/404code.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ include file="../view/color.jsp"%>

<html>
<head>
<title>�Խ���</title>
<script type="text/javascript">
	function openCofirmid(userinput) {

		if (userinput.id.value == "") {

			alert("�α��� �� �̿� �����մϴ�.");

			return;

		}

		location.href = "recipeWriteForm.do";

	}
</script>

<link rel="icon"
	href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">

<link rel="shortcut icon"
	href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/decanter/css/style.css">

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

<style type="text/css">
<
link rel ="icon" href ="${pageContext .request.contextPath
	
}

/
decanter /images/favicon.ico "> <link rel ="shortcut icon " href ="${pageContext
	.request.contextPath
	
}

/
decanter /images/favicon.ico "> <link rel ="stylesheet" href ="${pageContext
	.request.contextPath
	
}

/
decanter /css/style.css "> <link rel ="stylesheet" href ="${pageContext
	.request.contextPath
	
}

/
decanter /css/TMGPrototype2.css "> <script src ="${pageContext
	.request.contextPath
	
}

/
decanter /js/jquery.js "> </script> <script src ="${pageContext
	.request.contextPath
	
}

/
decanter /js/jquery-migrate-1.1.1.js "> </script> <script src ="${pageContext
	.request.contextPath
	
}

/
decanter /js/superfish.js "> </script> <script src ="${pageContext
	.request.contextPath
	
}

/
decanter /js/TMGPrototype2.js "> </script> <script src ="${pageContext
	.request.contextPath
	
}

/
decanter /js/jquery.equalheights.js "> </script> <script src ="${pageContext
	.request.contextPath
	
}

/
decanter /js/jquery.easing.1.3.js "> </script> <style type ="text/css">table.type09
	{
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

<body id="listfont">
	<%-- ${ sessionScope.memId } --%>
	<center>

		<c:if test="${ count == 0 }">
			<table calss="type09" width="900">
				<tr>
					<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${ count > 0 }">
			<table width="900" align="center" class="type09">
				<thead>

					<tr height="60px">

						<th scope="cols" align="center" width="50">��ȣ</th>

						<th scope="cols" align="center" width="400">����</th>

						<th scope="cols" align="center" width="80">ID</th>

						<th scope="cols" align="center" width="70">�ۼ���</th>

						<th scope="cols" align="center" width="70">��ȸ��</th>

					</tr>

				</thead>
				<c:forEach var="list" items="${ list }">

					<tbody>

						<tr>

							<td id="hrid" align="center" width="50"><c:out
									value="${ number }" /> <c:set var="number"
									value="${ number - 1 }" /></td>

							<td width="400" align="center"><a
								href="recipeContent.do?num=${list.recipe_num }&pageNum=${ currentPage }">

									${ list.recipe_subject }</a></td>

							<td id="hrid2" align="center" width="80">${ list.mem_id }</td>

							<td class="aaa" align="center" width="70">${ list.recipe_date }</td>

							<td id="hrid" align="center" width="70">${ list.recipe_readcount }</td>

						</tr>

					</tbody>
				</c:forEach>
			</table>
		</c:if>
		<br>
		<c:if test="${ count > 0 }">
			<!--  ��ü �������� ���� ���� -->
			<c:set var="pageCount"
				value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
			<c:set var="startPage" value="${ 1 }" />
			<!-- ���� ����!! -->
			<c:set var="pageBlock" value="${ 5 }" />


			<fmt:parseNumber var="result" value="${ currentPage / pageBlock }"
				integerOnly="true" />
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
				<a href="recipeList.do?pageNum=${ startPage-5  }">[����] </a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${ endPage }">
				<a href="recipeList.do?pageNum=${i}">[${ i }] </a>
			</c:forEach>

			<c:if test="${ endPage < pageCount }">
				<a href="recipeList.do?pageNum=${ startPage+5 }">[����] </a>
			</c:if>
		</c:if>

		<br>
		<br>
		<h6>
			<b>�� ���(��ü �� : ${ count })</b>
		</h6>

		<table>
			<tr>
				<td bgcolor="${ value_c }" align="right">
					<!-- <a href="writeForm.do">�۾���</a> -->
					<form method="post" name="userinput">
						<input type="hidden" name="id" value="${ sessionScope.memId }">
					</form>
				</td>
			</tr>
		</table>

		<!-- -----------------------------------�˻�â-------------------------------- -->
		<table>
			<tr>
				<td>
					<form action="recipeBoardSearch.do" name="search">
						<input type="text" name="subject" placeholder="������ �˻� �ϼ���">
						<input type="submit" value="�˻�" class="button">

					</form>
				</td>
				<td>
					<form method="post" name="userinput">
						<input type="button" value="�۾���" class="button" onClick="openCofirmid(this.form)">
						<input type="hidden" name="id" value="${ sessionScope.memId }">
					</form>
				</td>
			</tr>
		</table>
		<!-- --------------------------------------------------------------------------------- -->
		<br>
		<br>
</body>
</center>
</html>