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
	crossorigin="anonymous"/>
	<link rel="stylesheet" href="views/style.css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/d6475f53e9.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<div class="header">
		<div class="container-fluild p-2">
			<div class="container d-flex justify-content-between">
				<div class="left-header d-flex">
					<p class="text-white me-3">
						<i class="fa-regular fa-envelope"></i>
						Organic@company.com
					</p>
					<p class="text-white">
						Free Shipping for all Order of $99
					</p>
				</div>

				<div class="right-header d-flex">
					<button class="btn text-white">
						<i class="fa-solid fa-user"></i> &nbsp;
						Login/Register
					</button>
				</div>

			</div>
		</div>
	</div>

	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="#">
				<img src="views/img/logo-milktea.jpg" alt="Logo" width="50" height="50">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">Home</a>
					</li>
					<li class="nav-item">
						<div class="dropdown">
							<a href="/products">
								<button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
									Product
								</button></a>
						</div>
					</li>

				</ul>
				<form class="d-flex me-3" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<form action="/MilkTea/process" method="get">
					<button formaction="" class="btn btn-primary">
						<i class="fa-solid fa-cart-shopping"></i>
					</button>
				</form>

			</div>
		</div>
	</nav>

	<div class="pro-header">
		Filter
		<!-- Example single danger button -->
		<c:set var="cid" value="${sessionScope.cid}"></c:set>
		<form id="f1" action="/MilkTea/products">
			<select class="form-select" aria-label="Default select example" name="key" onchange="change()">
				<option value="0">All</option>
				<c:forEach items="${sessionScope.categories}" var="c">
					<option ${(cid == c.getCategoryId())?'selected':''} value="${c.getCategoryId()}">${c.getName()}</option>
				</c:forEach>
			</select>
		</form>
	</div>

	<div class="pro-body">
		<div class="container mt-4">
			<h1 class="text-center mb-4">Categories</h1>
			<div class="row">
				<c:forEach items="${sessionScope.products}" var="p">
					<div class="col-md-4">
						<form id="addToCartBtn1" action="/MilkTea/buy" method="post">
							<input type="hidden" name="num" value="1">
							<div class="card mb-4">
								<img src="/JAVA4_ASM/views/img/milktea1.jpg" class="card-img-top mx-auto d-block mt-3" alt="Product 1" style="width: 200px;">
								<div class="card-body text-center">
									<p class="card-text mb-1">${p.getProdName()}</p>
									<h5 class="card-title mb-1">${p.getDescribe()}</h5>
									<p class="card-text mb-2">${p.getPrice()}$</p>
									<p class="quantity-in-stock">Quantity in stock: ${p.getStock()}</p>
									<button type="submit" class="btn btn-danger d-none" onclick="buy(${p.getProductId()})">Add to Cart</button>
								</div>
							</div>
						</form>
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

	<footer class="footer_area section_padding_130_0 mt-5">
		<div class="container">
			<div class="row">
				<!-- Single Widget-->
				<div class="col-12 col-sm-6 col-lg-4">
					<div class="single-footer-widget section_padding_0_130">
						<!-- Footer Logo-->
						<div class="footer-logo mb-3"></div>
						<p>Appland is completely creative, lightweight, clean app landing page.</p>
						<!-- Copywrite Text-->
						<div class="copywrite-text mb-5">
							<p class="mb-0">Made with <i class="lni-heart mr-1"></i>by<a class="ml-1" href="https://wrapbootstrap.com/user/DesigningWorld">Designing World</a></p>
						</div>
						<!-- Footer Social Area-->
						<div class="footer_social_area"><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest"><i class="fa fa-pinterest"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Skype"><i class="fa fa-skype"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></div>
					</div>
				</div>
				<!-- Single Widget-->
				<div class="col-12 col-sm-6 col-lg">
					<div class="single-footer-widget section_padding_0_130">
						<!-- Widget Title-->
						<h5 class="widget-title">About</h5>
						<!-- Footer Menu-->
						<div class="footer_menu">
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Corporate Sale</a></li>
								<li><a href="#">Terms &amp; Policy</a></li>
								<li><a href="#">Community</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Single Widget-->
				<div class="col-12 col-sm-6 col-lg">
					<div class="single-footer-widget section_padding_0_130">
						<!-- Widget Title-->
						<h5 class="widget-title">Support</h5>
						<!-- Footer Menu-->
						<div class="footer_menu">
							<ul>
								<li><a href="#">Help</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Term &amp; Conditions</a></li>
								<li><a href="#">Help &amp; Support</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Single Widget-->
				<div class="col-12 col-sm-6 col-lg">
					<div class="single-footer-widget section_padding_0_130">
						<!-- Widget Title-->
						<h5 class="widget-title">Contact</h5>
						<!-- Footer Menu-->
						<div class="footer_menu">
							<ul>
								<li><a href="#">Call Centre</a></li>
								<li><a href="#">Email Us</a></li>
								<li><a href="#">Term &amp; Conditions</a></li>
								<li><a href="#">Help Center</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>



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

	function buy(id) {
		let form = document.getElementById("addToCartBtn1");
		form.action = "buy?id=" + id;
		form.submit();
	}

</script>
</html>