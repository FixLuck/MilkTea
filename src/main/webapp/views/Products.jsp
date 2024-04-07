<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<div class="pro-header">
		Filter
			<!-- Example single danger button -->
		<c:set var="cid" value="${requestScope.cid}"></c:set>
		<form id="f1" action="/MilkTea/products">
			<select class="form-select" aria-label="Default select example" name="key" onchange="change()">
				<option value="0">All</option>
				<c:forEach items="${categories}" var="c">
					<option ${(cid == c.getCategoryId())?'selected':''} value="${c.getCategoryId()}">${c.getName()}</option>
				</c:forEach>
			</select>
		</form>
	</div>
	
	<div class="pro-body">
		<div class="container mt-4">
		  <h1 class="text-center mb-4">Categories</h1>
		  <div class="row">
			  <c:forEach items="${requestScope.products}" var="p">
				  <div class="col-md-4">
					  <div class="card mb-4">
						  <img src="/JAVA4_ASM/views/img/milktea1.jpg" class="card-img-top mx-auto d-block mt-3" alt="Product 1" style="width: 200px;">
						  <div class="card-body text-center">
							  <p class="card-text mb-1">${p.getProdName()}</p>
							  <h5 class="card-title mb-1">${p.getDescribe()}</h5>
							  <p class="card-text mb-2">${p.getPrice()}$</p>
							  <p class="quantity-in-stock">Quantity in stock: ${p.getStock()}</p>
							  <button class="btn btn-danger d-none" id="addToCartBtn1">Add to Cart</button>
						  </div>
					  </div>
				  </div>
			  </c:forEach>
		    <!-- Add more product cards here -->
		  </div>
		</div>
	</div>
	
	<div class="body-footer d-flex justify-content-center">
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true" style="color: red;">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#" style="color: red;">1</a></li>
		    <li class="page-item"><a class="page-link" href="#" style="color: red;">2</a></li>
		    <li class="page-item"><a class="page-link" href="#" style="color: red;">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true" style="color: red;">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>

</div>
</body>

<script>
  // Add event listeners to show "Add to Cart" button on mouseover
  var productCards = document.querySelectorAll('.card');
  productCards.forEach(function(card, index) {
    var addToCartBtn = card.querySelector('.btn-danger');
    var quantityInStock = card.querySelector('.quantity-in-stock');
    card.addEventListener('mouseover', function() {
      addToCartBtn.classList.remove('d-none');
      quantityInStock.classList.remove('d-none');
    });
    card.addEventListener('mouseout', function() {
      addToCartBtn.classList.add('d-none');
      quantityInStock.classList.add('d-none');
    });
  });
</script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function change() {
		document.getElementById("f1").submit();
	}
</script>
</html>