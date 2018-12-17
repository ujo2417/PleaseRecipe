<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>


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
            alert("ID�� �Է��ϼ���");
            return false;
        }
        
        if(!userinput.passwd.value ) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }else if(userinput.passwd.value.length <6){
        	alert("��й�ȣ 6�ڸ� �̻� �Է��ϼ���.");
        	return false;
        }
        if(userinput.passwd.value != userinput.passwd2.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }
       
        if(!userinput.name.value) {
            alert("����� �̸��� �Է��ϼ���");
            return false;
        }
        if(!userinput.email.value) {
            alert("�̸����� �Է��ϼ���");
            return false;
        }
        
        if(!userinput.phone.value) {
            alert("��ȭ��ȣ�� �Է��ϼ���");
            return false;
        }else if(userinput.phone.value.length <10){
        	alert("��ȭ��ȣ�� 10 �Ǵ� 11�ڸ� �Դϴ�.");
        	return false;
        }else if(userinput.phone.value.length >11){
        	alert("��ȭ��ȣ�� 10 �Ǵ� 11�ڸ� �Դϴ�.");
        	return false;
        }
        
        
        if(userinput.check.value == 1){
        	alert("���̵� �ߺ� Ȯ�� �ϼ���");
        	return false;
        }
      
    }

    // ���̵� �ߺ� ���θ� �Ǵ�
    function openConfirmid(userinput) {
        // ���̵� �Է��ߴ��� �˻�
        if (userinput.id.value == "") {
            alert("���̵� �Է��ϼ���");
            return;
        }
        // url�� ����� �Է� id�� �����մϴ�.
        document.location.href = "confirmId.do?id=" + userinput.id.value ;
        
        // ���ο� �����츦 ���ϴ�.
          }
</script>


<body>
<center>
<form method="post" action="inputPro.do" name="userinput" onSubmit="return checkIt()">
  
  <table class="type09" style = "font-family : ���">
    <tr>
    <thead> 
    <th scope="cols" colspan="2" height="39" align="center"  >
   
       <h3><b>ȸ������</b></h3></th>
       
    </tr>
    </thead>
    <tr> 
      <td width="200" bgcolor="${value_c}"><b>���̵� �Է�</b></td>
      <td width="400" bgcolor="${value_c}">&nbsp;</td>
   
    </tr>  

    <tr> 
      <td width="100"> ����� ID</td>
      <td width="500"> 
      	<c:if test="${check == -1 }">
        	<c:set var="checkid" value="${id }"/>
        </c:if>
        <c:if test="${check == 1 }">
        	<c:set var="checkid" value=""/>
        </c:if>
        <input type="text" name="id" size="10" maxlength="12" value="${checkid}">
        <input class="btdesign1" type="button" name="confirm_id" value="Check" OnClick="openConfirmid(this.form)" >
     	   <c:if test="${check == -1}"> <font size="1" color="red">${id}��(��) ����Ͻ� �� �ִ� ���̵� �Դϴ�.</c:if>
     	   <c:if test="${check == 1}"> <font size="1" color="red">${id}��(��) ����Ͻ� �� ���� ���̵� �Դϴ�.</c:if>
     	   <input type="hidden" value="${check }" name="check">
      </td>
    </tr>
    <tr> 
      <td width="100"> ��й�ȣ</td>
      <td width="500" > 
        <input type="password" name="passwd" size="15" maxlength="12"><font size="1" color="red">��й�ȣ 6�ڸ� �̻� �Է�</font>
      </td>
      </tr>
    <tr>  
      <td width="100">��й�ȣ Ȯ��</td>
      <td width="500"> 
        <input type="password" name="passwd2" size="15" maxlength="12">
      </td>
    </tr>
    <tr></tr>
    <tr> 
      <td width="100" bgcolor="${value_c}"><b>�������� �Է�</b></td>
      <td width="500" bgcolor="${value_c}">&nbsp;</td>
    </tr>  
    <tr> 
      <td width="100">����� �̸�</td>
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
        <input type="text" name="phone" size="30" maxlength="50"><font size=1 color="red">10�Ǵ� 11 �ڸ��Դϴ�.</font>
        <br><font size=1 color="red">(-)����</font>
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