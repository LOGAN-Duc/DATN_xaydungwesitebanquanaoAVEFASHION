package vn.devpro.asestore.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Role;
import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.service.RoleService;
import vn.devpro.asestore.service.UserService;
@Controller
public class AdminRoleController extends BaseController{
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/role-list", method = RequestMethod.GET)
	public String roleList(final Model model) throws IOException {
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		return "/backend/role-list";
	}

	// -----------------add new role----------------------------------------
	@RequestMapping(value = "/admin/role-add", method = RequestMethod.GET)
	public String userAdd(final Model model) throws IOException {
		// Lay danh sach user tu tbl_user trong database
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		Role role = new Role();
		role.setCreateDate(new Date());
		model.addAttribute("role", role);
		return "backend/role-add";
	}

	@RequestMapping(value = "/admin/role-add-save", method = RequestMethod.POST)
	private String roleAddSave(final Model model, final HttpServletRequest request, @ModelAttribute("role") Role role)
			throws IOException {
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role-list";
	}

	@RequestMapping(value = "/admin/role-edit/{roleId}", method = RequestMethod.GET)
	private String roleEdit(final Model model, @PathVariable("roleId") int roleId) throws IOException {
		Role role = roleService.getById(roleId);
		model.addAttribute("role", role);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		return "backend/role-edit";
	}

	@RequestMapping(value = "/admin/role-edit-save", method = RequestMethod.POST)
	private String categoryEditSave(final Model model, final HttpServletRequest request,
			@ModelAttribute("role") Role role) throws IOException {
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role-list";
	}
}
