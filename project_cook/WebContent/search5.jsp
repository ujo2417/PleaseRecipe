<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="icon" href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="shortcut icon" href="${ pageContext.request.contextPath }/decanter/images/favicon.ico">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/decanter/css/TMGPrototype2.css">
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery-migrate-1.1.1.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/superfish.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/TMGPrototype2.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.equalheights.js"></script>
<script src="${ pageContext.request.contextPath }/decanter/js/jquery.easing.1.3.js"></script>

</head>
<body id="listfont">
		<h4><b style="font-family:고딕">레시피 검색</b></h4>
		
	

		<form name="form1" method="post" class="contact_us"
			action="materialSearch.do">
			<p>
				<label> 
					<select name=country>
						<option value="전체">전체</option>
 						<option value="한식">한식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
						<option value="양식">양식</option>
						<option value="기타">기타</option>
					</select>
				</label>
			</p>
			<p>
				<label> <input type="text" class="fields_contact_us"
					name="subject" placeholder="음식 이름을 입력하세요"><br> <input
					type="submit" class="button22" value="Search" />
				</label>
			</p>
		</form>

		<h4><b style="font-family:고딕">재료 검색</b></h4>
		<form name="form2" method="post" class="contact_us"
			action="materialSearch.do">
			<p>
				<label> 
					<select name=country>
						<option value="전체">전체</option>
 						<option value="한식">한식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
						<option value="양식">양식</option>
						<option value="기타">기타</option>
					</select>
				</label>
			</p>
			<p>
				<label> <input type="text" class="fields_contact_us"
					name="material1" placeholder="재료를 입력하세요."> <br>
				<input type="text" class="fields_contact_us" name="material2"
					placeholder="재료를 입력하세요."> <br>
				<input type="text" class="fields_contact_us" name="material3"
					placeholder="재료를 입력하세요."><br> <input type="submit"
					class="button22" value="Search" />
				</label>
			</p>
		</form>

</body>
</html>