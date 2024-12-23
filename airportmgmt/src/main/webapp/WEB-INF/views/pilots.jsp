<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header.jsp"></jsp:include>
<a href="/newpilot" class="float-right btn btn-primary btn-sm">New Pilot</a>
	<h4 class="p-2" style="border-bottom:2px solid green;">Pilots List</h4>
	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered table-sm">
		<thead class="table-dark">
			<tr>
				<th>Name</th>
				<th>Address</th>
				<th>City</th>
				<th>State</th>
				<th>Gender</th>
				<th>Phone</th>
				<th>Pilot ID</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.pilot.uname }</td>
				<td>${m.pilot.address.line1 }</td>
				<td>${m.pilot.address.city }</td>
				<td>${m.pilot.address.state } - ${m.pilot.address.country }</td>
				<td>${m.licno }</td>
				<td>${m.pilot.mobileno }</td>
				<td>${m.id }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<jsp:include page="footer.jsp"></jsp:include>