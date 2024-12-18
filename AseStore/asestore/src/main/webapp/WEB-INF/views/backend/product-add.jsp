<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>
<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/backend/layout/siderbar.jsp"></jsp:include>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/WEB-INF/views/backend/layout/tophar.jsp"></jsp:include>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<!-- Main content-->
            	<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
                <div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
									<sf:form class="form"
										action="${classpath }/admin/product-add-save" method="post"
										modelAttribute="product" enctype="multipart/form-data">

										<div class="form-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="category">Select category</label>
														<sf:select path="category.id" class="form-control"
															id="category">
															<sf:options items="${categories }" itemValue="id"
																itemLabel="name"></sf:options>
														</sf:select>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="name">Product name</label>
														<sf:input path="name" type="text" class="form-control"
															id="name" name="name" placeholder="product name"></sf:input>
													</div>
												</div>
											</div>
											<div class="row">
										
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="name">Quantity of product</label>
														<sf:input path="quantity" type="number" min="1" class="form-control" id="quantity" name="quantity" placeholder="quantity of product"></sf:input>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="price">Price</label>
														<sf:input path="price" type="number" min="0" autocomplete="off"
															id="price" name="price" class="form-control"
															placeholder="price"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="sale-price">Sale price</label>
														<sf:input path="sale_price" type="number"
															autocomplete="off" id="sale-price" min="0" name="sale-price"
															class="form-control" placeholder="Sale price"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="create">Create by</label>
														<sf:select path="userCreateProduct.id"
															class="form-control" id="createBy">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="update">Update by</label>
														<sf:select path="userUpdateProduct.id"
															class="form-control" id="updateBy">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="createdate">Create date</label>

														<sf:input path="createDate" class="form-control"
															type="date" id="createDate" name="createDate"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="updatedate">Update date</label>

														<sf:input path="updateDate" class="form-control"
															type="date" id="updateDate" name="updateDate"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="description">Description</label>
														<sf:textarea path="short_description"
															id="shortDescription" name="shortDescription"
															class="form-control" rows="3"
															placeholder="Short desription..."></sf:textarea>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="detailDescription">Detail description</label>
														<sf:textarea path="detail_description"
															id="detailDescription" name="detailDescription"
															class="form-control" rows="3"
															placeholder="detail desription..."></sf:textarea>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-2">
													<div class="form-group mb-4">
														<label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<sf:checkbox path="is_hot" class="form-check-input"
															id="isHot" name="isHot"></sf:checkbox>
														<label for="is-hot">Is a hot product?</label>

													</div>
												</div>

												<div class="col-md-10">
													<div class="form-group mb-4">
														<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<sf:checkbox path="status" class="form-check-input"
															id="status" name="status"></sf:checkbox>
														<label for="status">Active</label>

													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="avatarFile">Choose product Avatar</label> <input
															id="avatarFile" name="avatarFile" type="file"
															class="form-control-file" multiple="multiple">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="image">Choose product Image</label> <input
															id="imageFiles" name="imageFiles" type="file"
															class="form-control-file" multiple="multiple">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="image">Choose product Image</label> <input
															id="imageFiles" name="imageFiles" type="file"
															class="form-control-file" multiple="multiple">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="image">Choose product Image</label> <input
															id="imageFiles" name="imageFiles" type="file"
															class="form-control-file" multiple="multiple">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="image">Choose product Image</label> <input
															id="imageFiles" name="imageFiles" type="file"
															class="form-control-file" multiple="multiple">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<a href="${classpath }/admin/product-list"
															class="btn btn-secondary active" role="button"
															aria-pressed="true"> Back to list </a>
														<button type="submit" class="btn btn-primary">Save
															add product</button>
													</div>
												</div>
											</div>

										</div>
									</sf:form>
								</div>
	                    </div>    
                  </div> 
				
				</div>

				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/WEB-INF/views/backend/layout/logoutmodal.jsp"></jsp:include>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
</body>

</html>