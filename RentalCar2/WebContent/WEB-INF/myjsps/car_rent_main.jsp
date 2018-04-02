<%@page import="com.shekar.spring.models.User"%>
<%@page import="java.util.List" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		$("#startdate").datepicker({
			todayBtn : 1,
			autoclose : true,
			format : 'dd-MM-yyyy'
		    //minDate: 0 
			//showButtonPanel: true,
		    //minDate: dateToday
		}).on('changeDate', function(selected) {
			var minDate = new Date(selected.date.valueOf());
			$('#enddate').datepicker('setStartDate', minDate);
			$('#enddate').datepicker('setDate', minDate);
		});

		$("#enddate").datepicker({
			format : 'dd-MM-yyyy'
		}).on('changeDate', function(selected) {
			var maxDate = new Date(selected.date.valueOf());
			$('#startdate').datepicker('setEndDate', maxDate);
		});

	});
</script>
<script>
function validate(){
	var start_date = document.frm.start_date.value;
	var end_date = document.frm.end_date.value;
	
	if(start_date == null || start_date == ""){
		alert("Please select From Date");
		document.frm.start_date.focus();
		return false;
	}
	var selectedDate = new Date(start_date);
	var today = new Date();
	today.setHours(0,0,0,0)
	//alert("selectedDate "+selectedDate+" today "+today);
	   if (selectedDate != today && selectedDate < today) {
	    alert("From Date must be today's date or future date");
	    document.frm.start_date.focus();
		return false;
	   }
	if(end_date == null || end_date == ""){
		alert("Please select To Date");
		document.frm.end_date.focus();
		return false;
	}
	
	return true;
}

/* function checkDate() {
	   var selectedText = document.getElementById('startdate').value;
	   var selectedDate = new Date(selectedText);
	   var now = new Date();
	   if (selectedDate < now) {
	    alert("Date must be in the future");
	    document.frm.start_date.focus();
		return false;
	   }
	   return true;
	 } */
</script>

</head>
<body>
<%List<User> list = (List<User>) session.getAttribute("userSession");
/* out.println(list); */%>
<%-- <c:forEach items="${list}" var="user">
<p>${user.firstName}</p><br/>
<p>${user.lastName}</p><br/>
<p>${user.email}</p><br/>
</c:forEach>
 --%>

	<div class="container">
		<spring:form method="post" name="frm" action="searchCars" onsubmit="return validate();">
			<!-- From Date : <input type="text" placehoder="Start Date"id="startdate" name="start_date" readonly style="background-color: lightyellow" /> -->
			<div class="form-group">
				<label class="col-xs-2 control-label">From Date :</label>
				<div class="col-xs-2">
					<input type="text" class="form-control" placehoder="Start Date"
						id="startdate" name="start_date" readonly
						style="background-color: lightyellow" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-2 control-label">End Date :</label>
				<div class="col-xs-2">
					<input type="text" class="form-control" placehoder="End Date"
						id="enddate" name="end_date" readonly
						style="background-color: lightyellow" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-2" for="sel1">Select Car Category:</label>
				<div class="col-xs-2">
					<select name="category" class="form-control" id="sel1">
						<option>All</option>
						<option>Compact</option>
						<option>Full</option>
						<option>Large</option>
						<option>Luxury</option>
					</select>
				</div>
			</div>
			<!-- End Date : <input type="text" placehoder="End Date" id="enddate" name="end_date" readonly  style="background-color: lightyellow"/> -->
			<br> <br>
			<br>
			<div class="form-group">
				<div class="col-xs-1 col-xs-offset-5">
					<button type="submit" class="btn btn-primary" name="signup"
						value="Sign up">Submit</button>
				</div>
			</div>
		</spring:form>
	</div>
</body>
</html>