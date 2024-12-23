<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Home Page</title>
<style>
body{
min-height:100vh;
background-repeat:no-repeat;
background:linear-gradient(rgba(255,255,255,.7),rgba(255,255,255,.7)),url('images/bg2.jpg') no-repeat fixed center;
background-size:100% 100%;
}
</style>
</head>
<body>
<div class="jumbotron rounded-0 p-2 text-center text-white shadow" style="background-color:rgba(33,33,33,0.3)">
	<h4>Airport Management - Manager Registration</h4>
</div>
<div class="container">
	<div class="row">	
		<div class="col-sm-6 mx-auto">
			<div class="card shadow bg-transparent mt-3">
				<div class="card-body">
					<form method="post">
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Manager Name</label>
					<div class="col-sm-8">
						<input type="text" name="uname" required class="form-control" pattern="[A-Za-z ]{3,15}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">SSN</label>
					<div class="col-sm-8">
						<input type="text" name="ssn" maxlength="10" required class="form-control" pattern="[0-9]{10,10}">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Date of Birth</label>
					<div class="col-sm-8">
						<input type="date" name="dob" id="dob" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">House no</label>
					<div class="col-sm-8">
						<input type="text" name="houseno" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Address Line</label>
					<div class="col-sm-8">
						<input type="text" name="line1" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">City</label>
					<div class="col-sm-8">
						<input type="text" name="city" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">State</label>
					<div class="col-sm-8">
						<input type="text" name="state" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Country</label>
					<div class="col-sm-8">
						<input type="text" name="country" required class="form-control">
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
					<label class="col-sm-4 col-form-label">Gender</label>
					<div class="col-sm-8">
						<select name="gender" required class="form-control">	
							<option value="">Select Gender</option>
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Email Id</label>
					<div class="col-sm-8">
						<input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" required class="form-control">
					</div>
				</div>
				<div class="form-row form-group">
					<label class="col-sm-4 col-form-label">Password</label>
					<div class="col-sm-8">
						<input type="password" name="pwd" required class="form-control">
					</div>
				</div>
				<button class="btn btn-primary float-right mr-3">Register</button>
				<input type="reset" class="btn btn-info float-right mr-2" value="Reset">
			</form>
					<div class="clearfix"></div>
					<c:if test="${error ne null }">
						<div class="alert alert-danger font-weight-bold text-center mt-2">
							${error}
						</div>
					</c:if>
					
					<c:if test="${msg ne null }">
						<div class="alert alert-success font-weight-bold text-center mt-2">
							${msg }
						</div>			
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>