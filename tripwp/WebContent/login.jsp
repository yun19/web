<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://localhost/javascript/style.css?after">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
     <title>YJ's Page</title> 
</head>
<body>
    <div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
 	 <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
     <a href="write.jsp" class="w3-bar-item w3-button"><ion-icon name="accessibility-outline"></ion-icon>토이 프로젝트</a>
 	 <a href="https://github.com/yun19?tab=repositories" class="w3-bar-item w3-button"><ion-icon name="enter-outline"></ion-icon>깃허브</a>
  	 <a href="#" class="w3-bar-item w3-button"><ion-icon name="create-outline"></ion-icon>포스팅</a>
    </div>  
	<div class="w3-teal">
  		<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>
    </div>
    <h2 style="text-align:center;">로그인 화면</h2>
  
    <div class="container" style="padding-top:20px;">
    		<form method="post" action="loginAction.jsp">
    				<div class="form_group" style="margin:5px">
    					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20"/>
    				</div>
    				<div class="form_group">
    					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20"/>
    				</div>
    				<input type="submit" class="btn_form" value="로그인">
 			  </form>
    	</div>
    <script>
	function w3_open() {
	  document.getElementById("mySidebar").style.display = "block";
	}

	function w3_close() {
	  document.getElementById("mySidebar").style.display = "none";
	}
    </script>
</body>
</html>