<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../view/color.jsp" %>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �ޱ�</title>
</head>
<body>
<form>
<center>

<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr bgcolor="${title_c}"> 
    <td height="39" align="center">
	  <font size="+1" ><b>
	  <c:if test="${check==1 }">
	  ����� �����Ǿ����ϴ�.
	  </c:if>
	  <c:if test="${check==0 }">
	  �α����ϼ���.
	  </c:if>
	  <c:if test="${check==-1 }">
	  ������ �� ����� �ƴմϴ�.
	  </c:if>
	  </b></font></td>
  </tr>
  <tr bgcolor="${value_c}">
    <td align="center"> 
      <p>5�� �ڿ� �Խñ۷� ���ư��ϴ�.</p>
     
      <meta  http-equiv="Refresh"  content="0; url=content.do?num=${num }&pageNum=${ pageNum }" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="button" value="Ȯ��" onClick="document.location.href='content.do?num=${num }&pageNum=${ pageNum }'">
    </td>
  </tr>
</table>


</center>
</form>
</body>
</html>