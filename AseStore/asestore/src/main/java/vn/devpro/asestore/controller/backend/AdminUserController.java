package vn.devpro.asestore.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.asestore.Model.Role;
import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;
import vn.devpro.asestore.service.RoleService;
import vn.devpro.asestore.service.UserService;

@Controller
public class AdminUserController extends BaseController implements AsestoreContants {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	// -------------------------user list-----------------------------------
	@RequestMapping(value = "/admin/user-list", method = RequestMethod.GET)
	public String userList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// Lay danh sach user tu tbl_user trong database
		SearchModel productSearch = new SearchModel();

		productSearch.setStatus(2);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			productSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		//tìm với keyword
				productSearch.setKeyword(request.getParameter("keyword"));
		// Bắt đầu phân trang
		if (!StringUtils.isEmpty(request.getParameter("page"))) { // bấm nút chuyển trang
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		} else {

			productSearch.setCurrentPage(1); // Lần đầu luôn hiển thị trang 1
		}
		List<User> Alluser = userService.searchUser(productSearch);
		List<User> users = new ArrayList<>();
		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < Alluser.size() && count < SIZE_OF_PAGE) {
			users.add(Alluser.get(index));
			index++;
			count++;
		}

		// phân trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE); // số bản ghi trên 1 trang
		productSearch.setTotalItems(userService.findAll().size()); // tổng số sản phẩm
		model.addAttribute("users", users);
		model.addAttribute("productSearch", productSearch);
		return "backend/user-list";
	}

	// -----------------add new user----------------------------------
	@RequestMapping(value = "/admin/user-add", method = RequestMethod.GET)
	public String userAdd(final Model model) throws IOException {
		// Lay danh sach user tu tbl_user trong database
		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);

		User user = new User();
		
		user.setCreateDate(new Date());
		model.addAttribute("user", user);

		return "backend/user-add";
	}

	// -----------------save user to database---------------------
	@RequestMapping(value = "/admin/user-add-save", method = RequestMethod.POST)
	public String userAddSave(final Model model, final HttpServletRequest request,
			@RequestParam("avatarFile") MultipartFile avatarFile, @ModelAttribute("user") User user)
			throws IOException {

		if (!StringUtils.isEmpty(request.getParameter("role"))) {
			int roleId = Integer.parseInt(request.getParameter("role"));
			// lay role tu tbl_role trong db
			Role role = roleService.getById(roleId);

			// luu user_id va role_id vao tbl_user_role
			user.addRelationaUserRole(role);
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
			// luu user vao bang tbl_user
			userService.saveAddUser(avatarFile, user);
		}
		// ko chon role thi ko luu user

		return "redirect:/admin/user-list";
	}

	// ----------------edit user---------------------
	@RequestMapping(value = "/admin/user-edit/{userId}", method = RequestMethod.GET)
	public String userEdit(final Model model, @PathVariable("userId") int userId // lay user id khi click Edit
	) throws IOException {

		// Lay user tu tbl_user trong database
		User user = userService.getById(userId);
		model.addAttribute("user", user);

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		return "backend/user-edit";
	}

	// Save user
	@RequestMapping(value = "/admin/user-edit-save", method = RequestMethod.POST)
	public String userEditSave(final Model model, @RequestParam("avatarFile") MultipartFile avatarFile,
			@ModelAttribute("user") User user) throws IOException {
		user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
		userService.saveEditUser(avatarFile, user);

		return "redirect:/admin/user-list";
	}
}
