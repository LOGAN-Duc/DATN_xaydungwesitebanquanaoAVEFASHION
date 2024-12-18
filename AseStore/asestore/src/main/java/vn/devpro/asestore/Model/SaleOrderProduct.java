package vn.devpro.asestore.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sale_order_product")
public class SaleOrderProduct extends BaseModel {

	@Column(name = "quantity", nullable = true)
	private int quantity;

	@Column(name = "description", length = 500, nullable = true)
	private String description;

	// Mapping many to one : sale order product to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;
	
	// Mapping many to one : sale order product to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sale_order_id")
	private SaleOrder saleOrder;

	public SaleOrderProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SaleOrderProduct(int quantity, String description, Product product, SaleOrder saleOrder) {
		super();
		this.quantity = quantity;
		this.description = description;
		this.product = product;
		this.saleOrder = saleOrder;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public SaleOrder getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}
	
	

}
