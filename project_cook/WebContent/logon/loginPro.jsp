<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:if test="${check==2}">
		<c:set var="memId" value="${id}" scope="session"/>
	    <meta http-equiv="Refresh" content="0;url=AdminMain.do" />
</c:if>


<c:if test="${check==1}">
	<c:set var="memId" value="${id}" scope="session"/>
    <meta http-equiv="Refresh" content="0;url=main.do" />
</c:if>
<c:if test="${check==0}">
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1}">
	<script>
	  alert("���̵� ���� �ʽ��ϴ�..");
	  history.go(-1);
	</script>
</c:if>