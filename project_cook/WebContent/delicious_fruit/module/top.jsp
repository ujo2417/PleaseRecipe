<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title></title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/delicious_fruit/style.css" />
<script language="javascript">
<!--
	function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if (!document.myform.id.value) {
			alert("ÀÌ¸§À» ÀÔ·ÂÇÏÁö ¾ÊÀ¸¼Ì½À´Ï´Ù.");
			document.myform.id.focus();
			return false;
		}
		if (!document.myform.passwd.value) {
			alert("ºñ¹Ð¹øÈ£¸¦ ÀÔ·ÂÇÏÁö ¾ÊÀ¸¼Ì½À´Ï´Ù.");
			document.myform.passwd.focus();
			return false;
		}

	}
	-->

</script>

</head>

<body>
	<div>
		<div id="slidebox"
			style="margin-left: 10px; position: relative; float: left">
			<ul id="slider">

				
				<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/2.jpg"
					alt="image2.jpg" /></li>
				<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/3.jpg"
					alt="image3.jpg" /></li>
				<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/4.jpg"
					alt="image4.jpg" /></li>
				<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/5.jpg"
					alt="image5.jpg" /></li>
					
					<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/6.jpg""
					alt="image6.jpg" /></li>
					
					<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/6.jpg""
					alt="image6.jpg" /></li>
					
					
					<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/7.jpg""
					alt="image7.jpg" /></li>
					
					
					<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/8.jpg""
					alt="image8.jpg" /></li>
					
					<li><img
					src="${ pageContext.request.contextPath }/delicious_fruit/images/9.jpg""
					alt="image9.jpg" /></li>
					
					

			</ul>




		</div>
	</div>


	<div id= "container">

		<div id="header">

			<div id="header_left">
				<h1>
					Take care of <span class="red"><br>the refrigerator</span>
				</h1>
				<!-- <h2>³ÃÀå°í¸¦ ºÎÅ¹ÇØ</h2> -->
			</div>


			<!-- ------------------------------------------------------------------------------------- -->
			<c:if test="${empty sessionScope.memId}">

				<div id="header_right">
					<p class="welcome">
						Welcome, Guest. Please login or <a href="inputForm.do">register</a>
					</p>

					<form id="form1" name="inform" action="loginPro.do" method="post"
						onSubmit="return checkIt()">
						<p>
							<label>User name
							<input type="text" class="fields" name="id" />
							</label>
							
							<label>Password 
							<input type="password" class="fields" name="passwd" />
							
							<input type="button" class="submit_button" name="regist" value="Regist"
								onclick="document.location.href='inputForm.do'">
								 
							<INPUT type=reset class="submit_button" value="Reset">
						    <input type="submit" class="submit_button" name="Submit" value="Login" />
							
							<br>
							<input type="button" class="submit_button" value="pass search" onclick="document.location.href='researchPwd.do'">
							<input type="button" class="submit_button" value="id search" onclick="document.location.href='researchId.do'">
							</label>
						</p>
					</form>
				</div>
			</c:if>

			<c:if test="${!empty sessionScope.memId}">

				<div id="header_right">
					<p class="welcome1">Welcome, ${sessionScope.memId}
					<form id="form11" name="logout" action="logout.do" method="post">

						<label><b><ab>${sessionScope.memId}´ÔÀÌ ·Î±×ÀÎÁßÀÔ´Ï´Ù.</ab> <br>
							<br><br><br><br><br>
							 <a href="logout.do">Logout</a> &nbsp;&nbsp;&nbsp; <!-- <a
								href="modify.do">Modify</a> --></b> </label>
					</form>
					<form id="form11" name="modify" action="modify.do" method="post">
					<input type="hidden" name="id" value="${sessionScope.memId}">
					<input type="submit" value="modify">
					</form>
					
				</div>
			</c:if>
		</div>
	</div>


	<script type="text/javascript">
var slider = document.getElementById("slider");
var slideArray = slider.getElementsByTagName("li");
var slideMax = slideArray.length - 1;
var curSlideNo = 0;
var nextSlideNo =null;
var fadeStart = false;
var curSlideLevel = 1;
var nextSlideLevel = 0;

for (i = 0; i <= slideMax; i++) {
    if (i == curSlideNo) changeOpacity(slideArray[i], 1);
    else changeOpacity(slideArray[i], 0);
}

function startSlide(dir)
{
    if (fadeStart === true) return;
    if( dir == "prev" ) 
    {
        nextSlideNo = curSlideNo - 1;
        if ( nextSlideNo < 0 ) nextSlideNo = slideMax;
    }
    else if( dir == "next" ) 
    {
        nextSlideNo = curSlideNo + 1;
        if ( nextSlideNo > slideMax ) nextSlideNo = 0;
    }
    else
    {
        fadeStart = false;
        return;
    }
    fadeStart = true;
    changeOpacity(slideArray[curSlideNo], curSlideLevel);
    changeOpacity(slideArray[nextSlideNo], nextSlideLevel);
    fadeInOutAction(dir);
}

function fadeInOutAction(dir)
{
    curSlideLevel = curSlideLevel - 0.1;
    nextSlideLevel = nextSlideLevel + 0.1;
    if( curSlideLevel <= 0 ) 
    {
        changeOpacity(slideArray[curSlideNo], 0);
        changeOpacity(slideArray[nextSlideNo], 1);
        if(dir == "prev")
        {
            curSlideNo = curSlideNo - 1;
            if (curSlideNo < 0) curSlideNo = slideMax;
        }
        else
        {
            curSlideNo = curSlideNo + 1;
            if (curSlideNo > slideMax) curSlideNo = 0;
        }
        curSlideLevel = 1;
        nextSlideLevel = 0;
        fadeStart = false;
        return;
    }
    changeOpacity(slideArray[curSlideNo], curSlideLevel);
    changeOpacity(slideArray[nextSlideNo], nextSlideLevel);
    setTimeout(function () {
        fadeInOutAction(dir);
    }, 100);
}

function changeOpacity(obj,level) 
{
    obj.style.opacity = level; 
    obj.style.MozOpacity = level; 
    obj.style.KhtmlOpacity = level;
    obj.style.MsFilter = "'progid:DXImageTransform.Microsoft.Alpha(Opacity=" + (level * 100) + ")'";
    obj.style.filter = "alpha(opacity=" + (level * 100) + ");"; 
}

//1ÃÊ¸¶´Ù Fade In/Out ½½¶óÀÌµå¸¦ ¹Ýº¹ÇÏ´Â ÄÚµå
var autoslider = setInterval( function(){startSlide('next');}, 3000);

</script>
</body>
</html>

<!-- top.jsp end -->