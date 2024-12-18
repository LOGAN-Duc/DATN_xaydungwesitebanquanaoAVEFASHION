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
									<form action="${classpath }/admin/order-view" method="get">
										<div class="table-responsive">
											<div class="row">
											<div class="col-md-6">
													
												</div>
												<div class="col-md-6">
													<div class="form-group mb-4">
														<label>Current page</label> <input id="page" name="page"
															class="form-control"
															value="${productSearch.currentPage }">
													</div>
												</div>
											</div>
											<!-- Tìm kiếm -->
											<div class="row">
												<div class="col-md-2">
													<div class="form-group mb-4">
														<!-- 
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<input type="checkbox" class="form-check-input" id="status" name="status" checked="checked" />
			                                        <label for="status">Active</label>
			                                         -->
														<select class="form-control" id="status" name="status">
															<option value="2">All</option>
															<option value="1">Đã Giao</option>
															<option value="0">Chưa Giao </option>
														</select>
													</div>
												</div>

												

												<div class="col-md-2">
													<input class="form-control" type="date" id="beginDate"
														name="beginDate" />
												</div>
												<div class="col-md-2">
													<input class="form-control" type="date" id="endDate"
														name="endDate" />
												</div>

												<div class="col-md-3">
													<input type="text" class="form-control" id="keyword"
														name="keyword" placeholder="Search keyword" />
												</div>

												<div class="col-md-1">
													<button type="submit" id="btnSearch" name="btnSearch"
														class="btn btn-primary">Search</button>
												</div>
											</div>
											<!-- Hết tìm kiếm -->
											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Id</th>
														<th scope="col">Code</th>
														<th scope="col">Name</th>
														<th scope="col">Mobile</th>
														<th scope="col">Address</th>
														<th scope="col">Total</th>
														<th scope="col">Create by</th>
														<th scope="col">Update by</th>
														<th scope="col">Create date</th>
														<th scope="col">Update date</th>
														<th scope="col">Status</th>
														<th scope="col">Actions</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="saleorders" items="${saleorders }"
														varStatus="loop">
														<tr>
															<td>${loop.index + 1 }</td>
															<td>${saleorders.id }</td>
															<td>${saleorders.code }</td>
															<td>${saleorders.customer_name }</td>
															<td>${saleorders.customer_mobile }</td>
															<td>${saleorders.customer_address }</td>
															<td>${saleorders.total }</td>
															<td></td>
															<td></td>
															<td>
																<!-- 	<fmt:formatDate value="${saleorders.createDate }" pattern="dd-MM-yyyy"/> -->
															</td>
															<td></td>
															<td><c:choose>
																	<c:when test="${saleorders.status }">
																		<span>Đã Giao</span>
																	</c:when>
																	<c:otherwise>
																		<span>Chưa Giao</span>
																	</c:otherwise>
																</c:choose></td>
															<td><a
																href="${classpath }/admin/order-edit/${saleorders.id }"
																role="button" class="btn btn-primary">Edit</a> <a
																href="${classpath }/admin/order-delete/${saleorders.id }"
																role="button" class="btn btn-secondary">Delete</a></td>
														</tr>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Id</th>
														<th scope="col">Code</th>
														<th scope="col">Name</th>
														<th scope="col">Mobile</th>
														<th scope="col">Address</th>
														<th scope="col">Total</th>
														<th scope="col">Create by</th>
														<th scope="col">Update by</th>
														<th scope="col">Create date</th>
														<th scope="col">Update date</th>
														<th scope="col">Status</th>
														<th scope="col">Actions</th>
													</tr>
												</tfoot>
											</table>

											<div class="row">
												<div class="col-md-6">
													
												</div>

												<div class="col-md-6">
													<div class="pagination float-right">
														<div id="paging"></div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
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
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>