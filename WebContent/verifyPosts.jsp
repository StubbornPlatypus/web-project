<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<p style="text-align: center;">Verify posts here...</p>
	<% 	page import="model.Post"
		List<Post> posts = ctx.getAwaitingPosts();
		for(Post post : posts){
			out.write(ctx.getPostHTML(post.getDate(), "TestName", post.getContent()) + "<br>");
			out.write("<a href='tofes.jsp'>אשר</a> <br>");
			out.write("<a href='tofes.jsp'>מחק</a> <br>");
		}
		%>
	</div>
</body>
</html>