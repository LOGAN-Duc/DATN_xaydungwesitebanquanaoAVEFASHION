package vn.devpro.asestore.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<CartProduct> cartInProducts = new ArrayList<CartProduct>();

	public List<CartProduct> getCartInProducts() {
		return cartInProducts;
	}

	public void setCartInProducts(List<CartProduct> cartInProducts) {
		this.cartInProducts = cartInProducts;
	}

	public Cart(List<CartProduct> cartInProducts) {
		super();
		this.cartInProducts = cartInProducts;
	}

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	// tim san pham trong gio hang
	public int findPrductById(int id) {
		// TODO Auto-generated method stub

		for (int index = 0; index < this.cartInProducts.size(); index++) {
			if (this.cartInProducts.get(index).getProductId() == id) {
				return index;
			}
		}
		return -1;
	}

	// Tinh tong so san pham trong gio hang
	public Integer totalCartProduct() {
		// TODO Auto-generated method stub
		Integer total = 0;
		for (CartProduct cartInProduct : cartInProducts) {
			total += cartInProduct.getQuantity();
		}
		return total;
	}

	//	tinh tong tien hang
	public BigDecimal totalCartPrice() {
		// TODO Auto-generated method stub
		BigDecimal total = BigDecimal.ZERO;
		for (CartProduct cartInProduct : cartInProducts) {
			total = total.add(cartInProduct.totalPrice());
		}
		return total;
	}

	public void updateQuantity(int id) {
		// TODO Auto-generated method stub
		for (int index = 0; index < this.cartInProducts.size(); index++) {
	        if (this.cartInProducts.get(index).getProductId() == id) {
	        	cartInProducts.get(index).setQuantity(this.cartInProducts.get(index).getQuantity()+1);	
	        }
	    }
	}
}
