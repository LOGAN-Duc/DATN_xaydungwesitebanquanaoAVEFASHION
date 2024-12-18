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
					<!-- basic table -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<sf:form class="form"
										action="${classpath }/admin/category-edit-save" method="post"
										modelAttribute="category" enctype="multipart/form-data">
										<div class="form-body">

											<sf:hidden path="id" />
											<!-- id > 0 -> Edit -->
											<div class="row">

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="name">Category name</label>
														<sf:input path="name" type="text" class="form-control"
															id="name" name="name" placeholder="category name"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="category">Create by</label>
														<sf:select path="userCreateCategory.id"
															class="form-control" id="userCreateCategory">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="category">Update by</label>
														<sf:select path="userUpdateCategory.id"
															class="form-control" id="userUpdateCategory">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="createDate">Create date</label>

														<sf:input path="createDate" class="form-control"
															type="date" id="createDate" name="createDate"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="updateDate">Update date</label>

														<sf:input path="updateDate" class="form-control"
															type="date" id="updateDate" name="updateDate"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<label for="description">Description</label>
														<sf:textarea path="description" id="description"
															name="description" class="form-control" rows="3"
															placeholder="desription..."></sf:textarea>
													</div>
												</div>
											</div>

											<div class="row">

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
														<a href="${classpath }/admin/category-list"
															class="btn btn-secondary active" role="button"
															aria-pressed="true"> Back to list </a>
														<button type="submit" class="btn btn-primary">Save
															edit category</button>
													</div>
												</div>
											</div>

										</div>
									</sf:form>
								</div>
							</div>
						</div>
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