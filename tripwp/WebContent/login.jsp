<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://localhost/javascript/style.css?after">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
     <title>집사들의 은밀한 공간</title> 
</head>
<body>
    <div>
        <ul>
            <li><a href="write.jsp">자랑게시판</a></li>
            <li><a href="#">입양/임시보호</a></li>
            <li><a href="#">기타</a>
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">Q&A</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <h2 style="text-align:center;">로그인 화면</h3>
    <div class="login_sns" >
            <li><a href=""><i class="fab fa-instagram"></i></a></li>
            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
            <li><a href=""><i class="fab fa-twitter"></i></a></li>
    </div>
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
    
</body>
</html>