<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index Page</title>
</head>
<body>
<a href="addcar">Add New Car</a>
<hr>
<a href="findcar">Find A Car</a>

</body>
</html> -->


<html lang="en">
<head>
<title>Rental Car</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if (location.hash) {
			$("a[href='" + location.hash + "']").tab("show");
		}
		$(document.body).on("click", "a[data-toggle]", function(event) {
			location.hash = this.getAttribute("href");
		});
	});
	$(window).on(
			"popstate",
			function() {
				var anchor = location.hash
						|| $("a[data-toggle='tab']").first().attr("href");
				$("a[href='" + anchor + "']").tab("show");
			});
</script>

<style>
body, html {
	height: 100%;
	margin: 0;
}

.bg {
	/* The image used */
	background-image: url('Rental_car.jpg');
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<script>
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
		showDivs(slideIndex += n);
	}

	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("mySlides");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		x[slideIndex - 1].style.display = "block";
	}
</script>

</head>
<body>

	<div class="container">
		<h2>ByteWheels</h2>
		<ul class="nav nav-tabs" id="myTab">
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#addcar">Add New Car</a></li>
			<li><a data-toggle="tab" href="#rentcar">Deals</a></li>
			<li><a data-toggle="tab" href="#signup">Sign Up</a></li>
			<li><a data-toggle="tab" href="#signin">Sign In</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>HOME</h3>

				<!-- <div class="w3-content w3-display-container">
					<img class="mySlides" src="Rental_car.jpg" style="width: 100%">
					<img class="mySlides" src="img_lights.jpg" style="width: 100%">
					<img class="mySlides" src="img_mountains.jpg" style="width: 100%">
					<img class="mySlides" src="img_forest.jpg" style="width: 100%">

					<button class="w3-button w3-black w3-display-left"
						onclick="plusDivs(-1)">&#10094;</button>
					<button class="w3-button w3-black w3-display-right"
						onclick="plusDivs(1)">&#10095;</button>
				</div> -->
			</div>
			<div id="addcar" class="tab-pane fade">
				<!-- <a href="addcar">Add new Car</a> -->
				<form action="addcar" target="receiver">
					<!-- <button type="button" class="btn btn-primary" onclick="window.location = 'addcar'">Add Car</button> -->
					<button type="submit" class="btn btn-primary">Add Car</button>
				</form>
				<!-- <input type="button" value="Cancel"  class="cancel_button">	 -->
			</div>
			<div id="rentcar" class="tab-pane fade">
				<!-- <a href="findcar">Rent A Car</a> -->
				<form action="allcars" target="receiver">
					<button type="submit" class="btn btn-primary">Show All
						Cars</button>
				</form>
			</div>
			<div id="signup" class="tab-pane fade">
				<!-- <button type="button" class="btn btn-primary" onclick="window.location = 'signup'">Sign Up</button> -->
				<form action="signup" target="receiver">
					<button type="submit" class="btn btn-primary">Sign Up</button>
				</form>
			</div>
			<div id="signin" class="tab-pane fade">
				<!-- <button type="button" class="btn btn-primary" onclick="window.location = 'signin'">Sign In</button> -->
				<form action="signin" target="receiver">
					<button type="submit" class="btn btn-primary">Sign In</button>
				</form>
			</div>
		</div>
	</div>
	<iframe height="100%" width="100%" name="receiver" id="receiver"></iframe>
</body>
</html>


