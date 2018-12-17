<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>

<head>
<title>����� ��Ź��</title>
<meta charset="euc-kr">
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
<script>
$(window).load(function () {
    $('#TMGPrototype2').TMGPrototype2({});
});
</script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>
<body class="page1">


<div id="TMGPrototype2">
<div id="searchMenu"  style="width:200px; height:200px; position:absolute; left:900px; top:90px; z-index:1;"><jsp:include page="../search5.jsp" flush="false"/></div>
  

  <ul class='sets'>
   
    <li data-setName="BEST Recipe">
      <ul>
   <c:forEach var="list"  items="${ list }"> 
        <li data-srcPreview="/project_cook/recipepic/${ list.recipedb_pic }" >
         
          <div>
            <div class="content" onclick="location.href='recipeDB.do?num=${list.recipedb_num }&pageNum=1'"> 
           
            <%-- <a href="recipeDB.do?num=${list.recipedb_num }&pageNum=1"> --%>
            
            <img src="/project_cook/recipepic/${ list.recipedb_pic }" width="450px" height="250px" > 
           
           
              
              <p></p>
            	<ul>
            <%--   	${list.recipedb_meterial } --%>
                <li><span></span><h4><b>${list.recipedb_title }</b></h4></li>
                <li><span>��õ�� : </span>${list.recipedb_good }</li>
                <li> <div class="alright"><a href="#" class="btn">Read More</a></div></li>
                <li><span></span> </li>
                <li><span></span> </li>
                
              </ul>
             
            </div>
          </div>
           
        </li>
        
        </c:forEach>
        
      </ul>  <!-- today recipe -->
    </li>
    
     <!-- �ѽ� end -->
    
    <li data-setName="TODAY'S Recipe">
      <ul>
       
        <li data-srcPreview="${ pageContext.request.contextPath }/decanter/images/bbig7.jpg">
          <div>
            <div class="content" onclick="location.href='recipeDB.do?num=43&pageNum=1'"> 
            <img src="${ pageContext.request.contextPath }/decanter/images/bbig7.jpg" width="180px", height="180px" style="float:right">   
            
              <h4><b>�˷ϴ޷� ��ī��</b></h4>
              <p><a href="http://localhost:8080/project_cook/recipeDB.do?num=43&pageNum=1" class="tm_link"> Click here</a> 
               </p>
              <p><b>���ְ� ������� ���־��.</b> <p>�������������ʿ䰡�������? �׷����� ��������� ���� ������� ����, �����Ǹ� �غ��߽��ϴ�.
              
              </p>
            
              <ul>
              <li><span></span></li>
                <li><span></span> </li>
            
              </ul>
              
            </div>
          </div>
        </li>
        
        <li data-srcPreview="${ pageContext.request.contextPath }/decanter/images/dsfsdst.jpg">
          <div>
            <div class="content" onclick="location.href='recipeDB.do?num=93&pageNum=1'"> 
            <img src="${ pageContext.request.contextPath }/decanter/images/dsfsdst.jpg" width="180px", height="180px" style="float:right">   
            
              <h4><b>������ �����</b></h4>
              <p><a href="http://localhost:8080/project_cook/recipeDB.do?num=93&pageNum=1" class="tm_link"> Click here</a> 
               </p>
              <p><b>����ϸ� �Ծ �ϸ�Ҹ��� �׷��� �����ϴ�?</b><br><p>
              	��� �ۿ� ��������.. ��ƹ����ڳ�.
              
              </p>
            
              <ul>
              <li><span></span></li>
                <li><span></span> </li>
            
              </ul>
              
            </div>
          </div>
        </li>
  
      </ul>
    </li>
    
    
    
    <!-- �߽� end -->
    
    

  </ul>
</div>



</body>
</html>