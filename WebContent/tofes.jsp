<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/tofes.css">
<script src="./js/tofes.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	String msg=null;
	String nickName = ctx.getFieldFromRequest("nickname");
	String password = ctx.getFieldFromRequest("password");
	if ((msg = (String)request.getAttribute("error"))!= null) {
		ctx.insertAlertDlg(msg,null);
	}
	
%>
	<div class="content">
		<form method="post">
			<label for="nickname">כנוי:</label> <input type="text" name="nickname" id="nickname" required value=<%=nickName%>>
			<br>
			<label for="password">סיסמה:</label> <input type="password" name="password" id="password" required>
			<label class="register" for="password2">סיסמה שוב:</label> <input type="password" class="register" name="password2" id="password2" required>
			<br>
			<label for="cbRegister">הרשמה:</label> <input type="checkbox" id="switch" name="switch" value="manager" onclick="change()">
			<br>
			<input type="submit" value="הכנס  " formaction="HttpHandler?cmd=login">
			<input type="submit" value="הרשם  " class="register" formaction="HttpHandler?cmd=register">
		</form>
	</div>
</body>
</html>
