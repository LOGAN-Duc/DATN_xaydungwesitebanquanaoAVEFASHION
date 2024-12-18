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
                                <div class="row">
                                   
                                </div>
                                <div class="table-responsive">
                                	
                               	<div class="row">
                       		 		<div class="col-md-6">
										<div class="form-group mb-4">
	                                        <a href="${classpath }/admin/role-add" role="button" class="btn btn-primary">Add New role</a>
                                      	</div>
                                   	</div>
									
                                    <div class="col-md-6">
	                                    <ul class="pagination float-right">
	                                        <li class="page-item disabled">
	                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
	                                        </li>
	                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                                        <li class="page-item">
	                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
	                                        </li>
	                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                        <li class="page-item">
	                                            <a class="page-link" href="#">Next</a>
	                                        </li>
	                                    </ul>
                                    </div>
                                </div>
                                
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Id</th>
                                                <th scope="col">Name</th>    
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th>
                                                <th scope="col">Status</th>  
                                                <th scope="col">Description</th>
                                                <th scope="col">Actions</th>                                              
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="role" items="${roles }" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${role.id }</td>
		                                        	<td>${role.name }</td>
		                                        	<td>${role.userCreateRole.username }</td>
													<td>${role.userUpdateRole.username }</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${role.createDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${role.updateDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<c:choose>
		                                        			<c:when test="${role.status }">
		                                        				<span>Active</span>
		                                        			</c:when>
		                                        			<c:otherwise>
		                                        				<span>Inactive</span>
		                                        			</c:otherwise>
		                                        		</c:choose>
		                                        		</td>
	                                        		<td>${role.description }</td>
	                                        		<td>
	                                        			<a href="${classpath }/admin/role-edit/${role.id }" role="button" 
	                                                							class="btn btn-primary">Edit</a>
	                                                	<a href="${classpath }/admin/role-delete/${role.id }" role="button" 
	                                                							class="btn btn-secondary">Delete</a>
	                                        		</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Id</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Create by</th>
                                                <th scope="col">Update by</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Actions</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    
                                    <div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <a href="${classpath }/admin/role-add" role="button" class="btn btn-primary">Add New role</a>
                                        		</div>
	                                    	</div>
										
	                                    <div class="col-md-6">
		                                    <ul class="pagination float-right">
		                                        <li class="page-item disabled">
		                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
		                                        </li>
		                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
		                                        <li class="page-item">
		                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
		                                        </li>
		                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
		                                        <li class="page-item">
		                                            <a class="page-link" href="#">Next</a>
		                                        </li>
		                                    </ul>
	                                    </div>
	                                  </div>
	                            </div>
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
</body>

</html>