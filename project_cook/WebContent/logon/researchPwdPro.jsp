<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/table.css">
<center>
<c:if test="${bean.mem_passwd !=null}">
	<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39" align="center">
	  <font size="+1" ><b>����� ��й�ȣ�� ${bean.mem_passwd} �Դϴ�.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>5�� �ڿ� ���� �������� ���ư��ϴ�.</p>
     
      <meta  http-equiv="Refresh"  content="5; url=loginForm.do" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="button" class="btdesign" value="Ȯ��" onClick="document.location.href='loginForm.do'">
    </td>
  </tr>
</table>
</c:if>
<c:if test="${bean.mem_passwd == null}">
	<script> 
	  alert("��ġ�ϴ� ������ �����ϴ�.");
      history.go(-1);
	</script>
</c:if>
</center>
<br><br>