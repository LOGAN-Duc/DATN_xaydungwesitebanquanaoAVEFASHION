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

		<main>
			<div class="container">
				<!-- hot p[roiduct]-->
				<div class="main__products-hot">
					<div class="main__products-title">
						<p>HOT PRODUCTS</p>
					</div>
					<div class="list_item_banner row">

						<c:forEach items="${productHots }" var="product">
							<div class="col-12 col-lg-3 col-md-6 item_banner">
								<div class="product">
									<div class="thumb">
										<a href="${classpath }/product-detail/${product.id }"
											class="image"> <img style="width: 215px; height: 270px"
											src="${classpath }/FileUploads/${product.avatar }"
											class="fit-img zoom-img">
										</a><span
											class="${product.calculateDiscountPercentage() > 0 ? '' : 'd-none'}">
											<span class="badges"> <!-- <span class="sale">-20%</span> -->
												<span class="new">${product.calculateDiscountPercentage()}%</span>
										</span>
										</span> <span class="${product.is_hot == 'true' ? '': 'd-none'  }">
											<span class="ishot"> <!-- <span class="sale">-20%</span> -->
												<span class="new">hot</span>
										</span>
										</span>

									</div>
									<div class="content">
										<a href="${classpath }/product-detail/${product.id }"
											class="content-link">
											<h5 class="title">${product.name }</h5>
										</a> <span style="color: chocolate;"
											class="curr__price ${product.sale_price != null ? '' : 'd-none'}">${product.sale_price.toString()}
											$</span> <span style="color: chocolate;"
											class="curr__price ${product.sale_price == null ? '' : 'd-none'}">${product.price.toString()}
											$</span> <span class="symbol"> <a><i
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
				<!-- advertisement product-->
				<div class="container">
					<div class="row">
						<div class="col-12 col-lg-4">
							<a href="./danhmuc.html" class="banner-sale"> <img
								src="${classpath}/frontend/img/1Untitled.png" width="100%"
								alt="">
							</a>
						</div>
						<div class="col-12 col-lg-4">
							<a href="./danhmuc.html" class="banner-sale"> <img
								src="${classpath}/frontend/img/Untitled.png" width="100%" alt="">
							</a>
						</div>
						<div class="col-12 col-lg-4">
							<a href="./danhmuc.html" class="banner-sale"> <img
								src="${classpath}/frontend/img/2Untitled.png" width="100%"
								alt="">
							</a>
						</div>
					</div>
				</div>
				<!-- DANH MUC SNA PHAM  -->
				<form class="form-inline" action="${classpath }/index" method="get">
					<div class="main__products">

						<div class="container">
							<div class="main__products-title">
								<p>Danh sách sản phẩm</p>
							</div>
							<div class="main__products-content">

								<div class="row maxProduct">
									<c:forEach items="${products }" var="product">
										<div class="col-12 col-lg-3 col-md-6">
											<div class="product">
												<div class="thumb">
													<a href="${classpath }/product-detail/${product.id }"
														class="image"> <img style="width: 215px; height: 270px"
														src="${classpath }/FileUploads/${product.avatar }"
														class="fit-img zoom-img">
													</a><span
														class="${product.calculateDiscountPercentage() > 0 ? '' : 'd-none'}">
														<span class="badges"> <!-- <span class="sale">-20%</span> -->
															<span class="new">${product.calculateDiscountPercentage()}%</span>
													</span>
													</span> <span class="${product.is_hot == 'true' ? '': 'd-none'  }">
														<span class="ishot"> <!-- <span class="sale">-20%</span> -->
															<span class="new">hot</span>
													</span>
													</span>
												</div>
												<div class="content">
													<a href="${classpath }/product-detail/${product.id }"
														class="content-link">
														<h5 class="title">${product.name }</h5>
													</a> <span style="color: chocolate;"
														class="curr__price ${product.sale_price != null ? '' : 'd-none'}">${product.sale_price.toString()}
														$</span> <span style="color: chocolate;"
														class="curr__price ${product.sale_price == null ? '' : 'd-none'}">${product.price.toString()}
														$</span> <span class="symbol"> <a><i
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

							<div class="row">
								<div class="col-12 col-lg-6">

									<h5 class="title">
										Total products:
										<fmt:formatNumber value="${totalProducts }"
											minFractionDigits="0"></fmt:formatNumber>
										(items)
									</h5>

								</div>

							</div>

						</div>
					</div>
				</form>
			</div>
		</main>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
	</div>
	<!-- Optional JavaScript -->

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	<script>

	$(document).ready(function(){
	  $('.myProduct').slick({
	    
	    slidesToShow: 1,
	    slidesToScroll: 1,
	    autoplay: true,
	    autoplaySpeed: 2000,
	    prevArrow: '<button  style="z-index: -2;" class="slick-arrow slick-prev pre-custom"><i class="fa-solid fa-chevron-left"></i></button>',
	    nextArrow: '<button  style="z-index: -2;" class="slick-arrow slick-next next-custom"><i class="fa-solid fa-chevron-right"></i></button>'
	  });
	});
	</script>
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
</body>
</html>