<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.4.1.js"></script>
<script src="js/bootstrap.js"></script>
<title>Dashboard</title>
<style>
body{
background:linear-gradient(rgba(255,255,255,.7),rgba(255,255,255,0.6)), url('images/bg2.jpg') no-repeat;min-height:100vh;
background-size:100% 100%;
}
a.list-group-item{
	background-color:rgba(255,255,255,0.4);
}
.list-group{
	min-height: 88.5vh;
    background-color: rgba(255,255,255,0.4);
}
</style>
</head>
<body>
<c:set var="url" value="<%= new UrlPathHelper().getOriginatingRequestUri(request) %>"></c:set>
<div class="jumbotron p-3 rounded-0 mb-0 text-center bg-dark text-white">
	<h5 class="float-left">Welcome ! ${sessionScope.uname }</h5>
	<a href="/logout" class="float-right btn btn-primary btn-sm">Logout</a>
	<h4>Welcome to Airport Portal</h4>
</div>
<div class="container-fluid">
	<div class="row">
		<% String url= new UrlPathHelper().getOriginatingRequestUri(request); %>
		<div class="col-sm-2 p-0" style="min-height:88.5vh;">
		<div class="list-group mt-2">
		<c:if test="${sessionScope.role== 'Admin' }">  
		  <a href="/dashboard" class="list-group-item list-group-item-action ${url eq '/dashboard'? 'active':'' }">Dashboard</a>
		  <a href="/managers" class="list-group-item list-group-item-action ${url eq '/managers'? 'active':'' }">Managers</a>
		  <a href="/planes" class="list-group-item list-group-item-action ${url eq '/planes'? 'active':'' }">Planes</a>
		  <a href="/pilots" class="list-group-item list-group-item-action ${url eq '/pilots'? 'active':'' }">Pilots</a>
		  <a href="/hangers" class="list-group-item list-group-item-action ${url eq '/hangers'? 'active':'' }">Hangers</a>
		 </c:if>
		 <c:if test="${sessionScope.role== 'Manager' }">
		  <a href="/allotment" class="list-group-item list-group-item-action ${url eq '/allotment'? 'active':'' }">Allotments</a>
		  <a href="/hangerstatus" class="list-group-item list-group-item-action ${url eq '/hangerstatus'? 'active':'' }">Status Check</a>
		 </c:if>		 
		</div>
		</div>
		<div class="col-sm-10 p-2">
			<div class="card shadow" style="background-color:rgba(255,255,255,0.4)">
				<div class="card-body" style="min-height:88.5vh;">
				
				