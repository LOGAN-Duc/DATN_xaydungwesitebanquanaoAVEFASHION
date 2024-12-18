<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/*đặt cha làm điểm tựa để id="smart-search" căn theo*/
.wrap-search-form {
	position: relative;
}
/*con căn theo điểm tựa bên ngoài*/
#smart-search {
	position: absolute;
	width: 300px;
	background: white;
	z-index: 100;
	top: 50px;
	right: -170px;
	display: none;
	height: 200px;
	overflow: scroll;
}

#smart-search img {
	width: 70px;
	margin-right: 5px;
}

#smart-search ul {
	padding: 0px;
	margin: 0px;
	list-style: none;
	text-align: left;
}

#smart-search ul li {
	border-bottom: 1px solid #dddddd;
}
</style>


<header class="header">

	<div class="header--fix">
		<div class="header__top">
			<div class="container">
				<p class="header__top-title">Design by DucSjro</p>
			</div>
		</div>
		<div class="header__bottom">
			<div class="container">
				<div class="row ">
					<div class="col-lg-3 block none">
						<div id="languageChoose" style="line-height: 70px;">
							<form id="languageForm" action="#" method="post">
								<select id="languageSelect" name="language"
									onchange="changeLanguage(this.value)">
									<option value="en">English</option>
									<option value="fr">Tiếng Việt</option>
								</select>
							</form>
						</div>
					</div>
					<div class="col-lg-6 col-md-4 col-6">
						<div class="logo" id="logo"
							style="font-size: 40px; width: 100%; line-height: 70px; text-align: center; font-weight: bold;">AVE
							FASHION</div>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<div class="header__bottom--action d-flex justify-content-end">
							<div class="header__bottom--btn header__bottom-user">
								<ul class="">
									<li style="line-height: 30px; list-style: none"
										class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" data-toggle="dropdown"
										href="${classpath}/danhmuc" " role="button"
										aria-haspopup="true" aria-expanded="false"><i
											class="fa-regular fa-user"></i></a>
										<div class="dropdown-menu" style="">
											<c:choose>
												<c:when test="${isLogined }">
													<a class="dropdown-item" href="${classpath}/my-account">My
														Account</a>
													<a class="dropdown-item" href="${classpath}/cart-view">My
														Cart</a>
													<hr>
													<a href="${classpath }/logout">Log Out</a>
												</c:when>
												<c:otherwise>
													<a href="${classpath }/login">Log In</a>
												</c:otherwise>
											</c:choose>
										</div></li>
								</ul>
							</div>
							<div class="header__bottom--btn header__bottom-cart">
								<a href="${classpath }/cart-view" class="cart"> <i
									class="fa-solid fa-cart-shopping"></i>
								</a> <span
									style="position: absolute; top: 8px; background-color: #d9e1e6; width: 20px; height: 20px; border-radius: 50%; padding-left: 5px; line-height: 20px; right: 35px;"
									id="totalCartProductsId" class="quantity">${totalCartProducts }</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 col-md-4 col-6">
						<i class="fa-solid fa-bars" style="line-height: 60px;"></i>
					</div>
					<div class="col-lg-8 .d-md-none .d-lg-block ">
						<ul class="nav nav-fill justify-content-center">
							<li class="nav-item"><a class="nav-link active "
								style="line-height: 60px;" href="${classpath}/index">HOME</a></li>

							<li class="nav-item"><a class="nav-link dropdown-toggle"
								style="line-height: 60px;" data-toggle="dropdown" href=""
								role="button" aria-haspopup="true" aria-expanded="false">CATEGOIES</a>
								<div class="dropdown-menu">
									<c:forEach items="${categories}" var="category">
										<a class="dropdown-item" href="${classpath}/danhmuc">${category.name}</a>
									</c:forEach>
									<a class="dropdown-item" href="${classpath}/danhmuc">Learn
										more...</a>
								</div></li>
							<li class="nav-item"><a class="nav-link dropdown-toggle"
								style="line-height: 60px;" data-toggle="dropdown" href=""
								role="button" aria-haspopup="true" aria-expanded="false">THE
									BANDS</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="${classpath}/danhmuc">Jackets</a>
									<a class="dropdown-item" href="${classpath}/danhmuc">Hoodies
										& Sweatsshirts</a> <a class="dropdown-item"
										href="${classpath}/danhmuc">Polo Shirt</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${classpath}/danhmuc">Trouser
										& Chinos</a> <a class="dropdown-item" href="${classpath}/danhmuc">T-Shirts</a>
								</div></li>
							<li class="nav-item"><a class="nav-link active "
								style="line-height: 60px;" href="${classpath}/danhmuc">CONTACT</a>
							</li>

						</ul>
					</div>
					<div class="col-lg-2 col-md-8 col-6">
						<div class="form-inline ">
							<form id="searchForm" action="${classpath }/danhmuc" method="get">
								<div class="wrap-search-form">
									<div class="header__bottom-box-search">
										<input class="form-control mr-sm-2"
											style="padding-right: 20px" type="text" onkeyup="Search();"
											autocomplete="off" name="search" id="keyword" value=""
											placeholder="Search here...">

										<button class="header__search-btn" style="right: 10px;"
											name="btnSearch" id="btnSearch" type="submit"
											form="form-search-top"
											onclick="location.href='/Products/SearchName?key='+document.getElementById('key').value;">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
									<div id="smart-search">
										<c:forEach items="${products }" var="product">
											<div class="row py-3 px-3" style="width: 400px">
												<div class="thumb col-4">
													<a href="${classpath }/product-detail/${product.id }"
														class="image"> <img style="width: 70px; height: 85px;"
														src="${classpath }/FileUploads/${product.avatar }"
														class="fit-img zoom-img">
													</a>
												</div>
												<div class="content col-8">
													<a href="${classpath }/product-detail/${product.id }"
														class="content-link">
														<p class="title" style="color: black;">${product.name }</p>
													</a> <span style="color: chocolate;"
														class="curr__price ${product.sale_price != null ? '' : 'd-none'}">${product.sale_price.toString()}$</span>
													<span style="color: chocolate;"
														class="curr__price ${product.sale_price == null ? '' : 'd-none'}">${product.price.toString()}$</span>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="carouselExampleIndicators" class="carousel slide container"
		style="margin-top: 154px;" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" style="width: 1110px; height: 498px"
					src="${classpath }/frontend/img/banner_02.png" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${classpath }/frontend/img/banner_02.png" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${classpath }/frontend/img/banner_02.png" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="${classpath}/danhmuc"
			carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="${classpath}/contact"
			carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</header>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
	//phải kiểm xem jquery đã load được vào trang chưa, nếu chưa thì phải load jquery (vì sử dụng jquery ajax)
	//$(document).ready(function(){ alert('ok'); });

	function Search() {
		var key = document.getElementById("keyword").value;
		if (key != '') {
			//hiển thị id=smart-search
			document.getElementById("smart-search").setAttribute("style",
					"display:block;");
			//sử dụng jquery ajax get để lấy dữ liệu
			//khởi tạo đối tượng
			var obj = new XMLHttpRequest();

			obj.onload = function() {
				//  document.getElementById("result").innerHTML = this.responseText;
				$("#smart-search ul").empty();
				//thêm kết quả mới lấy được từ ajax
				$("#smart-search ul").append(this.responseText);
			}
			//mở đối tượng, url truyền tham số
			obj.open("GET", "http://localhost:5137/Products/AJaxSearch?key="
					+ key);
			//gửi dữ liệu
			obj.send();
		} else {
			document.getElementById("smart-search").setAttribute("style",
					"display:none;");
		}
	}
</script>