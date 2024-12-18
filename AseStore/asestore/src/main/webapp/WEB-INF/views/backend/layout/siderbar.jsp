<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link"
		href="${classpath }/admin/home"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li>
	<!-- Divider -->
	<hr class="sidebar-divider">
	<!-- Heading -->
	<div class="sidebar-heading">ADMISTRATION SYSTEM</div>
	<!-- Nav Item - Charts -->
	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link"
		href="${classpath}/admin/category-list"> <i
			class="fas fa-fw fa-table"></i> <span>Categories</span>
	</a></li>

	<li class="nav-item"><a class="nav-link"
		href="${classpath}/admin/product-list"> <i
			class="fas fa-fw fa-table"></i> <span>Product</span>
	</a></li>
	<li class="nav-item"><a class="nav-link"
		href="${classpath}/admin/user-list"> <i class="fas fa-fw fa-table"></i>
			<span>User</span>
	</a></li>
	<li class="nav-item"><a class="nav-link"
		href="${classpath}/admin/role-list"> <i class="fas fa-fw fa-table"></i>
			<span>Role</span>
	</a></li>
	<li class="nav-item"><a class="nav-link"
		href="${classpath}/admin/order-view"> <i class="fas fa-fw fa-table"></i>
			<span>Orders</span>
	</a></li>
	<li class="nav-item"><a class="nav-link"
		href="${classpath}/admin/contact-list"> <i
			class="fas fa-fw fa-table"></i> <span>Customer contact</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">
	<!-- Heading -->
	<div class="sidebar-heading">AUTHENTICATION</div>
	<li class="nav-item"><a class="nav-link" href="${classpath}/register">
			<i class="fas fa-fw fa-table"></i> <span>Register</span>
	</a></li>
	<li class="nav-item"><a class="nav-link" href="${classpath}/logout">
			<i class="fas fa-fw fa-table"></i> <span>Logout</span>
	</a></li>
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	<!-- Sidebar Toggler (Sidebar) -->
	<!-- Sidebar Message -->
</ul>