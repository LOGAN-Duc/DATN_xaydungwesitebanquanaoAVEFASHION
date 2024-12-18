package vn.devpro.asestore.controller.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.Model.Product;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;
import vn.devpro.asestore.service.CategoryService;
import vn.devpro.asestore.service.ProductService;

@Controller
public class UserCategoryController extends BaseController implements AsestoreContants {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/danhmuc", method = RequestMethod.GET)
	public String productList(final Model model, final HttpServletRequest request) throws IOException {
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		SearchModel productSearch = new SearchModel();

		// tìm với status
		productSearch.setStatus(2);
		if (!StringUtils.isEmpty(request.getParameter("status"))) {
			productSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}

		// tìm với category
		productSearch.setCategoryId(0);
		if (!StringUtils.isEmpty(request.getParameter("categoryId"))) {
			productSearch.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		}

		// tìm với keyword
		productSearch.setKeyword(request.getParameter("keyword"));

		// tìm kiếm với date
		productSearch.setBeginDate(request.getParameter("beginDate"));
		productSearch.setEndDate(request.getParameter("endDate"));

		// Bắt đầu phân trang
		if (!StringUtils.isEmpty(request.getParameter("page"))) { // bấm nút chuyển trang
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		} else {

			productSearch.setCurrentPage(1); // Lần đầu luôn hiển thị trang 1
		}

		List<Product> allProduct = productService.sreachProduct(productSearch);

		List<Product> products = new ArrayList<>();
		if (allProduct.size() <= SIZE_OF_PAGE1) {
			productSearch.setCurrentPage(1);
		}
		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE1;
		int index = firstIndex, count = 0;
		while (index < allProduct.size() && count < SIZE_OF_PAGE1) {
			products.add(allProduct.get(index));
			index++;
			count++;
		}

		// phân trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE1); // số bản ghi trên 1 trang
		productSearch.setTotalItems(productService.findAll().size()); // tổng số sản phẩm

		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);
		return "frontend/danhmuc";
	}
}
