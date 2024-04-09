<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="views/style.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
</head>

<body>
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

            <c:set var="a" value="${sessionScope.account}"/>
            <c:choose>

                <c:when test="${a != null}">
                    Hi, ${a.getUserName()}
                    <a href="logout" class="btn btn-danger">
                        <i class="fa-solid fa-right-from-bracket"></i> &nbsp; Logout
                    </a>
                    <c:if test="${a.getRolesByRoleId().getRoleName() == 'admin'}">
                        <a href="#" class="btn btn-secondary">
                            <i class="fa-solid fa-mug-saucer"></i> &nbsp; Manager
                        </a>
                        <button class="btn btn-primary">Manager</button>

                    </c:if>
                </c:when>

                <c:otherwise>
                    <a class="btn btn-light" href="login">
                        <i class="fa-solid fa-user"></i> &nbsp; Login/Register
                    </a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="views/img/logo-milktea.jpg" alt="Logo" width="50" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
                aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="products">Products</a>
                </li>

            </ul>
            <form class="d-flex me-3" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <c:set var="size" value="${sessionScope.size}"/>
            <a class="btn btn-primary position-relative" href="process">
                <i class="fa-solid fa-cart-shopping"></i>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        ${size}
                    <span class="visually-hidden">unread messages</span>
                </span>
            </a>
        </div>
    </div>
</nav>

<section class="h-100" style="background-color: #eee;">
    <div class="container h-100 py-5">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
                </div>
                <c:set var="o" value="${sessionScope.cart}"/>
                <c:forEach items="${o.items}" var="i">
                    <div class="card rounded-3 mb-4">
                        <div class="card-body p-4">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="col-md-2 col-lg-2 col-xl-2">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                         class="img-fluid rounded-3" alt="Cotton T-shirt">
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                    <p class="lead fw-normal mb-2">${i.getProduct().getProdName()}</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                    <button class="btn btn-link px-2">
                                        <a href="process?num=-1&id=${i.getProduct().getProductId()}">
                                            <i class="fas fa-minus"></i>
                                        </a>
                                    </button>

                                    <input id="1" min="0" name="quantity" value="${i.getQuantity()}" type="number"
                                           readonly
                                           class="form-control form-control-sm"/>

                                    <button class="btn btn-link px-2">
                                        <a href="process?num=1&id=${i.getProduct().getProductId()}">
                                            <i class="fas fa-plus"></i>
                                        </a>
                                    </button>
                                </div>
                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                    <h5 class="mb-0">${i.getQuantity() * i.getPrice()}</h5>
                                </div>
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <form action="process" method="post">
                                        <input type="hidden" name="id" value="${i.getProduct().getProductId()}">
                                        <button class="btn text-danger">
                                            <i class="fas fa-trash fa-lg"></i>
                                        </button>
                                    </form>
<%--                                    <a href="#!" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <form action="/MilkTea/checkout"  method="post">
                    <div class="card d-flex justify-content-end">
                        <div class="card-body">
                            <button type="button" class="btn btn-warning btn-block btn-lg">Proceed to Pay</button>
                        </div>
                    </div>
                </form>



            </div>
        </div>
    </div>
</section>

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
                        <p class="mb-0">Made with <i class="lni-heart mr-1"></i>by<a class="ml-1"
                                                                                     href="https://wrapbootstrap.com/user/DesigningWorld">Designing
                            World</a></p>
                    </div>
                    <!-- Footer Social Area-->
                    <div class="footer_social_area"><a href="#" data-toggle="tooltip" data-placement="top" title=""
                                                       data-original-title="Facebook"><i class="fa fa-facebook"></i></a><a
                            href="#" data-toggle="tooltip" data-placement="top" title=""
                            data-original-title="Pinterest"><i class="fa fa-pinterest"></i></a><a href="#"
                                                                                                  data-toggle="tooltip"
                                                                                                  data-placement="top"
                                                                                                  title=""
                                                                                                  data-original-title="Skype"><i
                            class="fa fa-skype"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title=""
                                                           data-original-title="Twitter"><i
                            class="fa fa-twitter"></i></a></div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/d6475f53e9.js" crossorigin="anonymous"></script>

</html>