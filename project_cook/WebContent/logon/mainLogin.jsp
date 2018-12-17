<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="../view/color.jsp"%>
<html>
<head>
<title>메인입니다..</title>
<link href="../view/style.css" rel="stylesheet" type="text/css">
</head>


<body bgcolor="${bodyback_c}">

	<c:if test="${empty sessionScope.memId}">

		<table cellSpacing=1 cellPadding=1 width="260" border=1 align="center">
			<TR height="30" weigth="50">
				<TD colspan="2" align="middle" bgcolor="${title_c}"><STRONG>회원로그인</STRONG></TD>
			</TR>
			<tr height="30">
				<form name="inform" method="post" action="loginPro.do">
					<td width="110" bgcolor="${title_c}" align=center>아이디</td>
					<td width="150" bgcolor="${value_c}" align=center><input
						type="text" name="id" size="15" maxlength="10"></td>
			</tr>
			<tr height="30">

				<td width="110" bgcolor="${title_c}" align=center>패스워드</td>
				<td width="150" bgcolor="${value_c}" align=center><input
					type="password" name="passwd" size="15" maxlength="10"></td>
			</tr>
			<tr height="30">
				<td colspan="3" bgcolor="${title_c}" align="center"><input
					type="submit" name="Submit" value="로그인"> <input
					type="button" value="회원가입"
					onclick="document.location.href='inputForm.do'">
					<input type="button" value="아이디찾기" onclick="document.location.href='researchId.do'">
					<input type="button" value="비밀번호 찾기" onclick="document.location.href='researchPwd.do'">
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
					${sessionScope.memId}님이 <br> 방문하셨습니다
					<form method="post" action="logout.do">
						<input type="submit" value="로그아웃"> 
					</form>
					<form method="post" action="modify.do">
					<input type="submit" value="정보수정">
					</form>
					
				</td>
			</tr>

		</table>
		<br>
	</c:if>
</body>
</html>
