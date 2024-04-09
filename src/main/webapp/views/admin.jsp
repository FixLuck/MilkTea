<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <c:forEach var="product" items="${products}">
                <tr>
                    <th scope="row">${product.id}</th>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.description}</td>
                    <td>
                        <button type="button" class="btn btn-primary" onclick="showEditProductModal(1 /* productId */)">Edit</button>
                        <button type="button" class="btn btn-danger">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


		<!-- Modal for Add New Product -->
            <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
			            </div>
			            <div class="modal-body">
			                <form id="addProductForm">
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
			                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
			                <button type="button" class="btn btn-primary" onclick="addProduct()">Save</button>
			            </div>
			        </div>
			    </div>
			</div>

		<!-- Modal for Edit Product -->
            <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
			            </div>
			            <div class="modal-body">
			                <form id="editProductForm">
			                    <div class="form-group">
			                        <label for="editProductId">Product ID</label>
			                        <input type="text" class="form-control" id="editProductId" readonly>
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductName">Product Name</label>
			                        <input type="text" class="form-control" id="editProductName" required>
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductPrice">Price</label>
			                        <input type="number" class="form-control" id="editProductPrice" required>
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductStock">Stock</label>
			                        <input type="number" class="form-control" id="editProductStock" required>
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductDescription">Description</label>
			                        <textarea class="form-control" id="editProductDescription" rows="3" required></textarea>
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductImages">Images</label>
			                        <input type="text" class="form-control" id="editProductImages">
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductCreateDate">Create Date</label>
			                        <input type="text" class="form-control" id="editProductCreateDate" readonly>
			                    </div>
			                    <div class="form-group">
			                        <label for="editProductCategoryId">Category ID</label>
			                        <input type="text" class="form-control" id="editProductCategoryId">
			                    </div>
			                </form>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
			                <button type="button" class="btn btn-primary" onclick="updateProduct()">Save</button>
			            </div>
			        </div>
			    </div>
			</div>


<script type="text/javascript">
	//Function to show Add Product modal
	function showAddProductModal() {
	    $('#addProductModal').modal('show');
	}
	
	// Function to show Edit Product modal with productId as parameter
	function showEditProductModal(productId) {
	    // Populate edit form here if needed based on productId
	    $('#editProductModal').modal('show');
	}
	
	//Function for Adding Products
	function addProduct() {
    var productName = document.getElementById('productName').value;
    var productPrice = document.getElementById('productPrice').value;
    var productDescription = document.getElementById('productDescription').value;

    var productData = {
        name: productName,
        price: productPrice,
        description: productDescription
    };

	    // Send AJAX POST request to server
	    $.ajax({
	        type: 'POST',
	        url: '/api/products', // Replace with your API endpoint
	        contentType: 'application/json',
	        data: JSON.stringify(productData),
	        success: function(response) {
	            // Handle success response (e.g., close modal, refresh product list)
	            $('#addProductModal').modal('hide');
	            // Call a function to update product list on the page
	            fetchProducts(); // Example function to fetch and display products
	        },
	        error: function(error) {
	            // Handle error response (e.g., display error message)
	            console.error('Error adding product:', error);
	        }
	    });
	}
	
	//Function for Editting Products
	function populateEditForm(productId) {
	    // Fetch product details based on productId from your backend
	    $.get('/api/products/' + productId, function(product) {
	        // Populate form fields with product data
	        document.getElementById('editProductId').value = product.productId;
	        document.getElementById('editProductName').value = product.name;
	        document.getElementById('editProductPrice').value = product.price;
	        document.getElementById('editProductStock').value = product.stock;
	        document.getElementById('editProductDescription').value = product.description;
	        document.getElementById('editProductImages').value = product.images;
	        document.getElementById('editProductCreateDate').value = product.createDate;
	        document.getElementById('editProductCategoryId').value = product.categoryId;

	        // Show edit modal
	        $('#editProductModal').modal('show');
	    });
	}

	function updateProduct() {
	    var productId = document.getElementById('editProductId').value;
	    var updatedProductName = document.getElementById('editProductName').value;
	    var updatedProductPrice = document.getElementById('editProductPrice').value;
	    var updatedProductStock = document.getElementById('editProductStock').value;
	    var updatedProductDescription = document.getElementById('editProductDescription').value;
	    var updatedProductImages = document.getElementById('editProductImages').value;
	    var updatedProductCategoryId = document.getElementById('editProductCategoryId').value;

	    var updatedProductData = {
	        productId: productId,
	        name: updatedProductName,
	        price: updatedProductPrice,
	        stock: updatedProductStock,
	        description: updatedProductDescription,
	        images: updatedProductImages,
	        categoryId: updatedProductCategoryId
	    };

		    // Send AJAX PUT request to update product
		    $.ajax({
		        type: 'PUT',
		        url: '/api/products/' + productId, // Replace with your API endpoint
		        contentType: 'application/json',
		        data: JSON.stringify(updatedProductData),
		        success: function(response) {
		            // Handle success response (e.g., close modal, refresh product list)
		            $('#editProductModal').modal('hide');
		            // Call a function to update product list on the page
		            fetchProducts(); // Example function to fetch and display products
		        },
		        error: function(error) {
		            // Handle error response (e.g., display error message)
		            console.error('Error updating product:', error);
		        }
		    });
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