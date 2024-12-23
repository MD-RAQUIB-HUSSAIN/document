<jsp:include page="header.jsp"></jsp:include>
	<h4 class="p-2" style="border-bottom:2px solid green;">Welcome to Admin Dashboard</h4>	
	<div class="row text-white text-right">
		<div class="col-sm-3">
			<div class="card shadow bg-primary">
				<div class="card-body">
					<h5>Planes</h5>
					<h4>${members }</h4>
				</div>
			</div>
		</div>
		
		<div class="col-sm-3">
			<div class="card shadow bg-info">
				<div class="card-body">
					<h5>Pilots</h5>
					<h4>${claims }</h4>
				</div>
			</div>
		</div>
		
		
		<div class="col-sm-3">
			<div class="card shadow bg-danger">
				<div class="card-body">
					<h5>Hangers</h5>
					<h4>${pendings }</h4>
				</div>
			</div>
		</div>		
	</div>
<jsp:include page="footer.jsp"></jsp:include>