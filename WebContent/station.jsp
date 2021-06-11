<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.Station"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
<link href="https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.css" rel="stylesheet">
<script src="https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.js"></script>
<style>
body { margin: 0; padding: 0; }
#map { height: 300px; width: 300px; float:left; }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<%
        int sid = Integer.parseInt(request.getParameter("sid"));
		Station s = ctx.getStationByID(sid);
		
    
    %>
    <div class="content" style = "overflow: auto;">
    	<div id="map"></div>
        <p style="text-align: center; font-size: 50px;"><%= s.getName() %> </p>
        <img style="height: 350px; width: 300px; padding-right: 10px;" src="<%= s.getImage() %>" alt="Image"></img>
        <p style="float: left; padding-left: 50px; width: 700px;"><%= s.getDescription() %></p>
        <hr>
        
        <% 
  			out.write(ctx.getPostsFormatted(sid));
 		%>
        
    </div>
    <div  class="footer">
    	<%
    		if (sid>10)
    			out.write("<button onclick=\"location.href='station.jsp?sid=" + (sid-1) +"'\" type=\"button\" style=\"float: left;\"> Previous</button>");
    		if (sid<13)
				out.write("<button onclick=\"location.href='station.jsp?sid=" + (sid+1) +"'\" type=\"button\" style=\"float: right;\"> Next</button>");
    	
    	%>
    </div>
    <script>
	var lat, lng;
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition);
	  } else {
	    console.log("Geolocation is not supported by this browser.");
	    alert("geolocation not supported");
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