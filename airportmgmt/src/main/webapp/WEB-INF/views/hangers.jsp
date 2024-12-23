<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header.jsp"></jsp:include>
<a href="/newhanger" class="float-right btn btn-primary btn-sm">New Hangars</a>
	<h4 class="p-2" style="border-bottom:2px solid green;">Hangars List</h4>
	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered table-sm">
		<thead class="table-dark">
			<tr>
				<th>Location</th>
				<th>Capacity</th>
				<th>Manager Name</th>
				<th>City</th>
				<th>State</th>
				<th>Phone</th>
				<th>Hangar ID</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.location }</td>
				<td>${m.capacity }</td>
				<td>${m.manager.uname }</td>
				<td>${m.manager.address.city }</td>
				<td>${m.manager.address.state } - ${m.manager.address.country }</td>
				<td>${m.manager.mobileno }</td>
				<td>${m.id }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<jsp:include page="footer.jsp"></jsp:include>