<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>자바스크립트를 활용한 Fade In/Out Slide 예제</title>
    <style type="text/css">
      
        #slidebox { width: 300px; height: 240px; overflow:hidden; }
        #slider { position: relative; list-style: none; margin: 0; padding: 0; }
        #slider li { position: absolute; left: 0; top: 0; width:300px; height:240px; }
        #slider li img { width:300px; height:240px; border: 0;}
    </style>
</head>
<body>
    <div>
        <div id="slidebox">
            <ul id="slider">
                <li>
                    <img src="http://static.webdeveloperskorea.com/images/samples/image1.jpg" alt="image1.jpg" />
                </li>
                <li>
                    <img src="http://static.webdeveloperskorea.com/images/samples/image2.jpg" alt="image2.jpg" />
                </li>
                <li>
                    <img src="http://static.webdeveloperskorea.com/images/samples/image3.jpg" alt="image3.jpg" />
                </li>
                <li>
                    <img src="http://static.webdeveloperskorea.com/images/samples/image4.jpg" alt="image4.jpg" />
                </li>
                <li>
                    <img src="http://static.webdeveloperskorea.com/images/samples/image5.jpg" alt="image5.jpg" />
                </li>
            </ul>
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
 
        //1초마다 Fade In/Out 슬라이드를 반복하는 코드
        var autoslider = setInterval( function(){startSlide('next');}, 1000);
    </script>
</body>
</html>