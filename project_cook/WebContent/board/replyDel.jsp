<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../view/color.jsp" %>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리플 달기</title>
</head>
<body>
<form>
<center>

<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr bgcolor="${title_c}"> 
    <td height="39" align="center">
	  <font size="+1" ><b>
	  <c:if test="${check==1 }">
	  댓글이 삭제되었습니다.
	  </c:if>
	  <c:if test="${check==0 }">
	  로그인하세요.
	  </c:if>
	  <c:if test="${check==-1 }">
	  본인이 쓴 댓글이 아닙니다.
	  </c:if>
	  </b></font></td>
  </tr>
  <tr bgcolor="${value_c}">
    <td align="center"> 
      <p>5초 뒤에 게시글로 돌아갑니다.</p>
     
      <meta  http-equiv="Refresh"  content="0; url=content.do?num=${num }&pageNum=${ pageNum }" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="button" value="확인" onClick="document.location.href='content.do?num=${num }&pageNum=${ pageNum }'">
    </td>
  </tr>
</table>


</center>
</form>
</body>
</html>