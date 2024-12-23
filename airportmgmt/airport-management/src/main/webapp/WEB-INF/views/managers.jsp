<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header.jsp"></jsp:include>
	<h4 class="p-2" style="border-bottom:2px solid green;">Managers List</h4>
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
				<th>Manager ID</th>
				<th>Email</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.uname }</td>
				<td>${m.address.line1 }</td>
				<td>${m.address.city }</td>
				<td>${m.address.state } - ${m.address.country }</td>
				<td>${m.gender }</td>
				<td>${m.mobileno }</td>
				<td>${m.managerid } </td>
				<td>${m.userid }</td>
				<td>${m.pwd } </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<jsp:include page="footer.jsp"></jsp:include>