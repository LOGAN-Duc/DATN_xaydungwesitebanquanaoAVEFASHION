package vn.devpro.asestore.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.Model.Product;
import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.service.CategoryService;
import vn.devpro.asestore.service.ProductService;
import vn.devpro.asestore.service.UserService;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;

@Controller
public class AdminProductController extends BaseController implements AsestoreContants{

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/product-list", method = RequestMethod.GET)
	public String productList(final Model model,
			final HttpServletRequest request) throws IOException{
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		SearchModel productSearch = new SearchModel();
		
		//tìm với status
		productSearch.setStatus(2);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			productSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		
		//tìm với category
		productSearch.setCategoryId(0);
		if(!StringUtils.isEmpty(request.getParameter("categoryId"))) {
			productSearch.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		}
		
		//tìm với keyword
		productSearch.setKeyword(request.getParameter("keyword"));
		
		//tìm kiếm với date
		productSearch.setBeginDate(request.getParameter("beginDate"));
		productSearch.setEndDate(request.getParameter("endDate"));
		
		//Bắt đầu phân trang
		if(!StringUtils.isEmpty(request.getParameter("page"))) { //bấm nút chuyển trang
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}else {

			productSearch.setCurrentPage(1); //Lần đầu luôn hiển thị trang 1
		}
		
		
		List<Product> allProduct = productService.sreachProduct(productSearch);
		
		List<Product> products = new ArrayList<>();
		if(allProduct.size() <= SIZE_OF_PAGE) {
			productSearch.setCurrentPage(1);
		}
		int firstIndex = ( productSearch.getCurrentPage() -1 ) * SIZE_OF_PAGE;
		int index = firstIndex, count =0;
		while (index<allProduct.size()&&count<SIZE_OF_PAGE ) {
			products.add(allProduct.get(index));
			index++;
			count++;
		}

		//phân trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE); //số bản ghi trên 1 trang
		productSearch.setTotalItems(productService.findAllActive().size()); // tổng số sản phẩm
		
		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);
		return "backend/product-list";
	}
	// -------------------Add product---------------------------
	@RequestMapping(value = "/admin/product-add", method = RequestMethod.GET)
	public String productAdd(final Model model) throws IOException {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		Product product = new Product();
		product.setCreateDate(new Date());
		model.addAttribute("product", product);
		return "backend/product-add";
	}

//	//--------------Save product to db-----------------------
	@RequestMapping(value = "/admin/product-add-save", method = RequestMethod.POST)
	public String productAddSave(final Model model, @RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles, @ModelAttribute("product") Product product)
			throws IOException {

		productService.saveAddProduct(avatarFile, imageFiles, product);
		return "redirect:/admin/product-list";
	}

	// ===========Product edit==================
	@RequestMapping(value = "/admin/product-edit/{productId}", method = RequestMethod.GET)
	private String productEdit(final Model model, @PathVariable("productId") int productId) throws IOException {
		Product product = productService.getById(productId);
		model.addAttribute("product", product);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		return "backend/product-edit";
	}

	// Save user to database
	@RequestMapping(value = "/admin/product-edit-save", method = RequestMethod.POST)
	public String productEditSave(final Model model, @RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles, @ModelAttribute("product") Product product)
			throws IOException {

		productService.saveEditProduct(avatarFile, imageFiles, product);
		return "redirect:/admin/product-list";
	}

	// Dalete user
//	@RequestMapping(value = "/admin/product-delete/{productID}", method = RequestMethod.GET)
//	public String productDelete(final Model model, @PathVariable("productID") int productID // lay user id khi click
//																							// Edit
//	) throws IOException {
//		productService.deleteProductbyId(productID);
//		return "redirect:/admin/product-list";
//	}
	
	@RequestMapping(value = "/admin/product-delete/{productID}", method = RequestMethod.GET)
	public String productDelete(final Model model,
			@PathVariable("productID") int productID //lay user id khi click Edit
			) throws IOException{
		Product product = productService.getById(productID);
		product.setStatus(Boolean.FALSE);
		productService.saveOrUpdate(product);
		return "redirect:/admin/product-list";
	}

}
