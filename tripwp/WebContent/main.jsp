<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://localhost/javascript/style.css?after">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
 <title>YJ's Page</title> 
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
		}
	%>
	<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none; position:fixed;" id="mySidebar">
 	 <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
     <a href="main.jsp" class="w3-bar-item w3-button"><ion-icon name="home-outline"></ion-icon>HOME</a>
 	 <a href="https://github.com/yun19?tab=repositories" class="w3-bar-item w3-button"><ion-icon name="earth-outline"></ion-icon>깃허브</a>
  	 <a href="write.jsp" class="w3-bar-item w3-button"><ion-icon name="create-outline"></ion-icon>포스팅</a>
	</div>
	<div class="w3-teal">
  		<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>
    </div>
    <%
    	if(userID==null){
    %>
    <div id="in" style="padding-right: 330px;">
        <input type="button" value="로그인" onclick="location.href='login.jsp' "/>
        <input type="button" value="회원가입" onclick="location.href='join.jsp' "/>  
    </div>
    <%
    	} else{
    %>
    <div id="in" style="padding-right: 330px;">
        <input type="button" value="마이페이지" onclick="location.href='mypage.jsp' "/>
        <input type="button" value="로그아웃" onclick="location.href='logoutAction.jsp' "/>  
    </div>
    <%
    	}
    %>
    <h1 id="one"><span style="color:rgb(255, 166, 0);">YJ's </span> Page</h1>
    <div style="text-align: center;">
        <img src="https://images.unsplash.com/photo-1642289798059-3b5e183d411d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1512&q=80.jpg" alt="trip"/>
    </div>
    <h2>개인용 & Back-end 개발자 게시판</h2>
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