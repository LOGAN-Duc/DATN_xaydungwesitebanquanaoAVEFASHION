<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title }</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css -->
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

		<!-- content -->
		<main class="main">

			<!-- Danh mục sản phẩm -->
			<div class="main__products">
				<div class="container" id="cartView">
					<div class="main__products-title">
						<p>GIỎ HÀNG CỦA BẠN</p>
					</div>
					<c:choose>
						<c:when test="${totalCartProducts > 0}">
							<form method="get">
								<div class="page-breadcrumb">

									<div class="row">

										<div class="col-12">
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span id="placeOrderSuccess"> Your cart: ${message }
												</span>
											</h3>
										</div>

									</div>

									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-body">
													<div class="row">

														<div class="col-12">
															<table id="zero_config"
																class="table table-striped table-bordered no-wrap">
																<thead>
																	<tr>
																		<th scope="col" class="text-center">No.</th>
																		<th scope="col" class="text-center">Image</th>
																		<th scope="col" class="text-center">Product</th>
																		<th scope="col" class="text-center">Quantity</th>
																		<th scope="col" class="text-center">Price</th>
																		<th scope="col" class="text-center">Total</th>
																		<th scope="col" class="text-center">Actions</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach var="item" items="${cart.cartInProducts }"
																		varStatus="loop">
																		<tr>
																			<td class="d-none" id="productID">$(item.productId)</td>
																			<td scope="row">${loop.index + 1 }</td>
																			<td><img width="60px" height="60px"
																				src="${classpath}/FileUploads/${item.avatar }"
																				class="light-logo"></td>
																			<td>${item.productName }</td>
																			<td align="center"><input type="number" min="1"
																				style="width: 50px"
																				id="productQuantity_${item.productId }"
																				value="${ item.quantity}" class="txt_quantity" /></td>
																			<td align="right" class="price"><fmt:formatNumber
																					value="${item.price }" minFractionDigits="0" /></td>
																			<td align="right" class="priceTotal"
																				style="color: chocolate"><fmt:formatNumber
																					value="${item.price * item.quantity }"
																					minFractionDigits="0" /></td>
																			<td align="center"><a
																				href="${classpath }/product-cart-delete/${item.productId }"
																				role="button" class="btn btn-secondary">Delete</a></td>
																		</tr>
																	</c:forEach>
																</tbody>

															</table>
														</div>

													</div>

													<div class="row">
														<div class="col-4 total_all">
															<h3
																class="page-title text-truncate text-dark font-weight-medium mb-1 ">
																Cart Total:<span style="color: chocolate"
																	id="total_all_price"> <fmt:formatNumber
																		value="${totalCartPrice }" minFractionDigits="0"></fmt:formatNumber>
																</span>$
															</h3>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group mb-4">
																<button class="btn btn-primary" type="submit"
																	onclick="_updateOrder()">Update Order</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Thong tin khach hang -->
							<div class="page-breadcrumb">
								<div class="row"></div>
								<div class="row">
									<div class="main__products-title">
										<p>Thông tin khách hàng</p>
									</div>
								</div>
								<form action="${classpath }/cart-view" method="get">
									<div class="row">

										<div class="col-12">
											<div class="card">
												<div class="card-body">
													<div class="form-body">
														<c:choose>
															<c:when test="${isLogined }">
																<div class="row" style="display: none;">

																	<div class="col-md-12">
																		<div class="form-group mb-4">
																			<label for="name">Customer ID (*)</label> <input
																				type="text" class="form-control" id="txtCustomerId"
																				name="txtCustomerId" placeholder="your name"
																				value="${loginedUser.id }" />
																		</div>
																	</div>
																</div>

															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>
														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="name">Recipient name (*)</label> <input
																		type="text" class="form-control" id="txtName"
																		name="txtName" placeholder="your name"
																		value="${loginedUser.name }" />
																</div>
															</div>
														</div>

														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="mobile">Recipient mobile (*)</label> <input
																		type="text" class="form-control" id="txtMobile"
																		name="txtMobile" placeholder="your phone number"
																		value="${loginedUser.mobile }" />
																</div>
															</div>
														</div>

														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="phone">Recipient email</label> <input
																		type="email" class="form-control" id="txtEmail"
																		name="txtEmail" placeholder="your email"
																		value="${loginedUser.email }" />
																</div>
															</div>
														</div>

														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="phone">Recipient address</label> <input
																		type="text" class="form-control" id="txtAddress"
																		name="txtAddress" placeholder="your address"
																		value="${loginedUser.address }" />
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group mb-4">
																	<a href="${classpath }/index"
																		class="btn btn-primary active" role="button"
																		aria-pressed="true"> Back to shop </a>
																	<button class="btn btn-primary" onclick="_placeOrder()">
																		Place orders</button>

																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<div class="col-12">
									<c:choose>
										<c:when test="${checkout }">
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span id="placeOrderSuccess">Bạn đã đặt hàng thành
													công</span>
											</h3>
										</c:when>
										<c:otherwise>
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span>Your cart: ${errorMessage }</span>
											</h3>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="row">
								<div class="col-md-12" align="center">
									<div class="form-group mb-4">
										<a href="${classpath }/index" class="btn btn-primary active"
											role="button" aria-pressed="true"> Back to shop </a>
									</div>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</main>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<div class="scroll__top">
			<i class='bx bx-up-arrow-alt'></i>
		</div>

		<!-- mobile menu -->

	</div>
	<!-- js -->
	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		function _placeOrder() {
			//javascript object
			let data = {
				txtName : jQuery("#txtName").val(),
				txtEmail : jQuery("#txtEmail").val(), 
				txtMobile : jQuery("#txtMobile").val(),
				txtAddress : jQuery("#txtAddress").val(),
				txtCustomerId : jQuery("#txtCustomerId").val(),
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}

		function _updateOrder() {
			let products = [];

			// Lặp qua tất cả các dòng trong bảng giỏ hàng
			$("tbody tr").each(function() {
				let productId = $(this).find("input").attr("id").split("_")[1];
				let quantity = parseInt($(this).find("input").val());

				// Tạo đối tượng sản phẩm với productId và quantity tương ứng
				let product = {
					productId : productId,
					quantity : quantity
				};

				// Thêm sản phẩm vào mảng
				products.push(product);
			});

			// Gửi yêu cầu AJAX để cập nhật giỏ hàng
			$.ajax({
			    url: "/update-product-quantity",
			    type: "POST",
			    contentType: "application/json",
			    data: JSON.stringify(products),
			    dataType: "json",
			    success: function(jsonResult) {
			    	 alert(jsonResult.code + ": " + jsonResult.message);
			        if (jsonResult.code === 200) {
			            toastr.success("Giỏ hàng đã được cập nhật thành công!");
			            let totalProducts = jsonResult.totalCartProducts;
			            $("#totalCartProductsId").html(totalProducts); // Cập nhật số lượng sản phẩm
			        } else {
			            toastr.error(jsonResult.message || "Có lỗi xảy ra khi cập nhật giỏ hàng.");
			        }
			        console.log("Updated order successfully!");
			    },
			    error: function(jqXhr, textStatus, errorMessage) {
			        toastr.error("Đã có lỗi xảy ra: " + (jqXhr.responseJSON ? jqXhr.responseJSON.message : errorMessage));
			        console.error("Error updating order: " + errorMessage);
			    }
			});
		}

		$(document).on('change', '.txt_quantity', function() {
			var myTr = $(this).parent().parent();
			tinhTongDonHang();
		});

		function tinhTongDonHang() {
			var tongTien = 0;
			$("#zero_config tbody tr").each(function() {
				var quantity = $(this).find(".txt_quantity").val();
				var price = $(this).find(".price").text();
				quantity = parseFloat(quantity);
				price = parseFloat(price);
				var thanhTien = quantity * price;
				$(this).find(".priceTotal").text(formatPrice(thanhTien));
				tongTien = tongTien + thanhTien;
			});
			$("#total_all_price").text(formatPrice(tongTien));
			console.log(tongTien);
		}
		function formatPrice(price) {
			var str = price.toString();
			var count = str.length;
			var n = Math.ceil(count / 3);
			var array = [];
			var du = count % 3;
			for (var i = 0; i < n; i++) {
				if (i == 0) {
					if (du > 0) {
						array[i] = str.substr(0, du);
					} else {
						array[i] = str.substr(0, 3);
						du = 3;
					}
				} else {
					var start = ((i - 1) * 3) + du;
					array[i] = str.substr(start, 3);
				}
			}
			return array.join('.');
		}
	</script>

</body>

</html>