<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://localhost/javascript/style.css?after">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<title>Trip & Healing</title>
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
	<h2 style="text-align:center";>회원가입</h2>
	<div class="join-formbox">
		<div class="join-form">
            <form method="post" action="joinAction.jsp">
                <table class="table-style">
                    <tr class="join-group">
                        <th>아이디</th>
                        <td><input type="text" class="form-control" name="userID" maxlength="20"/></td>
                    </tr>
                    <tr class="join-group">
                        <th>비밀번호</th>
                        <td><input type="text" class="form-control" name="userPassword" maxlength="20"/></td>
                    </tr>
                    <tr class="join-group">
                        <th>이름</th>
                        <td><input type="text" class="form-control" name="userName" maxlength="20"/></td>
                    </tr>
                    <tr class="join-group">
                        <tr class="btn-group" data-toggle="buttons">
                            <th>성별</th>
                            <td>
                           	 <label class="btn-group-1">
                        	        <input type="radio" name="userGender" autocomplete="off" value="남자"/>남자
                       	     </label>
                             <label class="btn-group-1">
                     		        <input type="radio" name="userGender" autocomplete="off" value="여자"/>여자
                             </label>
                            </td>
                        </tr>
                    </tr>    
                    <tr class="join-group">
                        <th>이메일</th>
                        <td><input type="text" class="form-control" name="userEmail" maxlength="50"/></td>
                    </tr>
                    <tr >
                    	<td colspan="2" style="text-align:center";>
                    	<input type="submit" class="btn_join" value="회원가입하기">
                    	</td>
                    </tr>
                </table>
		</form>
	</div>
	</div>
</body>
</html>