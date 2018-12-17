<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="600" border="0" cellpadding="0" cellspacing="0"
      align="center">
      <tr height="60" bgcolor="${ value_c }">
         <td align="center" width="80">이름</td>
         <td align="center" width="70">아이디</td>
         <td align="center" width="30">전화번호</td>
           <td align="center" width="30">이메일</td>
           <td align="center" width="30">생성 날짜</td>
           <td align="center" width="30">회원 관리</td>
      </tr>
   <c:forEach var="list"  items="${ list }">          
   
    <tr height="60" bgcolor="${ value_c }">
        <td align="center" width="80">${list.mem_name }</td>
        <td align="center" width="80">${list.mem_id }</td>
        <td align="center" width="80">${list.mem_phone }</td>
        <td align="center" width="80">${list.mem_email }</td>
        <td align="center" width="80">${list.reg_date }</td>
        <td><form action="AdminMemberDelete.do" method="post">
    		<input type="hidden" name="mem_id" value="${list.mem_id }">
    		<input type="hidden" name="mem_passwd" value="${list.mem_passwd }">
    		<input type="submit" value="회원 삭제">
    	</form></td>
    </tr>
    
    	
    
   </c:forEach>
   </table>
</body>
</html>