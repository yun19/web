<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
    <%@ page import="uw.UwDAO"%>
    <%@ page import="uw.Uw"%>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="http://localhost/javascript/write_style.css?after">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <title>YJ's Page</title> 
<style type="text/css">
	a, a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
		}
		int pageNumber =1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber =Integer.parseInt(request.getParameter("pageNumber"));
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
    <div class="container">
    <div class="low">
    	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>	
		</tr>
		</thead>
		<tbody>
		<%
			UwDAO uwDAO = new UwDAO();
			ArrayList<Uw> list = uwDAO.getList(pageNumber);
			for(int i =0; i< list.size(); i++){
		%>
		<tr>
			<td><%= list.get(i).getUwID()  %></td>
			<td><a href="view.jsp?uwID=<%= list.get(i).getUwID() %>"><%= list.get(i).getUwTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")  %></a></td>
			<td><%= list.get(i).getUserID()  %></td>
			<td><%= list.get(i).getUwDate().substring(0,11) + list.get(i).getUwDate().substring(11,13) + "시"+ list.get(i).getUwDate().substring(14,16) + "분"  %></td>
	        <td><%= list.get(i).getUwCount() %></td>  	
		</tr>
		<%		
			}
		%>
		</tbody>
	</table>
	<%
		if(pageNumber !=1){
	%>
	    <a href="write.jsp?pageNumber=<%=pageNumber-1  %>" class="btn btn-success btn-arraw-left">이전</a>
	<%
	
		}if(uwDAO.nextPage(pageNumber+1)){
	%>
		<a href="write.jsp?pageNumber=<%=pageNumber+1  %>" class="btn btn-success btn-arraw-left">다음</a>
	<%		
		}
	%>
	<a href="content.jsp" class= "write_btn" style="margin-top: 70px;">글쓰기</a>   
    </div> 
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