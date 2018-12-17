<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

 <fmt:requestEncoding  value="euc-kr" />
 <form method="post" action="list.do" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr bgcolor="${title_c}"> 
    <td height="39" align="center">
	  <font size="+1" ><b>게시글이 삭제되었습니다.</b></font></td>
  </tr>
  <tr bgcolor="${value_c}">
    <td align="center"> 
      <p>5초 뒤에 목록으로 돌아갑니다.</p>
      <meta  http-equiv="Refresh"  content="0; url=list.do?pageNum=${ pageNum }" >
    </td>
  </tr>
  <tr bgcolor="${value_c}">
    <td align="center"> 
      <input type="submit" value="확인">
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
		alert("비밀 번호가 맞지 않습니다.");
	//-->
	</script>
</c:if> --%>
<!-- <br>
<a href="javascript:history.go(-1)">[글삭제 폼으로 돌아가기]</a> -->





