<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

 <fmt:requestEncoding  value="euc-kr" />

<center>
<form method="post" action="list.do" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39" align="center">
	  <font size="+1" ><b>게시글이 수정되었습니다.</b></font></td>
  </tr>
  <tr>
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
</center>

<br>


