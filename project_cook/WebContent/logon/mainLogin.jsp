<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="../view/color.jsp"%>
<html>
<head>
<title>�����Դϴ�..</title>
<link href="../view/style.css" rel="stylesheet" type="text/css">
</head>


<body bgcolor="${bodyback_c}">

	<c:if test="${empty sessionScope.memId}">

		<table cellSpacing=1 cellPadding=1 width="260" border=1 align="center">
			<TR height="30" weigth="50">
				<TD colspan="2" align="middle" bgcolor="${title_c}"><STRONG>ȸ���α���</STRONG></TD>
			</TR>
			<tr height="30">
				<form name="inform" method="post" action="loginPro.do">
					<td width="110" bgcolor="${title_c}" align=center>���̵�</td>
					<td width="150" bgcolor="${value_c}" align=center><input
						type="text" name="id" size="15" maxlength="10"></td>
			</tr>
			<tr height="30">

				<td width="110" bgcolor="${title_c}" align=center>�н�����</td>
				<td width="150" bgcolor="${value_c}" align=center><input
					type="password" name="passwd" size="15" maxlength="10"></td>
			</tr>
			<tr height="30">
				<td colspan="3" bgcolor="${title_c}" align="center"><input
					type="submit" name="Submit" value="�α���"> <input
					type="button" value="ȸ������"
					onclick="document.location.href='inputForm.do'">
					<input type="button" value="���̵�ã��" onclick="document.location.href='researchId.do'">
					<input type="button" value="��й�ȣ ã��" onclick="document.location.href='researchPwd.do'">
					</td>
				</form>
			</tr>
		</table>
	</c:if>

	<c:if test="${!empty sessionScope.memId}">
		<table width=500 cellpadding="0" cellspacing="0" align="center"
			border="1">
			<tr>


				<td rowspan="3" bgcolor="${value_c}" align="center">
					${sessionScope.memId}���� <br> �湮�ϼ̽��ϴ�
					<form method="post" action="logout.do">
						<input type="submit" value="�α׾ƿ�"> 
					</form>
					<form method="post" action="modify.do">
					<input type="submit" value="��������">
					</form>
					
				</td>
			</tr>

		</table>
		<br>
	</c:if>
</body>
</html>
