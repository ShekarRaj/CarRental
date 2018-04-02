<%@page import="com.shekar.spring.models.Car"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Car</title>
</head>
<body>

<table border="2" cellpadding="2" width="70%">
<tr>
<td>Car Id</td>
<td>car Name</td>
<td>Car Model</td>
<td>Car Maker</td>
<td>Car Category</td>
<td>Rent per Day</td>
</tr>
<tr>
<td>${car.id}</td>
<td>${car.name}</td>
<td>${car.model}</td>
<td>${car.maker}</td>
<td>${car.category}</td>
<td>${car.rentPerDay}&nbsp;$</td>
</tr>
</table>
</body>
</html>