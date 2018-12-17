<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="shortcut icon" href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/TMGPrototype2.css">
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery-migrate-1.1.1.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/superfish.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/TMGPrototype2.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.equalheights.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>
<title>요리 레시피 공유 사이트</title></head>
<body >

<div>
        <jsp:include page="module/top.jsp" flush="false" />
</div>

   <div> 
        <jsp:include page="module/center.jsp" flush="false" />
</div>
<div>
        <jsp:include page="module/footer.jsp" flush="false" />  
          
  </div>



</body>
</html>