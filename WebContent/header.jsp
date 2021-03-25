<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/header.css">
<title>Insert title here</title>
<%@ include file="context.jsp"%>
</head>
<body class="top-menu">
	<ul>
		<li><a href="home.jsp">בית</a></li>
		<% 
  	if (!ctx.isLoggedIn()){
  		out.write("<li><a href='tofes.jsp'>כניסה</a></li>");
  	}
  	else {
  		out.write("<li><a href='HttpHandler?cmd=logout'>יציאה</a></li>");
  	}
  %>
		<li><a href="mypage.jsp">דפים שלי...</a></li>
		<li class="dropdown"><a href="#" class="dropbtn">משניים...</a>
			<div class="dropdown-content">
				<a href="#">אופציה א</a> <a href="#">אופציה ב</a> <a href="#">אופציה
					ג</a>
			</div></li>
		<li><a href="about.jsp">אודות</a></li>
	</ul>

	<div class="rbanner">
		<p>איזור הודעות ודיווחים</p>

		<p>
			שלום
			<%=ctx.getCurrentUserName()%></p>
	</div>
</body>
</html>