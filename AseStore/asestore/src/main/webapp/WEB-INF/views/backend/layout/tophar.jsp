
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.menu_down {
	position: absolute;
	width: 200px;
	background-color: white;
	right: 70px;
	z-index: 3;
	display: none;
}

.navbar-nav>li :focus .menu_down {
	display: block;
}
</style>
<nav class=" ">

	<!-- Sidebar Toggle (Topbar)
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
 -->
	<div class="row">
		<div class="col-lg-6 col-md-4 col-6 mr-auto">
			<div id="languageChoose"
				style="line-height: 70px; padding-left: 50px">
				<form id="languageForm" action="#" method="post">
					<select id="languageSelect" name="language"
						onchange="changeLanguage(this.value)">
						<option value="en">English</option>
						<option value="fr">Tiếng Việt</option>
					</select>
				</form>
			</div>
		</div>
		<div class="col-lg-6 col-md-4 col-6 ml-auto pl-1">
			<div class="header__bottom--btn header__bottom-user" style="text-align: right; width: 100%; line-height: 70px; padding-right: 50px">
				<ul class="">
					<li style="line-height: 70px; list-style: none"
						class="nav-item dropdown">
						<img src="${classpath }/FileUploads/${loginedUser.avatar }"
					alt="user" class="rounded-circle" width="40"> <span
					class="ml-2 d-none d-lg-inline-block"> <span>Hello,</span> <span
						class="text-dark">${loginedUser.name }</span> <i
						data-feather="chevron-down" class="svg-icon"></i>
			     	</span>
						
						<div class="dropdown-menu" style="">
							
									<a class="dropdown-item" href="${classpath}/my-account">My
										Account</a>
									<a class="dropdown-item" href="${classpath}/cart-view">My
										Setting</a>
									<hr>
									<a href="${classpath }/logout">Log Out</a>
								
						</div></li>
				</ul>
			</div>
			<!-- Topbar Navbar -->
		</div>
	</div>
</nav>