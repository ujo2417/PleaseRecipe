<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
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
<title>���� �۾���</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
 
<script>
$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),
        img: null,
        w: 200,
        h: 200
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
 
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image ���ϸ�
            if (!inputFile.files[0].type.match(/image\//)) return;
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    img.style.width  = defaultOpt.w+'px';
                    img.style.height = defaultOpt.h+'px';
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
 
            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
            img.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
 
 
$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),
        w: 200,
        h: 200
    };
 
    $('#input_file').setPreview(opt);
});
</script>

</head>

<!-- �亯���� ��� : �θ���� �۹�ȣ, �׷�ȭ��ȣ, �׷�ȭ���� ����, �鿩����  
		<=== content.jsp ���������� �Ѿ��.....
-->
<body>
	<center>
		<h3><b>�� �����ϱ�</b></h3>
	</center>
	<br>
	<form action="recipeDBUpdatePro.do?pageNum=${ pageNum }" method="post" name="updateForm" enctype="multipart/form-data" >

		<table >


			<tr>
				<td width="100" align="center">no</td>
				<td width="100">${dto.recipeDB_num }</td>
				<input type="hidden" name="recipeDB_num" value="${dto.recipeDB_num }">
				</td>
				<td width="100" bgcolor="${ value_c }" align="center">�丮 �̸�</td>
				<td width="500"><input type="text" size="40" maxlength="50"
					name="recipeDB_title" value="${ dto.recipeDB_title }"></td>
			
				
			</tr>

	<tr>
		<td width="70" align = "center">����</td>
		<td width="500" colspan="3">
			<input type="radio" name="recipeDB_country" value="�ѽ�">�ѽ�
			<input type="radio" name="recipeDB_country" value="�߽�">�߽�
			<input type="radio" name="recipeDB_country" value="�Ͻ�">�Ͻ�
			<input type="radio" name="recipeDB_country" value="���">���
			<input type="radio" name="recipeDB_country" value="��Ÿ">��Ÿ
		</td>
	</tr>

			<tr>
				<td width="70" bgcolor="${ value_c }" align="center">�� ��</td>
				<td width="330" colspan="3"><textarea rows="10" style="width: 500px; max-width: 500px;"
					name="recipeDB_meterial" >${ dto.recipeDB_meterial }</textarea></td>
			</tr>

			<!--  --------------------------------------------------------------------------------------------- -->

			<tr>
				<td width="70" bgcolor="${ value_c }" align="center">�丮��</td>
				<td width="330" colspan="3"><textarea rows="15" cols="400" name = "recipeDB_recipe" style="width: 500px; max-width: 500px;">
				${ dto.recipeDB_recipe }
				</textarea>
				</td>
			</tr>

		<tr>
		<td align="center">�丮����</td>
		<%-- <td colspan="3" align="center" width="125" height="100"">
		<img src="/project_cook/recipeDBUpload/${dto.recipeDB_pic}" border="0">1<br>
			<img src="recipeDBUpload/${dto.recipeDB_pic}" border="0" width="300"><br>	
			�̹������� �̸� : ${dto.recipeDB_pic}
		</td> --%>
		
		<td colspan="3" align="center" width="125" height="100"">
		
		<img src="recipepic/${dto.recipeDB_pic}" id="img_preview" width ="100"><br>
		<%-- <img src="recipeDBUpload/${dto.recipeDB_pic}" id="img_preview" style="display:none;"/> --%>
		<input type="file" id="input_file" name="recipeDB_pic" />
		<c:if test="${recipeDB_pic == null}">
    	    <input type="hidden" name="recipeDB_pic" value="${dto.recipeDB_pic}">
        </c:if>
		
		
		
		</td>
		
		</tr>



			<tr>
				<td align="center" colspan="5" bgcolor="${ value_c }"><input
					type="submit" value="�ۼ���"> <input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���"
					onclick="location.href='AdminDBList.do?pageNum=${ pageNum }'">
			</tr>
		</table>

	</form>
</body>
</html>