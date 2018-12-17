<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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

<style type="text/css">
.iddesign {
	color: white;
	font-size: 15px;
	margin-top: 20px;
	font-family: °íµñ;
}

.classname {
	color: white;
	bgcolor: purple;
}




/* .button2 {
	border: 0px solid #ffffff;
	background: #ff0000;
	background: -webkit-gradient(linear, left top, left bottom, from(#1a1818),
		to(#ff0000));
	background: -webkit-linear-gradient(top, #1a1818, #ff0000);
	background: -moz-linear-gradient(top, #1a1818, #ff0000);
	background: -ms-linear-gradient(top, #1a1818, #ff0000);
	background: -o-linear-gradient(top, #1a1818, #ff0000);
	background-image: -ms-linear-gradient(top, #1a1818 0%, #ff0000 100%);
	padding: 4px 5px;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
	-webkit-box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0, inset
		rgba(255, 255, 255, 0.4) 0 1px 0;
	-moz-box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0, inset
		rgba(255, 255, 255, 0.4) 0 1px 0;
	box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0, inset
		rgba(255, 255, 255, 0.4) 0 1px 0;
	text-shadow: #7ea4bd 0 1px 0;
	color: #ffffff;
	font-size: 12px;
	font-family: helvetica, serif;
	text-decoration: none;
	vertical-align: middle;
}

.button2:hover {
	border: 0px solid #000000;
	text-shadow: #1e4158 0 1px 0;
	background: #000000;
	background: -webkit-gradient(linear, left top, left bottom, from(#000000),
		to(#000000));
	background: -webkit-linear-gradient(top, #000000, #000000);
	background: -moz-linear-gradient(top, #000000, #000000);
	background: -ms-linear-gradient(top, #000000, #000000);
	background: -o-linear-gradient(top, #000000, #000000);
	background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	color: #ff0000;
}

.button2:active {
	text-shadow: #1e4158 0 1px 0;
	border: 0px solid #0a3c59;
	background: #65a9d7;
	background: -webkit-gradient(linear, left top, left bottom, from(#3e779d),
		to(#000000));
	background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
	background: -moz-linear-gradient(top, #3e779d, #65a9d7);
	background: -ms-linear-gradient(top, #3e779d, #65a9d7);
	background: -o-linear-gradient(top, #3e779d, #65a9d7);
	background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
	color: #fff;
}
 */
/*------------------------  */
.iddesign {
	color: white;
	font-size: 15px;
	margin-top: 20px;
	font-family: °íµñ;
}

.classname {
	color: white;
	bgcolor: purple;
}
</style>



<header>
	<div class="menu_block">
		<div class="container_12">
			<div class="grid_12">
				<!-- <form id="search" action="#" method="GET">
          <input type="text" name="s">
          <a onClick="document.getElementById('search').submit()"></a>
          <div class="clear"></div>
        </form> -->



				<nav>
					<ul class="sf-menu">
						<li><a href="main.do">Home</a></li>
						<li><a href="list.do">Community</a></li>
						<li><a href="recipeList.do">User Recipe</a></li>
						<li><a href=recipeDBList.do>Recipe</a></li>
						<c:if test="${sessionScope.memId.equals('admin') }">
						<li><a href="AdminMain.do">Admin Page</a></li>
						</c:if>
					</ul>


				</nav>
				<div class="iddesign">
					<c:if test="${empty sessionScope.memId}">

						<div id="iddesign" align="right">


							<form class="iddesign" name="inform" action="loginPro.do"
								method="post" onSubmit="return checkIt()">

								<label class="iddesign"> <input type="text"
									class="fields" name="id" size="10" placeholder="ID" />
								</label> <label> <input type="password" class="fields"
									name="passwd" size="10" placeholder="Password" /> <input
									type="submit" class="button22" name="Submit" value="LOGIN" />&nbsp;&nbsp;&nbsp;

									<input type="button" value="REGIST" class="button22"
									onclick="location.href='inputForm.do'"> &nbsp; <input
									type="button" value="SearchID" class="button22"
									onclick="location.href='researchId.do'"> &nbsp; <input
									type="button" value="SearchPW"  class="button22"
									onclick="location.href='researchPwd.do'"> <!-- <input type="submit" class="classname" name="Submit" value="LOGIN" />&nbsp;&nbsp;&nbsp;
									<a href="inputForm.do">REGIST</a> <a href="researchId.do">SearchID</a>
									<a href="researchPwd.do">SearchPwd</a> -->
								</label>

							</form>
						</div>
					</c:if>

					<c:if test="${!empty sessionScope.memId}">

						<div class="iddesign" align="right">

							<form id="iddesign" name="logout" action="logout.do"
								method="post">

								<b>${sessionScope.memId}´Ô, ·Î±×ÀÎ Áß ÀÔ´Ï´Ù. <br> <a
									href="logout.do">LOGOUT</a> &nbsp;&nbsp; <a
									href="modify.do?id=${sessionScope.memId }">MODIFY</a></b>
							</form>
						</div>
					</c:if>


				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

</header>

