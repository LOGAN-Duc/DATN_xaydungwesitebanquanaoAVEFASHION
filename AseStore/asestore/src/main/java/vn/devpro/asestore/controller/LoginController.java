package vn.devpro.asestore.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Role;
import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.service.RoleService;
import vn.devpro.asestore.service.UserService;


@Controller
public class LoginController {
	@Autowired 
	private UserService userService;
	@Autowired 
	private RoleService roleService;
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String homePage(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		return "/login";
	}


	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signAccount(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		return "signup";
	}
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String register(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException {
//
//		User user = new User();
//		user.setUsername(request.getParameter("username"));
//		user.setName(request.getParameter("name"));
//		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
//		user.setEmail(request.getParameter("email"));
//		user.setMobile(request.getParameter("mobile"));
//		
////		Set role cho user moi - mac dinh role la 'CUSTOMER'
////		+ Lay role co name la 'customer' trong DB
//		Role role = roleService.getRoleByName("CUSTOMER");
//		user.addRelationaUserRole(role);
//		userService.saveOrUpdate(user);
//		
//		return "login";
//	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> register(final Model model, 
	        final HttpServletRequest request, 
	        final HttpServletResponse response,
	        @RequestBody User user) throws IOException {
	    
	    Map<String, Object> jsonResult = new HashMap<>();

	    // Kiểm tra thông tin đầu vào
	    if (user.getUsername() == null || user.getUsername().isEmpty()) {
	        jsonResult.put("code", 100);
	        jsonResult.put("message", "Tên người dùng không được để trống.");
	    } else if (user.getEmail() == null || user.getEmail().isEmpty()) {
	        jsonResult.put("code", 101);
	        jsonResult.put("message", "Email không được để trống.");
	    } else if (user.getPassword() == null || user.getPassword().isEmpty()) {
	        jsonResult.put("code", 102);
	        jsonResult.put("message", "Mật khẩu không được để trống.");
	    } else {
	        // Tạo User mới
	        User userNew = new User();
	        userNew.setUsername(user.getUsername());
	        userNew.setName(user.getName());
	        userNew.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
	        userNew.setEmail(user.getEmail());
	        userNew.setMobile(user.getMobile());

	        // Lấy role từ DB
	        Role role = roleService.getRoleByName("CUSTOMER");
	        userNew.addRelationaUserRole(role);

	        try {
	            // Lưu User vào cơ sở dữ liệu
	            userService.saveOrUpdate(userNew);
	            jsonResult.put("code", 200);
	            jsonResult.put("message", "Đăng ký thành công.");
	        } catch (Exception e) {
	            jsonResult.put("code", 500);
	            jsonResult.put("message", "Có lỗi xảy ra trong quá trình đăng ký: " + e.getMessage());
	        }
	    }

	    // Trả về kết quả JSON
	    return ResponseEntity.ok(jsonResult);
	}
	
}
