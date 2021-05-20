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
		
		
		//בית ספר
		var lat = 32.995492295556396;
		var lon = 35.2655882771443;
		
		//כיכר ינוח
		var lat2 = 32.99097660654173;
		var lon2 = 35.26907493921373;
		
		//כיכר 7
		const LAT = 32.997309345161376;
		const LON = 35.271126316108734;
		const MAP_RELATIVE_POINT_X = 487.0;
		const MAP_RELATIVE_POINT_Y = 160.0;
		
		//כיכר 6
		const LAT2 = 32.99814173541092;
		const LON2 = 35.273065312328484;
		const MAP_RELATIVE_POINT_X2 = 576.0;
		const MAP_RELATIVE_POINT_Y2 = 93.0;
		
		//כיכר 1
		const LAT3 = 32.993627264500425;
		const LON3 = 35.27819540864996;
		const MAP_RELATIVE_POINT_X3 = 880.0;
		const MAP_RELATIVE_POINT_Y3 = 324.0;
		
		//סוף רחוב ערוגות
		const LAT4 = 32.99502308082723;
		const LON4 = 35.270234503582806;
		const MAP_RELATIVE_POINT_X4 = 469.0;
		const MAP_RELATIVE_POINT_Y4 = 303.0;
		
		//כיכר 8
		const LAT5 = 32.99533011374309;
		const LON5 = 35.267965981605215;
		const MAP_RELATIVE_POINT_X5 = 348.0;
		const MAP_RELATIVE_POINT_Y5 = 303.0;
		
		//תחילת רחוב מורן
		const LAT6 = 32.998078017007124;
		const LON6 = 35.276582350218526;
		const MAP_RELATIVE_POINT_X6 = 753.0;
		const MAP_RELATIVE_POINT_Y6 = 71.0;
		
		//סוף רחוב מירון
		const LAT7 = 32.992861999883594;
		const LON7 = 35.26796169502025;
		const MAP_RELATIVE_POINT_X7 = 376.0;
		const MAP_RELATIVE_POINT_Y7 = 457.0;
		
		//בית ספר אמירים
		const LAT8 = 32.99539230064161;
		const LON8 = 35.26636385312607;
		const MAP_RELATIVE_POINT_X8 = 268.0;
		const MAP_RELATIVE_POINT_Y8 = 314.0;
		
		var arrLat = [LAT, LAT2, LAT3, LAT4, LAT5, LAT6, LAT7];
		var arrLon = [LON, LON2, LON3, LON4, LON5, LON6, LON7];
		var arrX = [MAP_RELATIVE_POINT_X, MAP_RELATIVE_POINT_X2, MAP_RELATIVE_POINT_X3, MAP_RELATIVE_POINT_X4, MAP_RELATIVE_POINT_X5, MAP_RELATIVE_POINT_X6, MAP_RELATIVE_POINT_X7, MAP_RELATIVE_POINT_X8];
		var arrY = [MAP_RELATIVE_POINT_Y, MAP_RELATIVE_POINT_Y2, MAP_RELATIVE_POINT_Y3, MAP_RELATIVE_POINT_Y4, MAP_RELATIVE_POINT_Y5, MAP_RELATIVE_POINT_Y6, MAP_RELATIVE_POINT_Y7, MAP_RELATIVE_POINT_Y8];

	
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
		    
			var avgLat, avgLon, avgX, avgY;
			var sumLat = 0;
			var sumLon = 0;
			var sumX = 0;
			var sumY = 0;
			var length = arrLat.length;
			for(var i = 0; i < length; i++){
				sumLat += arrLat[i];
				sumLon += arrLon[i];
				sumX += arrX[i];
				sumY += arrY[i];
			}
			avgLat = sumLat / length;
			avgLon = sumLon / length;
			avgX = sumX / length;
			avgY = sumY / length;
			var relativeX = avgX / (avgLon - MAP_CORNER_LONG);
			var relativeY = avgY / (avgLat - MAP_CORNER_LAT);

		    markerXPos = (lon2 - MAP_CORNER_LONG) * relativeX;	//lon
		    markerYPos = (lat2 - MAP_CORNER_LAT) * relativeY;	//lat
		    console.log("generated marker: " + markerXPos + " " + markerYPos+")");
		    context.drawImage(Markers[0].Sprite, markerXPos, markerYPos, 12, 20);
	
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