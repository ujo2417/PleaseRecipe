<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

 <fmt:requestEncoding  value="euc-kr" />
 <form method="post" action="list.do" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr bgcolor="${title_c}"> 
    <td height="39" align="center">
	  <font size="+1" ><b>�Խñ��� �����Ǿ����ϴ�.</b></font></td>
  </tr>
  <tr bgcolor="${value_c}">
    <td align="center"> 
      <p>5�� �ڿ� ������� ���ư��ϴ�.</p>
      <meta  http-equiv="Refresh"  content="0; url=list.do?pageNum=${ pageNum }" >
    </td>
  </tr>
  <tr bgcolor="${value_c}">
    <td align="center"> 
      <input type="submit" value="Ȯ��">
    </td>
  </tr>
</table>
</form>

<%-- <c:if test="cheek == 1" >
	<meta  http-equiv="Refresh"  content="0; url=list.do?pageNum=${ pageNum }" >
</c:if> 

<c:if test="cheek == 0">
	<script type="text/javascript">
	<!--
		alert("��� ��ȣ�� ���� �ʽ��ϴ�.");
	//-->
	</script>
</c:if> --%>
<!-- <br>
<a href="javascript:history.go(-1)">[�ۻ��� ������ ���ư���]</a> -->





