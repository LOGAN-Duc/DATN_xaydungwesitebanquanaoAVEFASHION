package vn.devpro.asestore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.Model.Product;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.service.CategoryService;
import vn.devpro.asestore.service.ProductService;
import vn.devpro.asestore.service.UserService;

@Controller
public class UserHomeController extends BaseController {
	@Autowired
	private ProductService productSevice;
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Category> categories = categoryService.findAll();model.addAttribute("categories", categories);
		List<Product> products = productSevice.findCreatDateTop10();
		List<Product> productHots = productSevice.findHot();
		if (productHots.size()<4) {
			productHots = productSevice.findCreatDate();
		}
		model.addAttribute("productHots", productHots);
		model.addAttribute("products", products);
		
		model.addAttribute("totalProducts", products.size());
		return "frontend/index";
	}
	
	@RequestMapping(value = "/user-edit", method = RequestMethod.GET)
	public String userEdit(final Model model,final HttpServletRequest request, final HttpServletResponse response  // lay user id khi click Edit
	) throws IOException {

		// Lay user tu tbl_user trong database
		
		return "frontend/user-edit";
	}
	
	
}
