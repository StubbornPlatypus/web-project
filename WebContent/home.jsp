<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Home</title>
<meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
<link href="https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.css" rel="stylesheet">
<script src="https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.js"></script>
<style>
body { margin: 0; padding: 0; }
#map { height: 50%; width: 50%; }
</style>
</head>

<body>
<%@ include file="header.jsp" %>

	<div class="content">
		<p style="text-align: center; font-size: 50px; color:orangered;">אתר הנסיך הקטן</p>
    	<img style="height: 636px; width: 500px" src="tlp_home.jpg" alt="The Little Prince Image"></img>
		<div id="map"></div>
	</div>
	<script>
	var lat, lng;
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition);
	  } else {
	    console.log("Geolocation is not supported by this browser.");
	    alert("not supported");
	  }
	
    function showPosition(position) {
		console.log("Latitude: " + position.coords.latitude +
			  "<br>Longitude: " + position.coords.longitude);
	  	lat = position.coords.latitude;
	  	lng = position.coords.longitude;
		  
		mapboxgl.accessToken = 'pk.eyJ1IjoibGl0dGxlcHJpbmNlc2l0ZSIsImEiOiJja25zcjY1cXIxMW5lMm5xdzh1cTlkNno2In0.PIey97GdyYjiWFVSYlu72A';
		var map = new mapboxgl.Map({
			container: 'map', // container id
			style: 'mapbox://styles/mapbox/streets-v11', // style URL
			center: [lng, lat], // starting position [lng, lat]
			zoom: 15 // starting zoom
		});
	}
	</script>

</body>
</html>
