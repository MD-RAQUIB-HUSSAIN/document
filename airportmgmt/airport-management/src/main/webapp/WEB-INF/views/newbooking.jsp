<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<style>
.form-group {
	padding: 0px;
	margin: 8px !important;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<h4 class="p-2" style="border-bottom: 2px solid green;">Allotment
	Registration</h4>
<div class="row">
	<div class="col-sm-6 mx-auto">
		<form>
			<div class="form-row form-group">
				<label class="col-sm-4 col-form-label">From Date</label>
				<div class="col-sm-8">
					<input type="date" name="fromdate" value="${param.fromdate }" required class="form-control">
				</div>
			</div>
			<div class="form-row form-group">
				<label class="col-sm-4 col-form-label">To Date</label>
				<div class="col-sm-8">
					<input type="date" name="todate" value="${param.todate }" required class="form-control">
				</div>
			</div>
			<button class="btn btn-success float-right">Search Available
				Hanger</button>
		</form>
		<div class="clearfix"></div>
		<c:if test="${hfound }">
			<form method="post">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Select Hanger</label>
					<div class="col-sm-8">
						<select name="hanger" required class="form-control">
							<option value="">Select Hanger</option>
							<c:forEach items="${hlist }" var="p">
								<option value="${p.id }">${p.id } | ${p.location }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Select Plane</label>
					<div class="col-sm-8">
						<select name="plane" required class="form-control">
							<option value="">Select Plane</option>
							<c:forEach items="${plist }" var="p">
								<option value="${p.plainid }">${p.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<button class="btn btn-primary float-right mr-3">Book
					Hanger</button>
			</form>
		</c:if>
		
		<c:if test="${no }">
			<h5 class="text-danger">No hanger available for this date range</h5>
		</c:if>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$(function(){
	document.querySelector("#dob").max=new Date().toISOString().slice(0, -14);
	$("#email").change(function(){
		let id=$(this).val();
		$.ajax({
			type:'get',
			url:'/finduser/'+id+'?role=Owner',
			success:function(resp){
				console.log(resp)
				$("#ins_amount").val(resp.insurance_amount)
				$("#ins_type").val(resp.insurance_type)
				$("#max_amount").val(resp.max_claim_amount)				
			}
		});
	});
});
</script>