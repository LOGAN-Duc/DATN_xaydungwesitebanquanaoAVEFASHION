package vn.devpro.asestore.dto;

import java.math.BigDecimal;

public class CartProduct {
	private int productId;
	private String productName;
	private Integer quantity;
	private String Avatar;
	private BigDecimal price;
	public BigDecimal totalPrice() {
		// TODO Auto-generated method stub
		return this.price.multiply(new BigDecimal(this.quantity.toString()));
	}
	public CartProduct(int productId, String productName, Integer quantity, String avatar, BigDecimal price) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.quantity = quantity;
		Avatar = avatar;
		this.price = price;
	}

	public CartProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getAvatar() {
		return Avatar;
	}

	public void setAvatar(String avatar) {
		Avatar = avatar;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Object getId() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
