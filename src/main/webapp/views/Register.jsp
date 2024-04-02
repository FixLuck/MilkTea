<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>	
	<div class="container mt-5">
		<div class="row"> 
			<div class="col-sm-6">
				<form class="row needs-validation" novalidate>
					  <div class="col-md-8">
					    <label for="validationTooltipUsername" class="form-label">Username</label>
					    <div class="input-group has-validation">
					      <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
					      <input type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" required>
					      <div class="invalid-tooltip">
					        Please choose a unique and valid username.
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-md-8 mt-3">
					    <label for="validationTooltipPassword" class="form-label">Password</label>
					    <div class="input-group has-validation">
					      <input type="text" class="form-control" id="validationTooltipPassword" aria-describedby="validationTooltipPasswordPrepend" required>
					      <div class="invalid-tooltip">
					        Please choose a unique and valid password.
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-md-5 mt-3">
					  	<label for="validationTooltipGender" class="form-label">Gender</label>
					    <select class="form-select" required aria-label="select example">
					      <option value="">Choose your gender</option>
					      <option value="1">Male</option>
					      <option value="2">Female</option>
					      <option value="3">Others</option>
					    </select>
					    <div class="invalid-tooltip">Please choose your gender.</div>
					  </div>
					  	  
					  <div class="col-md-8 mt-3">
					    <label for="validationTooltip03" class="form-label">City</label>
					    <input type="text" class="form-control" id="validationTooltip03" required>
					    <div class="invalid-tooltip">
					      Please provide a valid city.
					    </div>
					  </div>
					  <div class="col-12 mt-3">
					    <button class="btn btn-danger" type="submit">Submit form</button>
					  </div>
				</form>
			</div>
			<div class="col-sm-6 mt-5">
				<div class="border 1xp solid black p-5">
						<div class="row d-flex justify-content-center text-center">
							<h1>ALREADY HAVE ACCOUNT?</h1>
							<button type="submit" class="btn btn-danger mt-4" style="width: 300px; font-size: 25px">SIGN IN</button>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</html>