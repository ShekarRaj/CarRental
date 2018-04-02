<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="p"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Rental Car Web App</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- form validation pluggins -->
<script
	src="http://formvalidation.io/vendor/formvalidation/js/formValidation.min.js"></script>
<script
	src="http://formvalidation.io/vendor/formvalidation/js/framework/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
	
<script>
$(function() {
	  // Initialize form validation on the registration form.
	  // It has the name attribute "registration"
	  $("form[name='userForm']").validate({
	    // Specify validation rules
	    rules: {
	      // The key name on the left side is the name attribute
	      // of an input field. Validation rules are defined
	      // on the right side
	      firstName: "required",
	      lastName: "required",
	      email: {
	        required: true,
	        // Specify that email should be validated
	        // by the built-in "email" rule
	        email: true
	      },
	      password: {
	        required: true,
	        minlength: 5
	      },
	      
	      password_confirm: {
	            required: true,
	            minlength: 5,
	            equalTo: '[name="password"]'
	        },
	        mobileNo: {
		        required: true,
		        minlength: 10,
		        number: true
		      },
	        gender: {
		        required: true
		      },
		    address:{
		    	required: true	
		    }  
		      
	    },
	    // Specify validation error messages
	    messages: {
	      firstName: "Please enter your firstname",
	      lastName: "Please enter your lastname",
	      password: {
	        required: "Please provide a password",
	        minlength: "Your password must be at least 5 characters long"
	      },
	      password_confirm: {
		        required: "Please provide the confirm password",
		        minlength: "Your password must be at least 5 characters long",
		        equalTo: "Confirm password must be same as password"
		      },
		      mobileNo: {
			        required: "Please provide Mobile No",
			        minlength: "Mobile No must be 10 characters long",
			        number: "Enter only numbers"
			      },
			      gender: {
				        required: "Please select gender",
				      },
		      address: {
			        required: "Please provide address",
			      },
	      email: "Please enter a valid email address"
	    },
	    // Make sure the form is submitted to the destination defined
	    // in the "action" attribute of the form when valid
	    submitHandler: function(form) {
	      form.submit();
	    }
	  });
	});
</script>

<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Open+Sans");

/* Styles */
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "Open Sans";
	font-size: 14px;
}

.container {
	width: 500px;
	margin: 25px auto;
}

/* form {
	padding: 20px;
	background: #2c3e50;
	color: #fff;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
} */

form label, form input, form button {
	border: 0;
	margin-bottom: 3px;
	display: block;
	width: 100%;
}

form input {
	height: 25px;
	line-height: 25px;
	background: #fff;
	color: #000;
	padding: 0 6px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

form button {
	height: 30px;
	line-height: 30px;
	background: #e67e22;
	color: #fff;
	margin-top: 10px;
	cursor: pointer;
}

form .error {
	color: #ff0000;
}
</style>

</head>
<body>
	<h2>
		<center>Add Car</center>
	</h2>

	<div class="container">
		<p:form action="add" name="carForm" method="post" modelAttribute="car">
			<%-- <div class="form-group">
				<p:label path="id">Car Id:</p:label>
				<p:errors path="id" cssStyle="color:red" />
				<p:input path="id" class="form-control" id="id" />
			</div> --%>

			<div class="form-group">
				<p:label path="name">Car Name:</p:label>
				<p:errors path="name" cssStyle="color:red" />
				<p:input path="name" class="form-control" id="name" />
			</div>
			<div class="form-group">
				<p:label path="model">Car Model:</p:label>
				<p:errors path="model" cssStyle="color:red" />
				<p:input path="model" class="form-control" id="model" />
			</div>
			<div class="form-group">
				<p:label path="maker">Car Maker:</p:label>
				<p:errors path="maker" cssStyle="color:red" />
				<p:input path="maker" class="form-control" id="maker" />
			</div>
			<div class="form-group">
				<p:label path="category">Car Category:</p:label>
				<p:errors path="category" cssStyle="color:red" />
				<p:select path="category">
						<p:option value="" label="Select" />
						<p:option value="Compact" label="Compact" />
						<p:option value="Full" label="Full" />
						<p:option value="Large" label="Large" />
						<p:option value="Luxury" label="Luxury" />
				</p:select>
			</div>
			<div class="form-group">
				<p:label path="rentPerDay">Rent Per Day:</p:label>
				<p:errors path="rentPerDay" cssStyle="color:red" />
				<p:input path="rentPerDay" class="form-control" id="rentPerDay" />
			</div>
			<center>
				<button type="submit" class="btn btn-success">Add Car</button>
			</center>
		</p:form>
		<br>
		<!-- <button type="button" class="btn" onclick="window.location = './'">Go
			To Home</button> -->
		<!-- 	<a href="./">Go To Home</a> -->
	</div>
</body>
</html>