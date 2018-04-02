<%@page import="com.shekar.spring.models.Car"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<!-- https://code.jquery.com/jquery-1.12.4.js
https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js
 -->

<!-- <script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
</head>
<body>

<center>
<c:choose>
<c:when test="${from=='search'}">
	<%-- <h4>From date ${start_date} and To date ${end_date}<c:if test="${not empty category}">and ${category}</c:if></h4> --%>
				<div class="container">
					<div class="panel panel-default">
						<div class="panel-body"><h4>Below <c:if test="${not empty category}"> <mark> ${category} </mark> category</c:if> cars available from <mark> ${start_date} </mark> to <mark> ${end_date} </mark></h4></div>
					</div>
				</div>
			</c:when>
<c:otherwise>
	<h4>All Cars</h4>
</c:otherwise>
</c:choose>
</center>
		<!-- <button type="button" class="btn btn-success" onclick="window.loction = 'window.location = 'javascript:history.go(-1)'">Go To Home</button> -->
	<form>
	<table id="example" class="cell-border" style="width: 100%">
		<thead style="background-color: #f5f5ef">
			<tr>
				<th nowrap>Sl No</th>
				<th>Car Id</th>
				<th>Car Name</th>
				<th>Car Model</th>
				<th>Car Maker</th>
				<th>Car Category</th>
				<th>Rent Per Day</th>
				<th>Action</th>
			</tr>
		</thead>

		<%
			List<Car> list = (List<Car>) session.getAttribute("ssn");%>
		<%-- out.println(<%=list%>); --%>
		<%if(list != null){
			int i = 0;
			
		for (Car car : list) {
			
			i++;
			String rowColor = "";	
			if(i % 2 == 0){rowColor = "#e6e6ff";}//#e6e6ff  #e6f0ff
			
		%>
		<tbody>
			<tr style="background-color: <%=rowColor %>">
				<td style="text-align: center"><%=i%></td>
				<td style="text-align: center"><%=car.getId()%></td>
				<td><%=car.getName()%></td>
				<td><%=car.getModel()%></td>
				<td><%=car.getMaker()%></td>
				<td><%=car.getCategory()%></td>
				<td style="text-align: right">$&nbsp;<%=car.getRentPerDay()%></td>
				<%-- <td><a href="deleteuser?id=<%=car.getId()%>">Delete</a> <a
				href=""></a></td> --%>


				<c:choose>
					<c:when test="${from=='search'}">
						<td style="text-align: center"><button type="button"
								class="btn btn-primary"
								onclick="window.location = 'bookCar?id=<%=car.getId()%>&start_date=${start_date}&end_date=${end_date}&category=<%=car.getCategory()%>&car_name=<%=car.getName()%>&car_rent_per_day=<%=car.getRentPerDay()%>'">Book</button></td>
					</c:when>
					<c:otherwise>
						<td style="text-align: center"><button type="button" disabled
								class="btn btn-primary"
								onclick="window.location = 'deleteuser?id=<%=car.getId()%>'">Delete</button></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</tbody>
		<%
			}
		}else{%>
		<h1>list is empty</h1>
		<%}
		%>
		<tfoot>
			<tr>
				<th nowrap>Sl No</th>
				<th>Car Id</th>
				<th>Car Name</th>
				<th>Car Model</th>
				<th>Car Maker</th>
				<th>Car Category</th>
				<th>Rent Per Day</th>
				<th>Action</th>
			</tr>
		</tfoot>
	</table>
	</form>
	<br>
	<center>
		<!-- <button type="button" class="btn btn-success" onclick="window.location = 'javascript:history.go(-1)'">Back</button> -->
	</center>
</body>
</html>