<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/table.css">
<center>
<c:if test="${bean.mem_passwd !=null}">
	<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39" align="center">
	  <font size="+1" ><b>당신의 비밀번호는 ${bean.mem_passwd} 입니다.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>5초 뒤에 메인 페이지로 돌아갑니다.</p>
     
      <meta  http-equiv="Refresh"  content="5; url=loginForm.do" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="button" class="btdesign" value="확인" onClick="document.location.href='loginForm.do'">
    </td>
  </tr>
</table>
</c:if>
<c:if test="${bean.mem_passwd == null}">
	<script> 
	  alert("일치하는 정보가 없습니다.");
      history.go(-1);
	</script>
</c:if>
</center>
<br><br>