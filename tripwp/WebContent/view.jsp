<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="uw.Uw"%>
<%@ page import="uw.UwDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="http://localhost/javascript/write_style.css?after">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<title>집사들의 은밀한 공간</title>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
		}
		int uwID =0;
		if(request.getParameter("uwID") != null){
			uwID = Integer.parseInt(request.getParameter("uwID"));
		}
		int boardID=0;
		if(request.getParameter("boardID")!=null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(uwID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='write.jsp'");
			script.println("</script>");
		}
		Uw uw =new UwDAO().getUw(uwID);
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
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
			<tr>
				<th colspan="4" style="text-align:center; background-color:#eeeeee);">게시판 글 보기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td style="width:20%">글제목</td>
				<td colspan="3"><%= uw.getUwTitle() %></td>
			</tr>
			<tr>	
				<td>작성자</td>
				<td colspan="3"><%= uw.getUserID() %></td>
			</tr>
			<tr>	
				<td>작성일자</td>
				<td colspan="2"><%= uw.getUwDate().substring(0,11) + uw.getUwDate().substring(11,13) + "시"+ uw.getUwDate().substring(14,16) + "분"  %></td>
			</tr>
			<tr>	
				<td>조회수</td>
				<td colspan="3"><%= uw.getUwCount() %></td>
			</tr>
			<tr>	
				<td>내용</td>
				<td colspan="3" style="height:250px; text-align:left;"><%= uw.getUwContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
			</tr>
			</tbody>
		</table>
		<div class="container">
		<div class="form-group">
		<form method="post" action="commentAction.jsp?uwID=<%= uwID %>">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
				<tr>
					<td style="border-bottom:none; valign:middle"><%=userID %></td>
					<td><textarea class="form-control" placeholder="댓글을 입력하세요" name="commentText" maxlength="2048"></textarea></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
			</table>
		</form>
		</div>
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<tr>
					<td style="text-align:center; background-color:beige;">댓글</td>
				</tr>
			</table>
		</div>		
		</div>
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<tr>
				<%
				CommentDAO commentDAO = new CommentDAO();
				ArrayList<Comment> list = commentDAO.getList(boardID,uwID);
				for(int i=0; i< list.size(); i++){
				%>
					<div class="container">
					<div class="row">
						<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
							<tr>
								<td><%= list.get(i).getUserID()%></td>
								<td><%= list.get(i).getCommentText()%></td>
								<td><%= list.get(i).getCommentDate()%></td>
								<td>
								<%
								if(userID != null && userID.equals(uw.getUserID())){
								%>
								<a href="update.jsp?uwID<%= uwID %>" class="btn btn-default btn-sm">수정</a>
								<a href="delete.jsp?uwID<%= uwID %>" class="btn btn-default btn-sm">삭제</a>
								<%	
								}
								%>
								</td>
								
							</tr>
						</table>
					</div>
					</div>
				<%	
				}
				%>
				</tr>
			</table>
		</div>
		</div>
		<a href="write.jsp" class="btn btn-primary">목록</a>
		<% 
			if(userID != null && userID.equals(uw.getUserID())){
		%>
			<a href="update.jsp?uwID=<%= uwID%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?uwID=<%= uwID%>" class="btn btn-primary">삭제</a>
		<%		
			}
		%>
    </div>		    
    </div>

</body>
</html>