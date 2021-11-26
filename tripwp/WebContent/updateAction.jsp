<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="uw.Uw" %>
<%@ page import="uw.UwDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
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
	} else{
		if(request.getParameter("uwTitle") == null || request.getParameter("uwContent") == null
				|| request.getParameter("uwTitle").equals("") || request.getParameter("uwContent").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UwDAO uwDAO = new UwDAO();
			int result= uwDAO.update(uwID, request.getParameter("uwTitle"), request.getParameter("uwContent"));
			if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정이 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='write.jsp'");
				script.println("</script>");
			}
		}	
	}
	
	
	%>>
</body>
</html>