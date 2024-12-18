package vn.devpro.asestore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.service.CategoryService;
import vn.devpro.asestore.service.ProductService;
import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.Model.Product;

@Controller
public class UserProductController extends BaseController {
	
	@Autowired
	private ProductService productSevice;
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	public String indexDetail(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("productId") int productId)
			throws IOException {
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		Product product = productSevice.getById(productId);
		model.addAttribute("product",product);
		
		
		List<Product> productHots = productSevice.findHot();
		if (productHots.size()<4) {
			productHots = productSevice.findCreatDate();
		}
		model.addAttribute("productHots", productHots);
		return "frontend/product-detail";
	}
}
