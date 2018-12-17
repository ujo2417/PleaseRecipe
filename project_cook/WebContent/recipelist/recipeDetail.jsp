<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레시피 검색</title>

<!-- ===================================================================== -->
<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	function go_popup() {
		$('#popup').bPopup();
	};
</script>
<style type="text/css">
.Pstyle {
    opacity: 0;
    display: none;
    position: relative;
    width: auto;
    
    border: 1px solid #fff; 
    padding: 1px;
    background-color: #fff;
}
 
.b-close {
    position: absolute;
    right: 5px;
    top: 5px;
    padding: 5px;
    display: inline-block;
    cursor: pointer;
}
</style>

<!-- ===================================================================== -->

</head>
<body>
   
   <center>
    <c:forEach var="list"  items="${ list }"> 
   <table class="type09" width="800" >
      <thead>
      	<th scope="cols" align="center" colspan="5"><h3><b>${list.recipedb_title}</b></h3>
      </th>
      </thead>
      
  
   	<tbody>
      <tr height="30">
         <td align="center" width="200px" >글번호</td>
         <td align="center" width="200px">${ list.recipedb_num }</td>
         <td align="center" width="200px">조회수</td>   
         <td align="center" width="200px">${ list.recipedb_readcount }</td>
          
      </tr>
      <tr>
      	
      	 <td align="center" width="200px">추천수</td>   
         <td align="center" width="200px">${ list.recipedb_good }</td>
         <td colspan="2" align="center" >
         	<c:if test="${ sessionScope.memId!=null }">
				<input type="button" value="추천" onclick="document.location.href='recipeDBGood.do?pageNum=1&good=${list.recipedb_good }&id=${sessionScope.memId }&recipedb_num=${list.recipedb_num }'">
			</c:if>
		 </td>
      </tr>
      
      
	<tr>
        <td  rowspan="2" colspan="2">
        <div style="cursor:pointer" onclick="go_popup()"> <!-- ================= 팝업 ================= -->
        <img width="400" height="250" src="/project_cook/recipepic/${ list.recipedb_pic }" border="0">
        </div>
<!-- ================= 팝업 ================= -->       
<div id="popup" class="Pstyle">
<span class="b-close">X</span>
<div style="height: auto; width: auto;">			
<img src="/project_cook/recipepic/${ list.recipedb_pic }" border="0" width="800" >                 
</div>
</div>
<!-- ================= 팝업 ================= -->        
       
        </td>
        <td  colspan="2"><pre><h6>요리이름</h6>${ list.recipedb_title }</pre></td>
    </tr>
    <tr>
        <td colspan="2"><h6>요리재료</h6>${ list.recipedb_meterial }</td>
    </tr>
    <tr>
    	<td colspan="4">
        <pre><h6>요리법</h6>${ list.recipedb_recipe }</pre></td>
    </tr>
      </tbody>
   </c:forEach>
   
   </table> 
   <br>
   <input class="btdesign"
						type="button" value="목록 보기"
						onclick="document.location.href='recipeDBList.do?pageNum=${ pageNum }'">
   
    
   </center>
   <br><br> 
   
</body>
</html>