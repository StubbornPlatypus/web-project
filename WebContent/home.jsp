<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<style>
	#map{
		height: 400px;
		width: 400px;
	}
</style>

<script>
	function initMap() {
		var location = {lat: 32.993727, lng: 35.279260};
		var map = new google.maps.Map(document.getElementById("map"), {
			zoom: 4,
			center: location
		});
		
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDptQy2sxrZJ-gGgGkFNwAIi6naYs_XIzQ&callback=initMap"type="text/javascript"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
	<p style="text-align: center;">זה דף הנחיתה שלך, כאן אתה מציג מה האתר שלך עוסק בו ולמה כדאי להרשם אליו...</p>
	
	<div id="map">
  		<img id="static-map" class="mfnotransform"/>
	</div>
	
</div>

<iframe src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDptQy2sxrZJ-gGgGkFNwAIi6naYs_XIzQ"></iframe>

</body>
</html>