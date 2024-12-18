package vn.devpro.asestore.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.Model.Product;
import vn.devpro.asestore.Model.SaleOrder;
import vn.devpro.asestore.Model.SaleOrderProduct;
import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.service.CategoryService;
import vn.devpro.asestore.service.ProductService;
import vn.devpro.asestore.service.SaleOrderService;
import vn.devpro.asestore.service.UserService;
import vn.devpro.asestore.dto.Cart;
import vn.devpro.asestore.dto.CartProduct;
import vn.devpro.asestore.dto.Contact;

@Controller
public class CartController extends BaseController implements AsestoreContants {

	@Autowired
	private ProductService productService;
	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCard(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartProduct cartInProduct) throws IOException {
		// lay session
		HttpSession session = request.getSession();
//		Kiem tr XEM CO GIO CHua

		Cart cart = null;
		if (session.getAttribute("cart") == null) { // chua co gio hang
			cart = new Cart();
			session.setAttribute("cart", cart);
		} else {// da co gio hang
			cart = (Cart) session.getAttribute("cart");
		}

		// Them vao gio hang\
		// Lay trong DB
		Product productDB = productService.getById(cartInProduct.getProductId());

		// Kiểm tra số lượng yêu cầu
		int quantityToAdd = cartInProduct.getQuantity();
		if (quantityToAdd > productDB.getQuantity()) {
		    Map<String, Object> jsonMap = new HashMap<>();
		    jsonMap.put("code", 400);
		    jsonMap.put("message", "Số lượng yêu cầu vượt quá số lượng còn lại: " + productDB.getQuantity());
		    return ResponseEntity.badRequest().body(jsonMap);
		}

		// Kiểm tra sản phẩm trong giỏ hàng
		int index = cart.findPrductById(productDB.getId());
		if (index != -1) { // Sản phẩm đã có trong giỏ hàng
		    int newQuantity = cart.getCartInProducts().get(index).getQuantity() + quantityToAdd;
		    if (newQuantity > productDB.getQuantity()) {
		        Map<String, Object> jsonMap = new HashMap<>();
		        jsonMap.put("code", 400);
		        jsonMap.put("message", "Số lượng tổng cộng vượt quá số lượng còn lại: " + productDB.getQuantity());
		        return ResponseEntity.badRequest().body(jsonMap);
		    }
		    cart.getCartInProducts().get(index).setQuantity(newQuantity);
		} else { // Sản phẩm chưa có trong giỏ hàng
		    cartInProduct.setAvatar(productDB.getAvatar());
		    cartInProduct.setProductName(productDB.getName());
		    cartInProduct.setPrice(productDB.getSale_price() != null ? productDB.getSale_price() : productDB.getPrice());
		    cart.getCartInProducts().add(cartInProduct);
		}

		// Cập nhật giỏ hàng trong phiên
		session.setAttribute("cart", cart);

		// Trả về tổng số sản phẩm
		Map<String, Object> jsonMap = new HashMap<>();
		jsonMap.put("code", 200);
		jsonMap.put("message", "Đã thêm sản phẩm " + productDB.getName() + " vào giỏ hàng");
		jsonMap.put("totalCartProducts", cart.totalCartProduct());
		return ResponseEntity.ok(jsonMap);
	}
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity(@RequestBody List<CartProduct> products,
			final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Map<String, Object> jsonResult = new HashMap<>();
		if (cart != null) {
		    for (CartProduct product : products) {
		        int index = cart.findPrductById(product.getProductId());
		        if (index != -1) {
		            int quantity = product.getQuantity();
		            if (quantity < 1) {
		                quantity = 1;
		            } else {
		                Product availableProduct = productService.getById(product.getProductId());
		                if (quantity > availableProduct.getQuantity()) {
		                    jsonResult.put("code", 400);
		                    jsonResult.put("message", "Số lượng cho sản phẩm " + availableProduct.getName() + 
		                                               " không thể vượt quá " + availableProduct.getQuantity());
		                    return ResponseEntity.ok(jsonResult); 
		                } else {
		                    availableProduct.setQuantity(availableProduct.getQuantity() - quantity);
		                }
		            }
		            cart.getCartInProducts().get(index).setQuantity(quantity);
		        }
		    }
		}

		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		HttpSession session = request.getSession();
		Cart cart = null;
		String message = null;

		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
			message = "Co " + cart.totalCartProduct() + " trong gio hang";
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
		} else {
			message = "Khong co san pham nao trong gia hang";
		}
		session.setAttribute("cart", cart);
		model.addAttribute(message, message);
		
		if(isLogined()) {
			model.addAttribute("user",getLoginedUser());
		}else {
			model.addAttribute("user",new User());
		}

		return "/frontend/cart-view";
	}

	@RequestMapping(value = "/product-cart-delete/{productId}", method = RequestMethod.GET)
	public String delProduct(final Model model,final HttpServletRequest request,final HttpServletResponse response,
			@PathVariable("productId") int productId ) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findPrductById(productId);
		if (index!= 1) {
			cart.getCartInProducts().remove(index);
		}
		if(cart.totalCartProduct()==0) {
			cart = null;
	    }
		session.setAttribute("cart", cart);
		
		return "redirect:/cart-view";
	}
	
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> placeOrder(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody Contact contact)
			
			throws IOException {
		Map<String, Object> jsonResult = new HashMap<>();
		if (contact.getTxtName().isEmpty()) {
			jsonResult.put("code", 100);
			jsonResult.put("message", "Ban chua nhap ten");
		}else if (contact.getTxtMobile().isEmpty()) {
			jsonResult.put("code", 101);
			jsonResult.put("message", "Ban chua nhap so dien thoai");
		}else {
			HttpSession  session = request.getSession();
			if (session.getAttribute("cart")!=null) {
				Cart cart = (Cart) session.getAttribute("cart");
				if (cart.totalCartProduct().intValue()>0) {
					
					
					SaleOrder saleOrder = new SaleOrder();
					String code = saleOrder.generateRandomString(3);
					saleOrder.setCustomer_name(contact.getTxtName());
					saleOrder.setCustomer_mobile(contact.getTxtMobile());
					saleOrder.setCustomer_address(contact.getTxtAddress());
					saleOrder.setCustomer_email(contact.getTxtEmail());
					saleOrder.setTotal(cart.totalCartPrice());
					saleOrder.setCode(code);
					saleOrder.setCreateDate(new Date());
					saleOrder.setStatus(false);
					User user = new User();
					
					
					if (contact.getTxtCustomerId()==null) {
						user=userService.getById(12);
					}else {
						int userid = Integer.parseInt(contact.getTxtCustomerId());
						user = userService.getById(userid);
					}
					saleOrder.setUser(user);
					
					for (CartProduct cartProduct : cart.getCartInProducts()) {
						SaleOrderProduct orderProduct = new  SaleOrderProduct();
						orderProduct.setQuantity(cartProduct.getQuantity().intValue());
						Product product = productService.getById(cartProduct.getProductId());
						product.setQuantity(product.getQuantity()-orderProduct.getQuantity());
						orderProduct.setProduct(product);
						saleOrder.addRelationalSaleOrderProduct(orderProduct);
					}
					
					saleOrderService.saveOrUpdate(saleOrder);
					
					session.setAttribute("cart", null);
					response.sendRedirect("/frontend/index");
					
					session.setAttribute("checkout", true);
					
				}else{

					jsonResult.put("code", 103);
					jsonResult.put("message", "Loi duong truyen");
				}
			}else {

				jsonResult.put("code", 200);
				jsonResult.put("message", "Dat hang thanh cong");
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}
}
