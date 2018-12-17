<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<head>



<title>회원정보수정</title>



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
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/button.css"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/table.css"/>

<script language="JavaScript">
<!--
   function checkIt() {
      var userinput = eval("document.userinput");

      if (!userinput.passwd.value) {
         alert("비밀번호를 입력하세요");
         return false;
      }
      if (userinput.passwd.value != userinput.passwd2.value) {
         alert("비밀번호를 동일하게 입력하세요");
         return false;
      }

      if (!userinput.username.value) {
         alert("사용자 이름을 입력하세요");
         return false;
      }
      if (!userinput.jumin1.value || !userinput.jumin2.value) {
         alert("주민등록번호를 입력하세요");
         return false;
      }
   }
   -->
</script>
<body>
<center>
   <form method="post" action="modifyPro.do" name="userinput"
      onsubmit="return checkIt()">

      <table class="type09" width="600">
         <thead>
         <tr>
            <th scope="cols" colspan="2" height="39" align="center">
               <h3><b>회원 정보수정</b></h3>
            </th>
         </tr>
         </thead>
         <tbody>
         <tr>
            <td colspan="2" class="normal" align="center">회원의 정보를 수정합니다.</td>
         </tr>
         <tr>
            <td width="200" bgcolor="${value_c}"><b>아이디 입력</b></td>
            <td width="400" bgcolor="${value_c}">&nbsp;</td>
         <tr>
         <tr>
            <td width="200">사용자 ID</td>
            <td width="400">${member.mem_id}</td>
            <input type="hidden" name="id" value="${sessionScope.memId}">
         </tr>

         <tr>
            <td width="200">비밀번호</td>
            <td width="400"><input type="password" name="passwd" size="10"
               maxlength="10" value="${member.mem_passwd}"></td>
         <tr>
         <tr>
            <td width="200" bgcolor="${value_c}"><b>개인정보 입력</b></td>
            <td width="400" bgcolor="${value_c}">&nbsp;</td>
         <tr>
         <tr>
            <td width="200">사용자 이름</td>
            <td width="400"><input type="text" name="name" size="15"
               maxlength="20" value="${member.mem_name}"></td>
         </tr>
         <tr>
            <td width="200">E-Mail</td>
            <td width="400"><input type="text" name="email" size="40"
               maxlength="30" value="${member.mem_email}"></td>
         </tr>
         <tr>
            <td width="200">전화번호</td>
            <td width="400"><input type="text" name="phone" size="40"
               maxlength="30" value="${member.mem_phone}"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input
               type="submit" name="modify" value="수   정" class="btdesign"> <input
               type="button" value="취  소" 
               onclick="document.location.href='main.do'" class="btdesign"></td>
         </tr>
         </tbody>
      </table>

   </form>
   </center>
   <br><br>
</body>
</html>
