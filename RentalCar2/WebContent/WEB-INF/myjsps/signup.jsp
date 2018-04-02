<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>

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
		<center>Sign Up here</center>
	</h2>
	<spring:form action="doRegister" name="userForm" method="post"
		modelAttribute="user" class="form-horizontal"
		 data-fv-framework="bootstrap">
		<!-- <form id="basicBootstrapForm" class="form-horizontal"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh" modelAttribute="user"> -->

		<div class="form-group">
			<label class="col-xs-3 control-label">First Name</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" name="firstName" placeholder="First name" />
			</div>

		</div>
		<div class="form-group">
			<label class="col-xs-3 control-label">Last Name</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" name="lastName" placeholder="Last name" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-xs-3 control-label">Email</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" name="email"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-xs-3 control-label">Password</label>
			<div class="col-xs-2">
				<input type="password" class="form-control" name="password"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-xs-3 control-label">Confirm Password</label>
			<div class="col-xs-2">
				<input type="password" class="form-control" name="password_confirm"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-xs-3 control-label">Mobile No</label>
			<div class="col-xs-2">
				<input type="text"  maxlength="10" class="form-control" name="mobileNo" />
			</div>
		</div>
		
		</div>
		<div class="form-group shadow-textarea">
			<label for="address"  class="col-xs-3 control-label">Address</label>
			<div class="col-xs-2">
			<textarea class="form-control z-depth-1" id="address" name = "address" rows="4"
				placeholder="Write your address . . ."></textarea>
		</div>
		</div>
		<div class="form-group">
			<label class="col-xs-3 control-label">Gender</label>
			<div class="col-xs-2">
				<div class="radio">
					<label> <input type="radio" name="gender" value="Male"/> Male </label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="gender" value="Female" />Female</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="gender" value="Other" />Other</label>
				</div>
			</div>
		</div>

		<!-- <div class="form-group">
			<label class="col-xs-3 control-label" id="captchaOperation"></label>
			<div class="col-xs-4">
				<input type="text" class="form-control" name="captcha"
					data-fv-callback="true" data-fv-callback-callback="checkCaptcha"
					data-fv-callback-message="Wrong answer" />
			</div>
		</div> -->

		<!-- <div class="form-group">
			<div class="col-xs-6 col-xs-offset-3">
				<div class="checkbox">
					<label> <input type="checkbox" name="agree" value="agree"
						data-fv-notempty="true"
						data-fv-notempty-message="You must agree with the terms and conditions" />
						Agree with the terms and conditions
					</label>
				</div>
			</div>
		</div> -->
		<div class="form-group">
			<div class="col-xs-1 col-xs-offset-4">
				<button type="submit" class="btn btn-primary" name="signup" value="Sign up">Submit</button>
			</div>
		</div>
	</spring:form>
</body>
</html>