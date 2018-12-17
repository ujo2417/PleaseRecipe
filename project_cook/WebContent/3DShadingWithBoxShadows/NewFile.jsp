<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="euc-kr" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>3D Shading with Box-Shadows</title>
		<meta name="description" content="A shading effect for 3D transformed elements" />
		<meta name="keywords" content="css3, transforms, shadow, shading, 3d, box shadow" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/MultiLevelPushMenu/"><span>Previous Demo</span></a>
				<span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=16316"><span>Back to the Codrops Article</span></a></span>
			</div>
			<header>
				<h1>3D Shading with Box-Shadows <span>A shading effect for 3D transformed elements</span></h1>  
			</header>
			<div class="wrapper">
				<ul class="stage clearfix">

					<li class="scene">
						<div class="movie" onclick="return true">
							<div class="poster"><img src="${ pageContext.request.contextPath }/3DShadingWithBoxShadows/img/111.jpg"></div>
							<div class="info">
								<header>
									<h1>It's a Wonderful Food</h1>
									<span class="year">양식</span>
									<span class="rating"></span>
									<span class="duration"></span>
								</header>
								<p>
									In Bedford Falls, New York on Christmas Eve, George Bailey is deeply troubled. Prayers for his well-being from friends and family reach Heaven. Clarence Odbody, Angel Second Class, is assigned to visit Earth to save George, thereby earning his wings. Franklin and Joseph, the head angels, review George's life with Clarence.
								</p>
							</div>
						</div>
					</li>

					
				</ul>
			</div><!-- /wrapper -->
		</div><!-- /container -->
	</body>
</html>