package vn.devpro.asestore.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
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

import vn.devpro.asestore.Model.SaleOrder;
import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;
import vn.devpro.asestore.service.SaleOrderService;
import vn.devpro.asestore.service.UserService;

@Controller
public class AdminOrderController extends BaseController implements AsestoreContants {
	@Autowired
	private SaleOrderService orderService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/order-view", method = RequestMethod.GET)
	public String productList(final Model model,
			final HttpServletRequest request) throws IOException{
		
		SearchModel productSearch = new SearchModel();
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		//tìm với status
		productSearch.setStatus(2);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			productSearch.setStatus(Integer.parseInt(request.getParameter("status")));
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
		
		
		List<SaleOrder> allProduct = orderService.sreachOrder(productSearch);
		
		List<SaleOrder> products = new ArrayList<SaleOrder>();
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
		productSearch.setTotalItems(orderService.findAll().size()); // tổng số sản phẩm
		
		model.addAttribute("saleorders", products);
		model.addAttribute("productSearch", productSearch);
		return "backend/order-view";
	}
	// ----------------edit user---------------------
		@RequestMapping(value = "/admin/order-edit/{saleorderId}", method = RequestMethod.GET)
		public String userEdit(final Model model, @PathVariable("saleorderId") int orderId // lay user id khi click Edit
		) throws IOException {

			// Lay user tu tbl_user trong database
			SaleOrder user = orderService.getById(orderId);
			model.addAttribute("saleorder", user);

			List<User> users = userService.findAll();
			model.addAttribute("users", users);

			return "backend/order-edit";
		}
		// Save user
		@RequestMapping(value = "/admin/order-view-save", method = RequestMethod.POST)
		public String userEditSave(final Model model,
				@ModelAttribute("saleorder") SaleOrder user) throws IOException {
			
			
			orderService.saveOrUpdate(user);

			return "redirect:/admin/order-view";
		}
	
	
	@RequestMapping(value = "/admin/order-delete/{saleorderId}", method = RequestMethod.GET)
	public String productDelete(final Model model,
			@PathVariable("saleorderId") int orderId //lay user id khi click Edit
			) throws IOException{
		SaleOrder product = orderService.getById(orderId);
		product.setStatus(Boolean.FALSE);
		orderService.saveOrUpdate(product);
		return "redirect:/admin/order-view";
	}

}
