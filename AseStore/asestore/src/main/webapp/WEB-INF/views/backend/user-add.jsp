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
										action="${classpath }/admin/user-add-save" method="post"
										modelAttribute="user" enctype="multipart/form-data">
										<div class="form-body">

											<div class="row">

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="role">User role</label> <select
															class="form-control" id="role" name="role">
															<c:forEach items="${roles }" var="role">
																<option value="${role.id }" label="${role.name }"></option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="col-md-6">
													<!--  		<div class="form-group mb-4">
														<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<sf:checkbox path="status" class="form-check-input"
															id="status" name="status"></sf:checkbox>
														<label for="status">Active</label>
													</div>-->
															<div class="form-group mb-4">
																<label for="avatarFile">Choose user Avatar</label> <input
																	id="avatarFile" name="avatarFile" type="file"
																	class="form-control-file" multiple="multiple">
															</div>
													

												</div>

											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="username">User name</label>
														<sf:input path="username" type="text" class="form-control"
															id="username" name="username" placeholder="user name"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="password">Password</label>
														<sf:input path="password" type="passward"
															class="form-control" id="password" name="password"
															placeholder="password"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="name">Full name</label>
														<sf:input path="name" type="text" class="form-control"
															id="name" name="name" placeholder="full name"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="mobile">Mobile</label>
														<sf:input path="mobile" type="text" class="form-control"
															id="mobile" name="mobile" placeholder="mobile"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="email">Email</label>
														<sf:input path="email" type="text" class="form-control"
															id="email" name="email" placeholder="email"></sf:input>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="address">Address</label>
														<sf:input path="address" type="text" class="form-control"
															id="address" name="address" placeholder="address"></sf:input>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="role">Create by</label>
														<sf:select path="userCreateUser.id" class="form-control"
															id="userCreateUser">
															<sf:options items="${users }" itemValue="id"
																itemLabel="username"></sf:options>
														</sf:select>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group mb-4">
														<label for="role">Update by</label>
														<sf:select path="userUpdateUser.id" class="form-control"
															id="userUpdateUser">
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
														<sf:textarea path="description" id="description"
															name="description" class="form-control" rows="3"
															placeholder="desription..."></sf:textarea>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group mb-4">
														<a href="${classpath }/admin/user-list"
															class="btn btn-secondary active" role="button"
															aria-pressed="true"> Back to list </a>
														<button type="submit" class="btn btn-primary">Save
															user</button>
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