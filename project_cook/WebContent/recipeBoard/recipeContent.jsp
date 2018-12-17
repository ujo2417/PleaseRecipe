<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/view/color.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page import="project.cook.recipeBoardAction.RecipeWriteProAction"%>

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
<title>�Խ���</title>
<link href="../view/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
<!--
function openDelete(userinput) {
   if(userinput.id.value != userinput.mem_id.value){
      alert("������ �ۼ� �� �۸� ���� �� �־��~");
      return;
   }
   //location.href="recipeWriteForm.do";
   else {
      document.location.href='recipeDeleteForm.do?num=${ dto.recipe_num }&pageNum=${ pageNum }'
   }
}

function openUpdate(userinput) {
   if(userinput.id.value != userinput.mem_id.value){
      alert("������ �ۼ� �� �۸� ���� �� �� �־��~");
      return;
   }else {
   document.location.href='recipeUpdateForm.do?num=${ dto.recipe_num }&pageNum=${ pageNum }'
   }
   
}
-->
</script>

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
		
		<form method="post" name="userinput">
			<table class="type09" width="800"align="center">
				<thead>
				<tr>
				
					<th scope="cols" colspan="5" align="center"> <h3><b>${dto.recipe_subject }</b></h3></th>
				
				</tr>
				</thead>
				<tbody>
				<tr height="30">
				
				    <td align="center" width="200">�۹�ȣ</th>
					<td  align="center" width="200">${dto.recipe_num}</th>

					<td align="center" width="200" >��ȸ��</td>
					<td align="center" width="200">${ dto.recipe_readcount }</td>
					
				</tr>
				<tr height="30">
					<td align="center" width="200">��õ��</td>
					<td align="center" width="200">${ dto.recipe_good }</td>

					<td align="center" width="200">���̵�</td>
					<td align="center" width="200">${ dto.mem_id }</td>
				</tr>
				<tr height="30">
					<td align="center" width="200">������</td>
					<td align="center" width="200">${ dto.recipe_subject }</td>
					<td align="center" width="200">�ۼ���</td>
					<td align="center" width="200">${ dto.recipe_date }</td>
				</tr>
				
				
				<tr>
        <td  rowspan="2" colspan="2">
        <div style="cursor:pointer" onclick="go_popup()"> <!-- ================= �˾� ================= -->
        <img src="/project_cook/recipeUpload/${dto.recipe_pic}" border="0" width ="400px" height="250px">
		</div>
        </td>
        
<!-- ================= �˾� ================= -->       
<div id="popup" class="Pstyle">
<span class="b-close">X</span>
<div style="height: auto; width: auto;">			
<img src="/project_cook/recipeUpload/${dto.recipe_pic}" border="0" width="800" >                 
</div>
</div>
<!-- ================= �˾� ================= -->  
        
        <td  colspan="2"><pre><h6>�丮�̸�</h6>${ dto.recipe_title }</pre></td>
    </tr>
    <tr>
        <td colspan="2"><h6>�丮���</h6>${ dto.recipe_material }</td>
    </tr>
    <tr>
        <td  colspan="4"><pre><h6>�丮��</h6>${ dto.recipe_recipe }</pre></td>
    </tr>
    </tbody>
	</table>
	<br>
			<table>
				<input type="hidden" name="id" value="${ sessionScope.memId }">
				<input type="hidden" name="mem_id" value="${dto.mem_id }">

				<tr height="30">
					<td align="center" ><input class="btdesign" type="button"
						value="�ۼ���" onclick="openUpdate(this.form)"></td>
					<td align="center" ><input  class="btdesign" type="button" 
						value="�ۻ���" onclick="openDelete(this.form)"></td>
					<td align="center" ><input class="btdesign"
						type="button" value="��� ����"
						onclick="document.location.href='recipeList.do?pageNum=${ pageNum }'">
					</td>
					<td align="center" >
					<c:if test="${ sessionScope.memId!=null }">
						<%-- <c:if test="${ cbheck!=   }"> --%>
						<input class="btdesign" type="button" value="��õ" onclick="document.location.href='recipeGood.do?pageNum=${ pageNum }&good=${dto.recipe_good }&id=${sessionScope.memId }&recipe_num=${dto.recipe_num }'">
						<!-- <input type="button" value="��õ" onclick="goodCheck(this.form)"> -->
						</c:if>
					</td>
				</tr>
				
			</table>
		</form>
			<br>
		<!-- ������ �ޱ� ���̺� -->
		<form action="recipeReplyOk.do" method="POST" name="reply" onsubmit="">
			<c:if test="${sessionScope.memId !=null }">
				<input type=hidden name="pageNum" value="${ pageNum }">
				<input type=hidden name="num" value="${ dto.recipe_num }">
				<input type=hidden name="id" value="${sessionScope.memId }">
				
				
				<table width="800" border="1" cellspacing="0" cellpadding="0"
					 align="center">
					<tr>
						<td align = "center" height="43px"><b>Comment &nbsp;
                  </b></td>
                  <td  align="left">
						 <input type="text" name=content size= "90"></text><br>
					</td>
						
					<td>
					 <input class="btdesign" type="submit" value="���" algin="left"> <!-- onclick="re_input(this.form)" -->

						</td>
					</tr>

				</table>
			</c:if>
		</form>



		<!-- ������ ��� ���� ���̺�-----------------------------------------------  -->
		<table width="800" border="0.5" cellspacing="0" cellpadding="0"
			 align="center">
			<tr align=center>
				<td colspan=2 bgcolor="dgegeg"><b>REPLY</b></td>

			</tr>

			<c:if test="${ list==null || list.size()==0}">

				<tr>
					<td colspan=2><b>���������̰ų� �Խù��� �����</b></td>
				</tr>
			</c:if>

			<c:forEach var="list" items="${list }">
				<tr>
				<td align="left" >${list.mem_id}   &nbsp;|&nbsp;&nbsp;${list.re_writedate }<br>
                 ${list.re_content }<br><br>
                
               </td>
					<td style = "align:right; valign:center;">
						
							<form name="recipeReplyDel" method="post"
								action="recipeReplyDel.do" onSubmit="return re_del()">
								<!-- PASSWORD -->
								<!-- hidden :  no�� hidden���� �ѱ��� -->
								<input type=hidden name="pageNum" value="${ pageNum }">
								<input type=hidden name="num" value="${ dto.recipe_num }">
								<input type=hidden name="re_num" value="${list.re_num }">
								<input type=hidden name="recipe_num" value="${list.recipe_num }">
								<input type="hidden" name="id" value="${sessionScope.memId }">
								<input type=hidden name="mem_id" value="${list.mem_id }">
								<!-- <input type="password" size=6 name="delPwd"> -->
								<%-- ${sessionScope.memId }
${list.mem_id }
${list.recipe_num } --%>
								<c:if test="${sessionScope.memId == list.mem_id}">
									<input class="btdesign" type="submit" value="����" align="right">
								</c:if>
							</form>
						
					</td>
				</tr>
			</c:forEach>


		</table>

	</center>
	
	<br><br>
</body>
</html>