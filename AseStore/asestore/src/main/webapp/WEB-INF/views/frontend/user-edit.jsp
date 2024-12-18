<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    
    <title>Hello, world!</title>
  </head>
<body>
    <div class="wrapper">
    	<!-- header -->
    	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    	<!-- main -->
		<main>
		<div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${classpath }/admin/user-edit-save" method="post" modelAttribute="user" enctype="multipart/form-data">
	                        		 <div class="form-body">
	                        		 
	                        		 	<sf:hidden path="id"/> <!-- id > 0 => update -->
	                        		 
	                        			<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="username">User name</label>
			                                        <sf:input path="username" type="text" value="${loginedUser.username }" class="form-control" id="username" name="username" placeholder="user name"></sf:input>
                                        		</div>
	                                    	</div>                                   
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Full name</label>
			                                        <sf:input path="name" type="text" value="${loginedUser.name }" class="form-control" id="name" name="name" placeholder="full name"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="mobile">Mobile</label>
			                                        <sf:input path="mobile" type="text" value="${loginedUser.mobile }" class="form-control" id="mobile" name="mobile" placeholder="mobile"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                 
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="address">Address</label>
			                                        <sf:input path="address" type="text" value="${loginedUser.address }" class="form-control" id="address" name="address" placeholder="address"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description">Description</label>
			                                        <sf:textarea path="description" id="description" name="description"
																class="form-control" rows="3" placeholder="desription..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="avatarFile">Choose user Avatar</label>
                                    				<input id="avatarFile" name="avatarFile" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
									
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4"> 
			                       
                                    				<button type="submit" class="btn btn-primary">Save user</button>
                                        		</div>
	                                    	</div>
										</div>
										
	                        		</div>
	                        	</sf:form>
	                        </div>
	                    </div>    
                  </div>
            </div>
		</main>
		<!-- footer -->
    <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
    </div>
    <!-- Optional JavaScript -->
    
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
</body>