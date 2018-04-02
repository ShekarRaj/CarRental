<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.shekar.spring.models.User"%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>Car Rent Invoice</title>

</head>
<body>
<%
List<User> list = (List<User>) session.getAttribute("userSession");
int userId = 0;
String userFirstName = "", userLastName = "", address ="", mobile_no="";

for(User user : list){
	userId = user.getUserId();
	userFirstName = user.getFirstName();
	userLastName = user.getLastName();
	address = user.getAddress();
	mobile_no = user.getMobileNo();
}

%>
<form name="frm">
<div class="container">
    <div class="row">
        <div class="col-md-12">
        	<div class="invoice-title">
    			<h2>ByteWheels</h2>
    		<hr>	
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					<%=userFirstName%> <%=userLastName%><br>
	    				<%=mobile_no%>,<br>
	    				<%=address%>.<br>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<h3>Invoice No #${car_id}<%=userId%></h3>
    			</div> 
    		</div>
    		
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Car booked from ${start_date} to ${end_date}</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Car</strong></td>
          							<td class="text-center"><strong>Category</strong></td>
        							<td class="text-center"><strong>Rent per day</strong></td>
        							<td class="text-center"><strong>Booking Status</strong>
        							<input type="hidden" name="start_date" value="${start_date}">
        							<input type="hidden" name="end_date" value="${end_date}">
        							<input type="hidden" name="car_rent_per_day" value="${car_rent_per_day }">
        							</td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td class="col-md-3">
    								    <div class="media">
    								         <div class="media-body">
    								             <h5 class="media-heading">${car_name}</h5>
    								         </div>
    								    </div>
    								</td>
    								<td class="text-center">${category}</td>
    								<td class="text-center">$&nbsp;${car_rent_per_day}</td>
    								<td class="text-center">Confirmed</td>
    								<td>
    								  <div class="col-md-13">
        								 </div>  
    								    
    								</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
         <div class="col-md-12">
            <div class="col-md-4">
            	<h3 class="text-center">Order Summary</h3><hr>
            	<div class="pull-left"><h4>Rent Per Day</h4> </div>
            	<div class="pull-right"><h4 class="text-right">$&nbsp;<b>${car_rent_per_day}</b></h4></div>
            	<div class="clearfix"></div>
            	<div class="pull-left"><h4>No of Days</h4> </div>
            	<div class="pull-right"><h4 class="text-right"><label id="no_of_days_id"></label></h4></div>
            	<div class="clearfix"></div>
            	<%-- <div class="pull-left"><h4>Subtotal</h4> </div>
            	<div class="pull-right"><h4 class="text-right">$&nbsp;${car_rent_per_day}</h4></div>
            	<div class="clearfix"></div> --%>
            	<!-- <div class="pull-left"><h4>Tax</h4> </div>
            	<div class="pull-right"><h4 class="text-right">$1.99</h4></div> -->
            	<div class="clearfix"></div>
            	<div class="pull-left"><h4>Order Total</h4> </div>
            	<!-- <div class="pull-right"><h4 class="text-right">$&nbsp;<label name="order_total"></label></h4></div> -->
            	<div class="pull-right"><h4 class="text-right">$&nbsp;<label id="order_total"></label></h4></div>
            	<div class="clearfix"></div>
        	</div>
        	<div class="col-md-4 offset-md-1">
            	<h3 class="text-center">Payment Type</h3><hr>
            	<div class="text-center">
            	    <strong>NA</strong><br>
            	 </div>
        	</div>
        	<div class="col-md-4 offset-md-6">
            	<h3 class="text-center">Other Info</h3><hr>
            	<strong>ByteWheels</strong><br>
    					6/A,<br>
    					Amit Plaza,<br>
	    				First Floor,<br>
	    				Bannerghatta Main Rd,<br>
	    				JP Nagar,<br>
	    				Bengaluru, Karnataka 560076.
    				</address>
        	</div>
    	</div>
    </div>
</div>
		<script type="text/javascript">
			var start_date = document.frm.start_date.value;
			var end_date = document.frm.end_date.value;
			var car_rent_per_day = document.frm.car_rent_per_day.value;
			//alert("start_date "+start_date);
			var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
			var firstDate = new Date(start_date);
			var secondDate = new Date(end_date);

			var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)));
			if( diffDays <= 0) diffDays = 1;
			document.getElementById("no_of_days_id").innerText = diffDays;
			var total_amount = diffDays * car_rent_per_day;
			if(total_amount <= 0){
				total_amount = car_rent_per_day;
			}
			//alert("total_amount "+total_amount);
			//document.frm.order_total.value = total_amount;
			document.getElementById("order_total").innerText = total_amount;
			//alert("diffDays "+diffDays);
			
		</script>
	</form>
</body>
</html>