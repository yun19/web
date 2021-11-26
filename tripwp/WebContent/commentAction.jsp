<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="comment" class="comment.Comment" scope="page"/>
<jsp:setProperty name="comment" property="commentText"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int uwID = 0;
	if(request.getParameter("uwID")!=null){
		uwID=Integer.parseInt(request.getParameter("uwID"));
	}
	int boardID = 0;
	if (request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	String userID =null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID ==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} else{
		if(comment.getCommentText()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			CommentDAO commentDAO= new CommentDAO();
			int commentID = commentDAO.write(boardID, uwID, userID, comment.getCommentText());
			if(commentID==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글작성에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				String url="view.jsp?uwID="+uwID;
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='"+url+"'");
				script.println("</script>");
			}
		}	
	}
	
	
	%>>
</body>
</html>