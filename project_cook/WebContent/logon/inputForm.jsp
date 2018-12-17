<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>


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
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.passwd.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }else if(userinput.passwd.value.length <6){
        	alert("비밀번호 6자리 이상 입력하세요.");
        	return false;
        }
        if(userinput.passwd.value != userinput.passwd2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.name.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        if(!userinput.email.value) {
            alert("이메일을 입력하세요");
            return false;
        }
        
        if(!userinput.phone.value) {
            alert("전화번호를 입력하세요");
            return false;
        }else if(userinput.phone.value.length <10){
        	alert("전화번호는 10 또는 11자리 입니다.");
        	return false;
        }else if(userinput.phone.value.length >11){
        	alert("전화번호는 10 또는 11자리 입니다.");
        	return false;
        }
        
        
        if(userinput.check.value == 1){
        	alert("아이디 중복 확인 하세요");
        	return false;
        }
      
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        document.location.href = "confirmId.do?id=" + userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
          }
</script>


<body>
<center>
<form method="post" action="inputPro.do" name="userinput" onSubmit="return checkIt()">
  
  <table class="type09" style = "font-family : 고딕">
    <tr>
    <thead> 
    <th scope="cols" colspan="2" height="39" align="center"  >
   
       <h3><b>회원가입</b></h3></th>
       
    </tr>
    </thead>
    <tr> 
      <td width="200" bgcolor="${value_c}"><b>아이디 입력</b></td>
      <td width="400" bgcolor="${value_c}">&nbsp;</td>
   
    </tr>  

    <tr> 
      <td width="100"> 사용자 ID</td>
      <td width="500"> 
      	<c:if test="${check == -1 }">
        	<c:set var="checkid" value="${id }"/>
        </c:if>
        <c:if test="${check == 1 }">
        	<c:set var="checkid" value=""/>
        </c:if>
        <input type="text" name="id" size="10" maxlength="12" value="${checkid}">
        <input class="btdesign1" type="button" name="confirm_id" value="Check" OnClick="openConfirmid(this.form)" >
     	   <c:if test="${check == -1}"> <font size="1" color="red">${id}은(는) 사용하실 수 있는 아이디 입니다.</c:if>
     	   <c:if test="${check == 1}"> <font size="1" color="red">${id}은(는) 사용하실 수 없는 아이디 입니다.</c:if>
     	   <input type="hidden" value="${check }" name="check">
      </td>
    </tr>
    <tr> 
      <td width="100"> 비밀번호</td>
      <td width="500" > 
        <input type="password" name="passwd" size="15" maxlength="12"><font size="1" color="red">비밀번호 6자리 이상 입력</font>
      </td>
      </tr>
    <tr>  
      <td width="100">비밀번호 확인</td>
      <td width="500"> 
        <input type="password" name="passwd2" size="15" maxlength="12">
      </td>
    </tr>
    <tr></tr>
    <tr> 
      <td width="100" bgcolor="${value_c}"><b>개인정보 입력</b></td>
      <td width="500" bgcolor="${value_c}">&nbsp;</td>
    </tr>  
    <tr> 
      <td width="100">사용자 이름</td>
      <td width="500"> 
        <input type="text" name="name" size="15" maxlength="10">
      </td>
    </tr>
    <tr> 
      <td width="100">E-Mail</td>
      <td width="500"> 
        <input type="email" name="email" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td width="100"> phone</td>
      <td width="500"> 
        <input type="text" name="phone" size="30" maxlength="50"><font size=1 color="red">10또는 11 자리입니다.</font>
        <br><font size=1 color="red">(-)생략</font>
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center" bgcolor="${value_c}"> 
          <input class="btdesign" type="submit" name="confirm" value="Regist" >
          <input class="btdesign" type="reset" name="Reset" value="Reset">
          <input class="btdesign" type="button" value="Cancle" onclick="document.location.href='main.do'">
      </td>
    </tr>
  </table>
</form>
</center>
<br><br>
</body>
</html>