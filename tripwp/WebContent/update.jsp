<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="uw.Uw"%>
<%@ page import="uw.UwDAO"%>    
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int uwID =0;
		if(request.getParameter("uwID") != null){
			uwID = Integer.parseInt(request.getParameter("uwID"));
		}
		if(uwID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='write.jsp'");
			script.println("</script>");
		}
		Uw uw = new UwDAO().getUw(uwID);
		if(!userID.equals(uw.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='write.jsp'");
			script.println("</script>");
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

    <div id="in" style="padding-right: 230px;">
        <input type="button" value="마이페이지" onclick="location.href='mypage.jsp' "/>
        <input type="button" value="로그아웃" onclick="location.href='logoutAction.jsp' "/>  
    </div>  
    <div class="container">
    <div clsss="row">
        <form method="post" action="updateAction.jsp?uwID=<%= uwID %>">
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
			<tr>
				<th colspan="2" style="text-align:center; background-color:#rgb(133, 133, 133);">게시판 글 수정 양식</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글 제목" name="uwTitle" maxlength="50" value="<%= uw.getUwTitle()%>"></td>
			</tr>
			<tr>	
				<td><textarea class="form-control" placeholder="글 내용" name="uwContent" maxlength="2048"><%= uw.getUwContent()%></textarea></td>
			</tr>
			</tbody>
		</table>
	<input type="submit" class= "btn btn-primary pull-right" value="글 수정" style="margin: auto;"/>   
    </form>   
    </div>		    
    </div>

</body>
</html>