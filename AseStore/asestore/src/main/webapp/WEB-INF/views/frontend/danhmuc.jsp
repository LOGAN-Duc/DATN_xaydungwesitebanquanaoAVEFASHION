<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

<title>Hello, world!</title>
</head>
<body>
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
		<!-- main -->
		<div class="main__breadcrumb">
			<div class="container">
				<div class="bread-crumb">
					<span><a href="${classpath }/index">Trang chủ</a></span> <span><a
						href="${classpath }/danhmuc">Danh mục sản phẩm</a></span>
				</div>
			</div>
		</div>
		<form id="searchForm" action="${classpath }/danhmuc" method="get">
			<div class="main__section">
				<div class="container">
					<div class="row">
						<!--[phan danh muc]-->
						<div class="col-lg-3">
							<div class="section__sidebar-widget">
								<div class="widget__inner">
									<div class="widget__list">
										<h3 class="widget__title">Search</h3>

										<div class="widget__search-box">
											<input type="text" placeholder="Tìm kiếm..." id="keyword"
												name="keyword" class="widget__input">
											<button id="btnSearch" name="btnSearch" class="search-icon">
												<i class="fa-solid fa-magnifying-glass"></i>
											</button>
										</div>

									<!-- 	<div class="col-md-6  ">
											<div class="form-group mb-4">
												<label style="">Current page</label> <input id="page" name="page"
													class="form-control" value="${productSearch.currentPage }">
											</div>
										</div>
 
									</div>
									<div class="widget__list">
										<h3 class="widget__title">Danh mục</h3>
									 	<select id="category" name="category" class="form-control">
         									   <c:forEach items="${categories}" var="category">
              									  <option  value="${category.id}">${category.name}</option>
           										 </c:forEach>
      										</select>
									</div>-->
									<div class="widget__list">
										<select class="form-control" id="categoryId"
														name="categoryId" style="margin-right: 10px;">
														<option value="0">Select category</option>
														<c:forEach items="${categories }" var="category">
															<option value="${category.id }">${category.name }</option>
														</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
						<!--Product detail-->
						</div>
						<div class="col-lg-9 maxProduct">
							<div class="row ">
								<c:forEach items="${products }" var="product">
									<div class="col-12 col-lg-3 col-md-6">
										<div class="product">
											<div class="thumb">
												<a href="${classpath }/product-detail/${product.id }"
													class="image"> <img style="width: 215px; height: 270px"
													src="${classpath }/FileUploads/${product.avatar }"
													class="fit-img zoom-img">
												</a> <span
													class="${product.calculateDiscountPercentage() > 0 ? '' : 'd-none'}">
													<span class="badges"> <!-- <span class="sale">-20%</span> -->
														<span class="new">${product.calculateDiscountPercentage()}%</span>
												</span>
												</span>
											</div>
											<div class="content">
												<a href="${classpath }/product-detail/${product.id }"
													class="content-link">
													<h5 class="title">${product.name }</h5>
												</a> <span style="color: chocolate;"
													class="curr__price ${product.sale_price != null ? '' : 'd-none'}">${product.sale_price.toString()}$</span>
												<span style="color: chocolate;"
													class="curr__price ${product.sale_price == null ? '' : 'd-none'}">${product.price.toString()}$</span>

												<span class="symbol"> <a><i
														class="fa-regular fa-heart"></i></a> <a
													onclick="addToCart(${product.id}, 1, '${product.name }')"><i
														class="fa-solid fa-cart-shopping"></i> </a>
												</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
							<div class="col-md-6">
								<div class="pagination float-right">
									<div id="paging"></div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</form>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
	</div>
	<!-- Optional JavaScript -->

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
				
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					/* alert(jsonResult.code + ": " + jsonResult.message); */
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			$("#categoryId").val(${productSearch.categoryId});
			
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