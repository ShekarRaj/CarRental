<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div class="container">
    <div class="row">
        <div class="col-md-12">
        	<div class="invoice-title">
    			<h2>Order #12345</h2>
    		<hr>	
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					John Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>Shipped To:</strong><br>
    					Jane Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>
    		</div>
    		
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order placed on 01/23/2017</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Product</strong></td>
        							<td class="text-center"><strong>Price</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-center"><strong>Order Status</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td class="col-md-3">
    								    <div class="media">
    								         <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://lorempixel.com/460/250/" style="width: 72px; height: 72px;"> </a>
    								         <div class="media-body">
    								             <h4 class="media-heading"> Product Name</h4>
    								             <h5 class="media-heading"> Product Code</h5>
    								         </div>
    								    </div>
    								</td>
    								<td class="text-center">$10.99</td>
    								<td class="text-center">1</td>
    								<td>
    								  <div class="col-md-13">
        								  <div class="progress">
        								       <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
        								           <span class="sr-only">60% Complete</span>
        								        </div>
        								        <span class="progress-type">Packaging</span>
        								        <span class="progress-completed">61%</span>
        								  </div>
        								 </div>  
    								    
    								</td>
    							</tr>
                                <tr>
    								<td class="col-md-3">
    								    <div class="media">
    								         <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://lorempixel.com/460/250/" style="width: 72px; height: 72px;"> </a>
    								         <div class="media-body">
    								             <h4 class="media-heading"> Product Name</h4>
    								             <h5 class="media-heading"> Product Code</h5>
    								         </div>
    								    </div>
    								</td>
    								<td class="text-center">$10.99</td>
    								<td class="text-center">1</td>
    								<td>
    								    <div class="col-md-13">
        								  <div class="progress">
        								       <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
        								           <span class="sr-only">60% Complete</span>
        								        </div>
        								        <span class="progress-type">Packaging</span>
        								        <span class="progress-completed">60%</span>
        								  </div>
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
            	<div class="pull-left"><h4>Subtotal</h4> </div>
            	<div class="pull-right"><h4 class="text-right">$11.99</h4></div>
            	<div class="clearfix"></div>
            	<div class="pull-left"><h4>Tax</h4> </div>
            	<div class="pull-right"><h4 class="text-right">$1.99</h4></div>
            	<div class="clearfix"></div>
            	<div class="pull-left"><h4>Order Total</h4> </div>
            	<div class="pull-right"><h4 class="text-right">$13.50</h4></div>
            	<div class="clearfix"></div>
        	</div>
        	<div class="col-md-4 offset-md-1">
            	<h3 class="text-center">Payment Type</h3><hr>
            	<div class="text-center">
            	    <strong>Paid by Credit Card</strong><br>
            	 </div>
        	</div>
        	<div class="col-md-4 offset-md-2">
            	<h3 class="text-center">Other Info</h3><hr>
            	<address>
            	    <strong>Billed To:</strong><br>
            	    John Smith<br>
            	    1234 Main<br>
            	    Apt. 4B<br>
            	    Springfield, ST 54321
            	 </address>
        	</div>
    	</div>
    </div>
</div>
</body>
</html>