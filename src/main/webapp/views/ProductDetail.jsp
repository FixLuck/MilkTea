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
    <!-- Product Image -->
	    <div class="col-sm-4">
	      <img src="/JAVA4_ASM/views/img/milktea1.jpg" style="width: 300px;" class="img-fluid" alt="Product Image">
	    </div>
	    <!-- Product Details -->
	    <div class="col-sm-8">
	      <div class="row mt-5">
	        <!-- Main Details -->
	        <div class="col-sm-9">
	          <h2>Traditional</h2>
	          <p>
	            <span>⭐⭐⭐⭐⭐</span>
	            <span>100 reviews</span> |
	            <span>Milk Tea</span>
	          </p>
	          <p>Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
	          <h3>$1.99</h3>
	          <br>
	          <hr>
	          <br>
	          <a href="#" style="color: red !important">3-DAY SHIPPING</a>
	          <br>
	          <a>FREE PICKUP TODAY</a>
	        </div>
	        <!-- Quantity and Add to Cart -->
	        <div class="col-sm-3">
	          <div class="input-group mb-3">
	            <button class="btn btn-outline-secondary" type="button" id="button-minus">-</button>
	            <input type="text" class="form-control text-center" value="1" aria-label="Product quantity">
	            <button class="btn btn-outline-secondary" type="button" id="button-plus">+</button>
	          </div>
	          <hr>
	          <button class="btn btn-danger w-100">Add to Cart</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>

<script>
  document.getElementById('button-minus').addEventListener('click', function() {
    let input = this.nextElementSibling;
    let currentValue = parseInt(input.value, 10);
    if (currentValue > 1) {
      input.value = currentValue - 1;
    }
  });

  document.getElementById('button-plus').addEventListener('click', function() {
    let input = this.previousElementSibling;
    let currentValue = parseInt(input.value, 10);
    input.value = currentValue + 1;
  });
</script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

</html>