<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<form method="post">
		<h1>רשום את תגובתך</h1>
		<textarea id="comment" name="comment" rows="4" cols="50" placeholder="כתוב כאן..."></textarea>
		<label for="pages">Choose a page:</label>
		  	<select name="pages" id="pages">
		    <option value="10">Station 1</option>
		    <option value="11">Station 2</option>
		    <option value="12">Station 3</option>
		    <option value="13">Station 4</option>
  			</select>
		<br><br>
		<input type="submit" value="שלח" formaction="HttpHandler?cmd=createPost">
		</form>
	</div>
</body>
</html>