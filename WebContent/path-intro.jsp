<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
	<p style="text-align: center; font-size: 50px;">סיור וירטואלי במסלול "הנסיך הקטן"</p>

	<!--  <img src="map.jpeg" usemap="#image-map" style="padding-right: 200px;">
	<map name="image-map">
		<area target="_blank" alt="stop-one" title="stop-one" href="station.jsp?sid=10" coords="99,101,12" shape="circle">
    	<area target="_blank" alt="stop-two" title="stop-two" href="station.jsp?sid=11" coords="164,179,11" shape="circle">
    	<area target="_blank" alt="stop-three" title="stop-three" href="station.jsp?sid=12" coords="246,194,10" shape="circle">
    	<area target="_blank" alt="stop-four" title="stop-four" href="station.jsp?sid=13" coords="352,217,10" shape="circle">
	</map>-->
	
	<img src="map_updated.jpeg" usemap="#image-map">

<map name="image-map">
    <area target="_blank" alt="stop-one" title="stop-one" href="station.jsp?sid=10" coords="105,226,12" shape="circle">
    <area target="_blank" alt="stop-two" title="stop-two" href="station.jsp?sid=11" coords="174,308,12" shape="circle">
    <area target="_blank" alt="stop-three" title="stop-three" href="station.jsp?sid=12" coords="257,327,13" shape="circle">
    <area target="_blank" alt="stop-four" title="stop-four" href="station.jsp?sid=13" coords="373,347,13" shape="circle">
</map>

	<p style="padding-right: 350px; font-size: medium; padding-top: 50px;">sample text sample text sample text sample text sample text sample text</p>

</div>
</body>
</html>