<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<style>
.form-group{
	padding:0px;
	margin:8px!important;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
	<h4 class="p-2" style="border-bottom:2px solid green;">Hangar Registration</h4>
	<div class="row">
		<div class="col-sm-6 mx-auto">
		<c:if test="${error ne null }">
						<div class="alert alert-danger font-weight-bold text-center mt-2">
							${error}
						</div>
					</c:if>			
			<form method="post">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Location</label>
					<div class="col-sm-8">
						<input type="text" name="location" required class="form-control" pattern="[A-Za-z ]{3,15}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Capacity</label>
					<div class="col-sm-8">
						<input type="number" min="1" name="capacity" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Email Id</label>
					<div class="col-sm-8">
						<input type="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Manager Name</label>
					<div class="col-sm-8">
						<input type="text" name="uname" id="uname" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">SSN</label>
					<div class="col-sm-8">
						<input type="text" name="ssn" id="ssn" maxlength="10" required class="form-control">
					</div>
				</div>
				
				
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">House no</label>
					<div class="col-sm-8">
						<input type="text" name="houseno" id="houseno" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Address Line</label>
					<div class="col-sm-8">
						<input type="text" name="line1" id="line1" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">City</label>
					<div class="col-sm-8">
						<input type="text" name="city" id="city" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">State</label>
					<div class="col-sm-8">
						<input type="text" name="state" id="state" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Country</label>
					<div class="col-sm-8">
						<input type="text" name="country" id="country" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Pin no</label>
					<div class="col-sm-8">
						<input type="text" name="pinno" id="pinno" maxlength="7" pattern="[0-9]{7,7}" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Contact Number</label>
					<div class="col-sm-8">
						<input type="text" name="mobileno" id="mobileno" maxlength="10" required class="form-control" pattern="[0-9]{10,10}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Date of Birth</label>
					<div class="col-sm-8">
						<input type="date" name="dob" id="dob" required class="form-control">
					</div>
				</div>								
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Gender</label>
					<div class="col-sm-8">
						<select name="gender" id="gender" required class="form-control">	
							<option value="">Select Gender</option>
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Password</label>
					<div class="col-sm-8">
						<input type="password" name="pwd" class="form-control" placeholder="Password for new Manager">
					</div>
				</div>
				
				<button class="btn btn-primary float-right mr-3">Save Hanger</button>
				<input type="reset" class="btn btn-info float-right mr-2" value="Reset">
			</form>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$(function(){
	$("#email").change(function(){
		let id=$(this).val();
		$.ajax({
			type:'get',
			url:'/finduser/'+id+'?role=Manager',
			success:function(resp){
				console.log(resp)
				if(resp){
				$("#pinno").val(resp.address.pinno)
				$("#city").val(resp.address.city)
				$("#state").val(resp.address.state)				
				$("#country").val(resp.address.country)				
				$("#pinno").val(resp.address.pinno)				
				$("#uname").val(resp.uname)				
				$("#line1").val(resp.address.line1)				
				$("#houseno").val(resp.address.houseno)
				$("#mobileno").val(resp.mobileno)
				$("#ssn").val(resp.ssn)
				$("#dob").val(resp.dob)
				$("#gender").val(resp.gender)
				}else{
					$("#pinno").val("")
					$("#city").val("")
					$("#state").val("")				
					$("#country").val("")				
					$("#pinno").val("")				
					$("#uname").val("")				
					$("#line1").val("")	
					$("#houseno").val("")	
					$("#mobileno").val("")	
					$("#ssn").val("")	
					$("#gender").val("")	
				}
			},
			error: function(err){
					
			}
		});
	});
});
</script>