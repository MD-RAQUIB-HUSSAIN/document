<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<h4 class="p-2" style="border-bottom:2px solid green;">Hangar Status Check</h4>
	<form>
			<div class="form-group form-row">
				<label class="col-sm-2 col-form-label">From Date</label>
				<div class="col-sm-3">
					<input type="date" name="fromdate" value="${param.fromdate }" required class="form-control">
				</div>
				<label class="col-sm-2 col-form-label">To Date</label>
				<div class="col-sm-3">
					<input type="date" name="todate" value="${param.todate }" required class="form-control">
				</div>
				<div class="col-sm-2">
			<button class="btn btn-success float-right">Get
				Hangar Status</button>
				</div>
			</div>
		</form>
	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered table-sm">
		<thead class="table-dark">
			<tr>
				<th>Hangar ID</th>
				<th>Location</th>
				<th>Capacity</th>
				<th>Available</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.id }</td>
				<td>${m.location }</td>
				<td>${m.capacity }</td>
				<td>${m.available }</td>
			</tr>
		</c:forEach>
		</tbody>
</table>
<jsp:include page="footer.jsp"></jsp:include>
