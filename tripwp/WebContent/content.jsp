<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="http://localhost/javascript/write_style.css?after">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<title>집사들의 은밀한 공간</title>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
		}
	%>
    <div class="menu_form">
        <ul style="text-align:center;">
        	<li><a href="main.jsp">HOME</a></li>
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
    <%
    	if(userID==null){
    %>
    <div id="in" style="padding-right: 230px;">
        <input type="button" value="로그인" onclick="location.href='login.jsp' "/>
        <input type="button" value="회원가입" onclick="location.href='join.jsp' "/>  
    </div>
    <%
    	} else{
    %>
    <div id="in" style="padding-right: 230px;">
        <input type="button" value="마이페이지" onclick="location.href='mypage.jsp' "/>
        <input type="button" value="로그아웃" onclick="location.href='logoutAction.jsp' "/>  
    </div>
    <%
    	}
    %>    
    <div class="container">
    <div clsss="row">
        <form method="post" action="writeAction.jsp">
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
			<tr>
				<th colspan="2" style="text-align:center; background-color:#rgb(133, 133, 133);">게시판 글쓰기 양식</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글 제목" name="uwTitle" maxlength="50"></td>
			</tr>
			<tr>	
				<td><textarea class="form-control" placeholder="글 내용" name="uwContent" maxlength="2048"></textarea></td>
			</tr>
			</tbody>
		</table>
	<input type="submit" class= "btn btn-primary pull-right" value="작성완료" style="margin: auto;"/>   
    </form>   
    </div>		    
    </div>

</body>
</html>