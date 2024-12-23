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
<div class="jumbotron rounded-0 text-center text-white shadow" style="background-color:rgba(33,33,33,0.3)">
	<h4>Airport Management</h4>
</div>
<div class="container">
	<div class="row">	
		<div class="col-sm-5 mx-auto">
			<div class="card shadow bg-transparent mt-3">
				<div class="card-body">
					<h4 class="p-2 text-center">Login Screen</h4>
					<form method="post">
						<div class="form-group form-row">
							<label class="col-sm-4 col-form-label">User ID</label>
							<div class="col-sm-8">
								<input type="text" required class="form-control" name="userid" placeholder="User Id">
							</div>
						</div>
						
						<div class="form-group form-row">
							<label class="col-sm-4 col-form-label">Password</label>
							<div class="col-sm-8">
								<input type="password" required class="form-control" name="pwd" placeholder="Password">
							</div>
						</div>
						
						<div class="form-group form-row">
							<label class="col-sm-4 col-form-label">Role</label>
							<div class="col-sm-8">
								<select required class="form-control" name="role">
									<option>Admin</option>
									<option>Manager</option>
								</select>
							</div>
						</div>
						
						<button class="btn btn-danger px-5 float-right">Login</button>
					</form>
					<div class="clearfix"></div>
					
					<a href="/register">Register as manager</a>
					
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