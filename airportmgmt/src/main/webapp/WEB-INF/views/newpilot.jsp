<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<style>
.form-group{
	padding:0px;
	margin:8px!important;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
	<h4 class="p-2" style="border-bottom:2px solid green;">Pilot Registration</h4>
	<div class="row">
		<div class="col-sm-6 mx-auto">	
		<c:if test="${error ne null }">
			<div class="alert alert-danger font-weight-bold text-center mt-2">
				${error}
			</div>
		</c:if>	
			<form method="post">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Pilot Name</label>
					<div class="col-sm-8">
						<input type="text" name="uname" required class="form-control" pattern="[A-Za-z ]{3,15}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">SSN</label>
					<div class="col-sm-8">
						<input type="text" name="ssn" required class="form-control" maxlength="10">
					</div>
				</div>				
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">License No</label>
					<div class="col-sm-8">
						<input type="text" name="licno" maxlength="10" pattern="[0-9]{10,10}" required class="form-control">
					</div>
				</div>
				
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Email Id</label>
					<div class="col-sm-8">
						<input type="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" required class="form-control">
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
						<input type="text" name="pinno" maxlength="7" pattern="[0-9]{7,7}" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Contact Number</label>
					<div class="col-sm-8">
						<input type="text" name="mobileno" maxlength="10" required class="form-control" pattern="[0-9]{10,10}">
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
						<select name="gender" required class="form-control">	
							<option value="">Select Gender</option>
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
				</div>
				
				
				<button class="btn btn-primary float-right mr-3">Save Pilot</button>
				<input type="reset" class="btn btn-info float-right mr-2" value="Reset">
			</form>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
