<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<script type="text/javascript">

document.getElementById("myBtn").addEventListener("click", function() {
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
    } else {
        console.log('Geolocation is not supported');
    }
	});
	 
function errorCallback() {}
 
function successCallback(position) {
	 var latlon = position.coords.latitude + "," + position.coords.longitude;

	 var img_url = "https://maps.googleapis.com/maps/api/staticmap?center=
		  "+latlon+"&zoom=14&size=400x300&sensor=false&key=YOUR_KEY";

	  document.getElementById("static-map").innerHTML = "<img src='"+img_url+"'>";
    }
</script>

</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
	<p style="text-align: center;">זה דף הנחיתה שלך, כאן אתה מציג מה האתר שלך עוסק בו ולמה כדאי להרשם אליו...</p>
	
	<div id="map">
  		<img id="static-map" class="mfnotransform"/>
	</div>
	<button id="myBtn">Try It</button>
	
</div>
</body>
</html>