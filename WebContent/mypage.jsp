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
	
		const MAP_CORNER_LAT = 33.00139924826094;
		const MAP_CORNER_LONG = 35.2620053176368;
		
		const MAP_RELATIVE_POINT_LAT = 32.9936298184339; 
		const MAP_RELATIVE_POINT_LONG = 35.2781992807017;
		
		const MAP_RELATIVE_POINT_X = 880.0;
		const MAP_RELATIVE_POINT_Y = 324.0;
		
		//בית ספר
		var lat = 32.995492295556396;
		var lon = 35.2655882771443;
		
		//כיכר 6
		var lat2 = 32.99814173541092;
		var lon2 = 35.273065312328484;
		
		//כיכר 1
		var lat3 = 32.993627264500425;
		var lon3 = 35.27819540864996;
		
	
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
	
	        console.log("Placed marker: " + mouseXPos + " " + mouseYPos);
	
		    // Move the marker when placed to a better location
		    var marker = new Marker();
		    marker.XPos = mouseXPos - (marker.Width / 2);
		    marker.YPos = mouseYPos - marker.Height;
	
		    Markers.push(marker);
		    draw();
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
		    
		    markerXPos = (lon3 - MAP_CORNER_LONG) * (MAP_RELATIVE_POINT_X / (MAP_RELATIVE_POINT_LONG - MAP_CORNER_LONG));
		    markerYPos = (lat3 - MAP_CORNER_LAT) * (MAP_RELATIVE_POINT_Y / (MAP_RELATIVE_POINT_LAT - MAP_CORNER_LAT));
		    console.log("generated marker: " + markerXPos + " " + markerYPos);
		    context.drawImage(Markers[0].Sprite, markerXPos, markerYPos, 12, 20);	//+(236-123), +(335-164)
	
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
	
		//setInterval(main, (1000 / 0.1));	//60
		</script>
</body>
</html>