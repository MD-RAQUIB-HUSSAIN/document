<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header.jsp"></jsp:include>
<a href="/newplane" class="float-right btn btn-primary btn-sm">New Plane</a>
	<h4 class="p-2" style="border-bottom:2px solid green;">Planes List</h4>
	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered table-sm">
		<thead class="table-dark">
			<tr>
				<th>Plane ID</th>
				<th>Name</th>
				<th>Manufacturer</th>
				<th>Modelno</th>
				<th>Reg. No</th>
				<th>Owner Email</th>
				<th>Owner Name</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.plainid }</td>
				<td>${m.name }</td>
				<td>${m.mfname }</td>
				<td>${m.modelno }</td>
				<td>${m.regno}</td>
				<td>${m.owner.userid }</td>
				<td>${m.owner.uname }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
<jsp:include page="footer.jsp"></jsp:include>