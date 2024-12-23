<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header.jsp"></jsp:include>
<a href="/newallotment" class="float-right btn btn-primary btn-sm">New Allotment</a>
	<h4 class="p-2" style="border-bottom:2px solid green;">Allotment List</h4>
	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered table-sm">
		<thead class="table-dark">
			<tr>
				<th>Plane Name</th>
				<th>Plane Id</th>
				<th>Hanger Location</th>
				<th>From date</th>
				<th>To date</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.plane.name }</td>
				<td>${m.plane.plainid }</td>
				<td>${m.hanger.location }</td>
				<td>${m.fromdate }</td>
				<td>${m.todate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<jsp:include page="footer.jsp"></jsp:include>