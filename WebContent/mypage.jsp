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
		<p style="text-align: center;">זה אחד מהדפים הספציפיים שלך...</p>
		<canvas id="Canvas" width="969" height="597"></canvas>
	</div>
	<script>
	
		const MAP_CORNER_LAT = 33.001337;
		const MAP_CORNER_LONG = 35.261808;
		const MAP_WIDTH_METER = 1800.0;
		const MAP_HEIGHT_METER = 1125.0;
		const MAP_WIDTH_PIXEL = 969.0;
		const MAP_HEIGHT_PIXEL = 597.0;
		var la = 32.993745;
		var ln = 35.279259;
		
		function measure(lat1, lon1, lat2, lon2){  // generally used geo measurement function
		    var R = 6378.137; // Radius of earth in KM
		    var dLat = lat2 * Math.PI / 180 - lat1 * Math.PI / 180;
		    var dLon = lon2 * Math.PI / 180 - lon1 * Math.PI / 180;
		    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
		    Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
		    Math.sin(dLon/2) * Math.sin(dLon/2);
		    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    var d = R * c;
		    return d * 1000; // meters
		}
	
		var canvas = document.getElementById('Canvas');
		var context = canvas.getContext("2d");
	
		// Map sprite
		var mapSprite = new Image();
		mapSprite.src = "map_updated.jpeg";
	
		var Marker = function () {
		    this.Sprite = new Image();
		    this.Sprite.src = "http://www.clker.com/cliparts/w/O/e/P/x/i/map-marker-hi.png"
		    this.Width = 12;
		    this.Height = 20;
		    this.XPos = 0;
		    this.YPos = 0;
		}
	
		var Markers = new Array();
	
		var mouseClicked = function (mouse) {
		    // Get corrent mouse coords
		    var rect = canvas.getBoundingClientRect();
		    var mouseXPos = (mouse.x - rect.left);
		    var mouseYPos = (mouse.y - rect.top);
		    console.log(mouseXPos+" "+mouseYPos);
	
	        console.log("Placed marker: " + mouseXPos + " " + mouseYPos);
	
		    // Move the marker when placed to a better location
		    var marker = new Marker();
		    marker.XPos = mouseXPos - (marker.Width / 2);
		    marker.YPos = mouseYPos - marker.Height;
	
		    Markers.push(marker);
		}
	
		// Add mouse click event listener to canvas
		canvas.addEventListener("mousedown", mouseClicked, false);
	
		var firstLoad = function () {
		    context.font = "15px Georgia";
		    context.textAlign = "center";
		}
	
		firstLoad();
	
		var main = function () {
		    draw();
		};
	
		var draw = function () {
			
		    // Clear Canvas
		    context.fillStyle = "#000";
		    context.fillRect(0, 0, canvas.width, canvas.height);
	
		    // Draw map
		    // Sprite, X location, Y location, Image width, Image height
		    // You can leave the image height and width off, if you do it will draw the image at default size
		    context.drawImage(mapSprite, 0, 0);
		    
		    markerXPos = MAP_WIDTH_PIXEL * (measure(MAP_CORNER_LAT, ln, MAP_CORNER_LAT, MAP_CORNER_LONG) / MAP_WIDTH_METER);
		    markerYPos = MAP_HEIGHT_PIXEL * (measure(la, MAP_CORNER_LONG, MAP_CORNER_LAT, MAP_CORNER_LONG) / MAP_HEIGHT_METER);
		    console.log("generated marker: " + markerXPos + " " + markerYPos);
		    context.drawImage(Markers[0].Sprite, markerXPos+39.989, markerYPos-30.6183, 12, 20);
	
		    // Draw markers
		    for (var i = 0; i < Markers.length; i++) {
		        var tempMarker = Markers[i];
		        // Draw marker
		        context.drawImage(tempMarker.Sprite, tempMarker.XPos, tempMarker.YPos, tempMarker.Width, tempMarker.Height);
	
		        // Calculate postion text
		        var markerText = "Postion (X:" + tempMarker.XPos + ", Y:" + tempMarker.YPos;
	
		        // Draw a simple box so you can see the position
		        var textMeasurements = context.measureText(markerText);
		        context.fillStyle = "#666";
		        context.globalAlpha = 0.7;
		        context.fillRect(tempMarker.XPos - (textMeasurements.width / 2), tempMarker.YPos - 15, textMeasurements.width, 20);
		        context.globalAlpha = 1;
	
		        // Draw position above
		        context.fillStyle = "#000";
		        context.fillText(markerText, tempMarker.XPos, tempMarker.YPos);
		    }
		};
	
		setInterval(main, (1000 / 1));	//60
		</script>
</body>
</html>