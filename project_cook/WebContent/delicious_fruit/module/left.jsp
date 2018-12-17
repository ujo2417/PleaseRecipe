<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title></title>
<link rel="stylesheet" type="text/css" href="style.css" />

</head>

<body>


	<div id="left">


		<h4>Search for Recipe</h4>
		
	

		<form name="form1" method="post" class="contact_us"
			action="materialSearch.do">
			<p>
				<label> 
					<select name=country>
						<option value="ÀüÃ¼">ÀüÃ¼</option>
 						<option value="ÇÑ½Ä">ÇÑ½Ä</option>
						<option value="ÀÏ½Ä">ÀÏ½Ä</option>
						<option value="Áß½Ä">Áß½Ä</option>
						<option value="¾ç½Ä">¾ç½Ä</option>
						<option value="±âÅ¸">±âÅ¸</option>
					</select>
				</label>
			</p>
			<p>
				<label> <input type="text" class="fields_contact_us"
					name="subject" placeholder="À½½Ä ÀÌ¸§À» ÀÔ·ÂÇÏ¼¼¿ä"> <input
					type="submit" class="submit_button_contact" value="Search" />
				</label>
			</p>
		</form>

		<h4>Search for Meterial</h4>
		<form name="form2" method="post" class="contact_us"
			action="materialSearch.do">
			<p>
				<label> 
					<select name=country>
						<option value="ÀüÃ¼">ÀüÃ¼</option>
 						<option value="ÇÑ½Ä">ÇÑ½Ä</option>
						<option value="ÀÏ½Ä">ÀÏ½Ä</option>
						<option value="Áß½Ä">Áß½Ä</option>
						<option value="¾ç½Ä">¾ç½Ä</option>
						<option value="±âÅ¸">±âÅ¸</option>
					</select>
				</label>
			</p>
			<p>
				<label> <input type="text" class="fields_contact_us"
					name="material1" placeholder="Àç·á¸¦ ÀÔ·ÂÇÏ¼¼¿ä."> <br>
				<input type="text" class="fields_contact_us" name="material2"
					placeholder="Àç·á¸¦ ÀÔ·ÂÇÏ¼¼¿ä."> <br>
				<input type="text" class="fields_contact_us" name="material3"
					placeholder="Àç·á¸¦ ÀÔ·ÂÇÏ¼¼¿ä."> <input type="submit"
					class="submit_button_contact" value="Search" />
				</label>
			</p>
		</form>


		<h4>
			<span class="menu_first_letter">Navigation</span>
		</h4>

		<div id="navcontainer">
			<ul id="navlist">
				<li id="active"><a href="main.do" id="current">Home</a></li>
				<li class="green"><a href="recipeDBList.do">Recipe</a></li>
				<li><a href="recipeList.do">Member's Recipe</a></li>
				<li><a href="list.do">Community</a></li>
				<li><a href="#">About us</a></li>
			</ul>
		</div>



		<h4>Suggested links</h4>





		<a href="">°ü·Ã¿ä¸®»çÀÌÆ®</a>
	</div>

</body>
</html>

<!-- left.jsp end-->
