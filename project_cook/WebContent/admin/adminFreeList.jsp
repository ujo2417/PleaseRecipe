<%@ page import="project.cook.boardBean.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"  errorPage="../error/404code.jsp" %>
   
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ include file="../view/color.jsp"%>

<html>
<head>
<!-- <script type="text/javascript">
      
      function openSearch() {
         if(search.subject.value==""){
            alert("검색어를 입력하세요.");
            return;
         }
      }
      
   </script> -->
<title>게시판</title>
</head>
<link href="../view/mystyle.css" rel="stylesheet" type="text/css">
<body bgcolor="${ bodyback_c }">

   <table width="600" border="0" cellpadding="0" cellspacing="0"
      align="center">
      <tr height="60" bgcolor="${ value_c }">
         
         <td colspan="2" align="center" width="300">제 목</td>
         <td align="center" width="80">아이디</td>
         <td align="center" width="70">작성일</td>
         <td align="center" width="50">조회수</td>
  		 <td align="center" width="30">관리</td>
         
      </tr>
   <c:forEach var="list"  items="${ list }">          
  <tr>
   <td colspan="2" align="center" width="300">
     <a    href="content.do?num=${list.free_num }&pageNum=1">
               ${ list.free_subject }</a> 
   
         </td>
         <td align="center" width="80">${ list.mem_id }</td>
         <td align="center" width="70">${ list.free_date }</td>
         <td align="center" width="50">${ list.free_readcount }</td>
         <td align="center" width="30">
         <form action="AdminFreeDelete.do" >
         <input type="hidden" name="free_num" value="${list.free_num }">
         <input type="submit" value="삭제">
         </form>
         </td>
      </tr>
   </c:forEach>
   </table>
   <!-- <table >
      <tr>
         <td>
            <form action="freeSearch.do" name="search" onSubmit="return openSearch()">
            <input type="text" name="subject" placeholder="제목을 검색 하세요">
            <input type="submit" value="검색">
         </form>
         </td> 
      </tr>
</table> -->
      </center>

</h6>
</body>

</html>