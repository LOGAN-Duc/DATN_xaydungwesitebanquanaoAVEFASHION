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
<style type="text/css">
.buttom_main {
	height: 400px;
	margin: 50px 0;
}

.desc_menu {
	width: 100%;
	margin: 20px 0;
	background-color: #f8f8f8;
}

.desc_menu>.menu {
	display: flex;
	padding: 0px;
	position: relative;
	line-height: 60px;
	text-align: center;
}

.desc_menu>.menu>li {
	list-style: none;
	width: calc(100%/ 4);
}

.desc_menu>.menu>li:hover {
	background-color: #333333;
	color: #ffffff;
}

.desc_menu>.menu>li:hover .item_decs {
	background-color: #ffffff;
	color: #333333;
}

.item_decs {
	position: absolute;
	width: auto;
	height: 400px;
	overflow: auto;
	line-height: 18px;
	display: none;
	text-align: left;
	padding: 50px;
	font-size: 18px;
	color: #8c8c8c;
	left: 0;
}

#div1 {
	display: block;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
		<!-- main -->
		<main>
			<div class="main__breadcrumb">
				<div class="container">
					<div class="bread-crumb">
						<span><a href="./index.html">Trang chủ</a></span> <span><a
							href="./danhmuc">Danh mục sản phẩm</a></span> <span>
							Sản phẩm</span>
					</div>
				</div>
			</div>
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
						
						</div>
						
						<!--Product detail-->
						<div class="col-lg-9 col-12">
							<div class="section__product-detail">
								<div class="row">
									<div class="col-12 col-lg-5">
										<div class="product__detail-img">
											<div class=" myProduct">
												<c:forEach var="item" items="${product.productImages }"
													varStatus="loop">
													<div class="swiper-slide">
														<img src="${classpath}/FileUploads/${item.path }" alt=""
															class="swiper__product-img">
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="col-12 col-lg-7">
										<div class="product__detail-summery">
											<div class="product__header mb-10">
												<h2 class="product__header-title">${product.name}</h2>
											</div>

											<div class="product__price mb-10">
												<span style="color: chocolate;"
													class="curr__price ${product.sale_price != null ? '' : 'd-none'}">${product.sale_price.toString()}</span>
												<span style="color: chocolate;"
													class="curr__price ${product.sale_price == null ? '' : 'd-none'}">${product.price.toString()}</span>
												<span class="curr__price ">$</span>
											</div>
											<div class="product__code mb-10">
												<span>Số lượng còn: </span>
												<span>${product.quantity}</span>
											</div>
											<div class="product__inventroy mb-10">
												<span class="inventory-title">Tình trạng: </span> <span
													class="inventory-variant"> ${product.is_hot ? 'Hot' : 'Nên mua'}
												</span>
											</div>
											<div class="product__quantity mb-10">
												<span> Số lượng: </span>
												<div class="quantity__plus mb-10 " style="margin: 0;">
													<input type="number" min="1" name="" id="_quantity"
														value="1">
												</div>
											</div>
											<div class="product__cart-button">
												<div class="add__to__cart">
													<a href="#"
														onclick="addToCart(${product.id}, document.getElementById('_quantity').value, '${product.name}')"
														class="add-cart-link">Add to cart</a>
												</div>
												<a href="#" class="add-cart-heart"> <i
													class="fa-regular fa-heart"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- 
					<div class="section__product-description">
						<h3 class="main__products-title">Thông tin sản phẩm</h3>
						<div class="detail__text">
							<div class="buttom_main">
								<div class="desc_menu">
									<ul class="menu">
										<li onclick="showDiv(0)">DESCEPTION
											<div class="item_decs" id="div1">
												<h4>NUNC EGESTAS POSUERE ENIM, EU MAXIMUS ERAT POSUERE
													EGET</h4>
												<h5>Sed ut mi mollis, consequat nulla lacinia,
													hendrerit turpis. Nulla sapien magna, interdum quis pretium
													nec, pharetra at felis. Curabitur dictum sapien est, eget
													ultricies turpis porta vel. Nam suscipit nec lacus sed
													imperdiet. Vestibulum a purus risus. Nulla et dictum augue,
													nec efficitur mi. Nam sit amet pretium elit. Aliquam
													congue, ligula id vehicula vestibulum, orci ex vulputate
													lacus, ac malesuada elit dolor eget ex. Sed quis aliquet
													risus, ut cursus lectus. In eget lorem tellus.</h5>
												<h5>Quisque eleifend varius nisi nec sagittis. Nulla
													ullamcorper imperdiet justo, ut venenatis purus lobortis
													ut. Nunc sagittis urna et hendrerit sodales. Nunc molestie
													risus nec fringilla lacinia. Nulla facilisi. Etiam neque
													velit, tristique eget sollicitudin eget, placerat at metus.
													Proin dictum lobortis velit, id suscipit orci faucibus ut.
													Aliquam erat volutpat. Vivamus feugiat justo in diam
													placerat, id dignissim elit auctor. Vestibulum scelerisque
													sem et lobortis ultricies. Morbi suscipit nulla urna.
													Suspendisse potenti. Nullam varius quam sed nisl dignissim,
													vel faucibus ipsum blandit. Vivamus at suscipit augue. Nam
													finibus gravida lorem eu viverra. Praesent rhoncus
													imperdiet ultric- ies. Nullam pretium cursus augue auctor
													vulputate. Quisque a convallis diam commodo eget diam id,
													eleifend dictum libero. Etiam varius, nisi vel dignissim
													sodales, enim dui posuere mauris, in aliquet lorem eros
													eget neque.</h5>
											</div>
										</li>
										<li onclick="showDiv(1)">VIDEO
											<div class="item_decs" id="div2">
												<h4>NUNC EGESTAS POSUERE ENIM, EU MAXIMUS ERAT POSUERE
													EGET</h4>
											</div>
										</li>
										<li onclick="showDiv(2)">EVALUATE

											<div class="item_decs" id="div3">
												<h4></h4>

											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
 -->
					<div class="main__products-title pt-5">
						<p>Sản phẩm HOT</p>
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
			</div>
		</main>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
	</div>
	<!-- Optional JavaScript -->

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	<script>
	function showDiv(index) {
        var divs = document.getElementsByClassName("item_decs");
        for (var i = 0; i < divs.length; i++) {
            if (i === index) {
            divs[i].style.display = "block";
            } else {
            divs[i].style.display = "none";
            }
        }
     }
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
	    alert("Thêm " + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
	    
	    let data = {
	        productId: _productId, // Lấy theo ID
	        quantity: _quantity,
	    };
	    
	    // $ === jQuery
	    jQuery.ajax({
	        url: "/add-to-cart",
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(data),
	        dataType: "json", // Kiểu dữ liệu trả về từ controller là JSON

	        success: function(jsonResult) {
	            let totalProducts = jsonResult.totalCartProducts;
	            $("#totalCartProductsId").html(totalProducts); // Cập nhật số lượng sản phẩm
	            alert(jsonResult.code + ": " + jsonResult.message); // Hiển thị thông báo thành công
	        },

	        error: function(jqXhr, textStatus, errorMessage) {
	            // Kiểm tra xem có thông tin JSON trong phản hồi lỗi không
	            let message = jqXhr.responseJSON ? jqXhr.responseJSON.message : errorMessage;
	            alert("Lỗi: " + message); // Hiển thị thông báo lỗi
	        },
	    });
	}
	</script>
</body>