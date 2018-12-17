<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<link rel="icon"
	href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="shortcut icon"
	href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/decanter/css/TMGPrototype2.css">
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery-migrate-1.1.1.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/superfish.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/TMGPrototype2.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery.equalheights.js"></script>
<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/style.css">

<script
	src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/table.css">
<html>
<head><title>정보수정</title>

</head>
<body>
 <center>

 <table width="600" class="type09" style = "font-family : 고딕">
    <thead>
    <tr> 
    <th scope="cols" colspan="2" height="39" align="center">
   
       <h3><b>내 정보</b></h3>
       
    </tr>
    </thead>
    <tbody>
    <tr> 
      <th scope="cols" width="200"> 사용자 ID</th>
      <th scope="cols" width="400"> 
        ${member.mem_id }    
      </th>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
       ${firstPw }${pwle }
      </td>
      </tr>
    <tr> 
      <td width="200" ><b>개인정보</b></td>
      <td width="400">&nbsp;</td>
    </tr>  
    <tr> 
      <td width="200">사용자 이름</td>
      <td width="400"> 
       ${member.mem_name}
      </td>
    </tr>
    <tr> 
      <td width="200">E-Mail</td>
      <td width="400"> 
       ${member.mem_email }
      </td>
    </tr>
    <tr> 
      <td width="200"> phone</td>
      <td width="400"> 
        ${member.mem_phone }
      </td>
    </tr>
    </tbody>
  </table>
<br><br><br><br>
 <table width=500 cellpadding="0" cellspacing="0"  align="center" >
   <tr>
     <td>
      <form name="myform" action="modifyForm.do" method="post">
        <INPUT type="hidden" name="id" value="${sessionScope.memId}">
       <INPUT type="submit" value="정보수정" class="btdesign">
      </form>
    </td>
    <td>
      <form name="myform" action="deleteForm.do" method="post">
        <INPUT type="hidden" name="id" value="${sessionScope.memId}">
        <INPUT type="submit" value="회원 탈퇴"  class="btdesign">
      </form>
    </td>
    <td>
    	<form name="myform" action="myBoard.do" method="post">
    		<input type="hidden" name="id" value="${sessionScope.memId}">
        	<INPUT type="submit" value="내 글 보기"  class="btdesign">
      	</form>
    </td>
    <td>
      <form name="myform" action="main.do" method="post">
        <INPUT type="submit" value="메인으로"  class="btdesign">
      </form>
    </td>
   </tr>
   </table>
   
   </center>
</body>
<br><br>
</html>