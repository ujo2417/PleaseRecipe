<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>


<html>
<head>
<title>게시판</title>


<script type="text/javascript">
<!--
   function openDelete(userinput) {
      if (userinput.id.value != userinput.mem_id.value) {
         alert("본인이 작성 한 글만 지울 수 있어요~");
         return;
      }
      //location.href="writeForm.do";
      else {
         document.location.href = 'boardDeleteForm.do?num=${ bean.free_num }&pageNum=${ pageNum }'
      }
   }

   function openUpdate(userinput) {
      if (userinput.id.value != userinput.mem_id.value) {
         alert("본인이 작성 한 글만 수정 할 수 있어요~");
         return;
      } else {
         document.location.href = 'updateForm.do?num=${ bean.free_num }&pageNum=${ pageNum }'
      }
   }


   -->
</script>
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
</head>

<body >
<div>
   <center>
     
      
      <form method="post" name="userinput">
         <table class="type09" width="800px">
			<thead>
			<tr>
			<th scope="cols" colspan="5" align="center">  <h3><b>상세보기</b></h3><br></th>
			</tr>
			</thead>
			<tbody>
            <tr height="30">
               <td scope="cols" width="200px" align="center" >글번호</td>
               <td scope="cols" width="200px"align="center" >${ bean.free_num }</td>

               <td scope="cols" width="200px" align="center">조회수</th>
               <td scope="cols" width="200px" align="center">${ bean.free_readcount }</td>
            </tr>
            
            <tr height="30">
               <td align="center" >아이디</td>
               <td align="center">${ bean.mem_id }</td>

               <td align="center">작성일</td>
               <td align="center">${ bean.free_date }</td>
            </tr>
            <tr height="30">
               <td align="center">글제목</td>
               <td colspan="3">${ bean.free_subject }</td>

            </tr>
            <tr>
           
            <td colspan="4" height = "200"><pre>${ bean.free_content }</pre></td>
          
            </tr>
            <input type="hidden" name="id" value="${ sessionScope.memId }">
            <input type="hidden" name="mem_id" value="${bean.mem_id }">

            <tr height="30">
               <td align="center" >
               <c:if test="${ sessionScope.memId == bean.mem_id}">
                     <input class="btdesign" type="button" value="수정" onclick="openUpdate(this.form)">
                  </c:if></td>
               <td align="center""><c:if
                     test="${ sessionScope.memId == bean.mem_id}">
                     <input type="button"  class="btdesign" value="삭제" onclick="openDelete(this.form)">
                  </c:if></td>
               <td colspan="2" align="center"><input class="btdesign" type=  "button" value="목록" 
                  onclick="document.location.href='list.do?pageNum=${ pageNum }'">
               </td>
            </tr>
		</tbody>
         </table>
      </form>

<br>
      <!-- 꼬리말 달기 테이블 -->
      <form action="replyOk.do" method="POST" name="reply">
         <c:if test="${sessionScope.memId !=null }">
            <input type=hidden name="pageNum" value="${ pageNum }">
            <input type=hidden name="num" value="${ bean.free_num }">
            <input type=hidden name="id" value="${sessionScope.memId }">
            <table width="800" border="1" cellspacing="0" cellpadding="0" style="border: 1px solid #DCE3ED; border-width: 1px 1px 1px 1px" >
               <tr>
                  <td align = "center" height="43px"><b> <br>Comment &nbsp;
                  </b></td>
                  <td colspan=3 align="left">&nbsp;
                     &nbsp;&nbsp;&nbsp;<br>
                     <input type="text" name=content size= "90"></text><br>
					</td>
                     <td>
                      <br><input type="submit"  value="등록" class="btdesign"> <!-- onclick="re_input(this.form)" -->

                  </td>
               </tr>

            </table>
         </c:if>
      </form>
     
      <!-- 꼬리말 목록 보기 테이블  -->
      
      <table width="800" border="1" cellspacing="0" cellpadding="0"  >
         <tr align=center>
            <td colspan=2 bgcolor="dgegeg"><b>REPLY</b></td>

         </tr>

         <c:if test="${ list==null || list.size()==0}">

            <tr>
               <td  align=center colspan=2><b>서버오류이거나 게시물이 없어요</b></td>
            </tr>
         </c:if>

         <c:forEach var="list" items="${list }">
            <tr>
               <td align="left">${list.mem_id}   &nbsp;|&nbsp;&nbsp;${list.re_writedate }<br>
                 ${list.re_content }<br><br>
                 
               </td>
               <td style = "align:right; valign:center;">
                  
                     <form name="replyDel" method="post" action="replyDel.do">
                        <!-- PASSWORD -->
                        <!-- hidden :  no를 hidden으로 넘기자 -->
                        <input type="hidden" name="pageNum" value="${ pageNum }">
                        <input type="hidden" name="num" value="${ bean.free_num }">
                        <input type="hidden" name="re_num" value="${list.re_num }">
                        <input type="hidden" name="free_num" value="${list.free_num }">
                        <input type="hidden" name="id" value="${sessionScope.memId }">
                        <input type="hidden" name="mem_id" value="${list.mem_id }">
                        <!-- <input type="password" size=6 name="delPwd"> -->
                        <%-- ${sessionScope.memId }
${list.mem_id }
${list.free_num } --%>
                        <c:if test="${sessionScope.memId == list.mem_id}">
                           <input class="btdesign" type="submit" value="삭제">
                        </c:if>
                     </form>
              
               </td>
            </tr>
         </c:forEach>


      </table>
      
      
   </center>
   </div>
   <br><br><br>
</body>
</html>