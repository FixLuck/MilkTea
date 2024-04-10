<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2>Milk Tea Products Management</h2>
    <div class="text-right mb-3">
        <button type="button" class="btn btn-success" onclick="showAddProductModal()">Add New Product</button>
    </div>
    <div class="alert">
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
    </div>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Description</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Dynamic content will be inserted here -->
        <c:forEach var="products" items="${products}">
            <tr>
                <th scope="row">${products.productId}</th>
                <td>${products.prodName}</td>
                <td>${products.price}</td>
                <td>${products.describe}</td>
                <td>
                    <a class="btn btn-primary edit-product" onclick="showEditProductModal(${products.productId});">
                        Edit
                    </a>

                        <%--	<button type="button" class="btn btn-primary" onclick="showEditProductModal()">Edit</button>--%>
                    <a class="btn btn-danger" onclick="deleteProduct(${products.productId})">
                        Delete
                    </a>
                        <%--                        <button type="button" class="btn btn-danger" onclick="deleteProduct()">Delete</button>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<!-- Modal for Add New Product -->
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="admin/creat" method="POST">
                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" class="form-control" id="productName" required>
                    </div>
                    <div class="form-group">
                        <label for="productPrice">Price</label>
                        <input type="number" class="form-control" id="productPrice" required>
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Description</label>
                        <textarea class="form-control" id="productDescription" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close
                </button>
                <button type="button" class="btn btn-primary" onclick="addProduct()">Save</button>
            </div>
        </div>
    </div>
</div>


<c:set var="p" value="${requestScope.productById}"/>
<!-- Modal for Edit Product -->
<form id="editProductForm" action="admin/update" method="POST">
    <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="editProductId">Product ID</label>
                        <input type="text" class="form-control" id="editProductId" value="${p.productId}" readonly
                               name="productId">
                    </div>
                    <div class="form-group">
                        <label for="editProductName">Product Name</label>
                        <input type="text" class="form-control" id="editProductName" required value="${p.prodName}"
                               name="prodName">
                    </div>
                    <div class="form-group">
                        <label for="editProductPrice">Price</label>
                        <input type="number" class="form-control" id="editProductPrice" required value="${p.price}"
                               name="price">
                    </div>
                    <div class="form-group">
                        <label for="editProductStock">Stock</label>
                        <input type="number" class="form-control" id="editProductStock" required value="${p.stock}"
                               name="stock">
                    </div>
                    <div class="form-group">
                        <label for="editProductDescription">Description</label>
                        <input type="text" class="form-control" id="editProductDescription" rows="3"
                               value="${p.describe}" name="describe"/>
                    </div>
                    <div class="form-group">
                        <label for="editProductImages">Images</label>
                        <input type="text" class="form-control" id="editProductImages" value="${p.images}"
                               name="images">
                    </div>
                    <div class="form-group">
                        <label for="editProductCreateDate">Create Date</label>
                        <input type="date" class="form-control" id="editProductCreateDate" value="${p.createDate}"
                               name="createDate">
                    </div>
                    <div class="form-group">
                        <label for="editProductCategoryId">Category ID</label>
                        <input type="text" class="form-control" id="editProductCategoryId" readonly
                               value="${p.categoriesByCategoryId.categoryId}" name="prodId">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close
                    </button>
                    <button formaction="admin/update" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
</form>


<script type="text/javascript">
    //Function to show Add Product modal
    function showAddProductModal(productId) {
        $('#addProductModal').modal('show');
    }

    // Function to show Edit Product modal with productId as parameter
    // function showEditProductModal(productId) {
    //
    // 	// Thay đổi URL
    // 	window.location.href = '/MilkTea/admin/edit/?productId=' + productId;
    //
    // 	// Hiển thị modal
    // 	$('#editProductModal').modal('show');
    // }

    function showEditProductModal(productId) {
        // Lưu productId vào localStorage
        localStorage.setItem('productIdForModal', productId);

        // Thay đổi URL
        window.location.href = '/MilkTea/admin/edit/?productId=' + productId;
    }

    // Trong phần JavaScript của trang sau khi tải lại
    $(document).ready(function () {
        var productIdForModal = localStorage.getItem('productIdForModal');
        if (productIdForModal) {
            // Hiển thị modal
            $('#editProductModal').modal('show');

            // Xóa productId khỏi localStorage để không bị hiển thị modal mỗi khi tải lại trang
            localStorage.removeItem('productIdForModal');
        }
    });

    function deleteProduct(productId) {
        window.location.href = '/MilkTea/admin/delete/?productId=' + productId;
    }

    function closeModal() {
        $('.modal').modal('hide'); // Hide all open modals
    }


</script>

</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</html>