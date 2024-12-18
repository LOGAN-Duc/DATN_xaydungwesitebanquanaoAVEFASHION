package vn.devpro.asestore.Model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product")
public class Product extends BaseModel {

	@Column(name = "name", length = 300, nullable = false)
	private String name;

	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;

	@Column(name = "price", nullable = true)
	private BigDecimal price;
	
	@Column(name = "quantity", nullable = false)
	private int quantity;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "sale_price", nullable = true)
	private BigDecimal sale_price;

	@Column(name = "is_hot", nullable = true)
	private Boolean is_hot = Boolean.FALSE;

	@Column(name = "short_description", length = 500, nullable = true)
	private String short_description;

	@Column(name = "detail_description", length = 300, nullable = true)
	private String detail_description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	// Mapping many to one : Product to Category
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	// Mapping many to one : product to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateProduct;

	// Mapping many to one : product to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateProduct;

	// Mapping One to Many : Product to Sale Order Product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<SaleOrderProduct> saleOrderProducts = new HashSet<SaleOrderProduct>();

	// Mapping One to Many : Product to Product Image
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<ProductImage> productImages = new HashSet<ProductImage>();

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

//	public Product(String name, String avatar, BigDecimal price, BigDecimal sale_price, Boolean is_hot,
//			String short_description, String detail_description, String seo, Category category, User userCreateProduct,
//			User userUpdateProduct, Set<SaleOrderProduct> saleOrderProducts, Set<ProductImage> productImages) {
//		super();
//		this.name = name;
//		this.avatar = avatar;
//		this.price = price;
//		this.sale_price = sale_price;
//		this.is_hot = is_hot;
//		this.short_description = short_description;
//		this.detail_description = detail_description;
//		this.seo = seo;
//		this.category = category;
//		this.userCreateProduct = userCreateProduct;
//		this.userUpdateProduct = userUpdateProduct;
//		this.saleOrderProducts = saleOrderProducts;
//		this.productImages = productImages;
//	}

	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public Product(String name, String avatar, BigDecimal price, int quantity, BigDecimal sale_price, Boolean is_hot,
		String short_description, String detail_description, String seo, Category category, User userCreateProduct,
		User userUpdateProduct, Set<SaleOrderProduct> saleOrderProducts, Set<ProductImage> productImages) {
	super();
	this.name = name;
	this.avatar = avatar;
	this.price = price;
	this.quantity = quantity;
	this.sale_price = sale_price;
	this.is_hot = is_hot;
	this.short_description = short_description;
	this.detail_description = detail_description;
	this.seo = seo;
	this.category = category;
	this.userCreateProduct = userCreateProduct;
	this.userUpdateProduct = userUpdateProduct;
	this.saleOrderProducts = saleOrderProducts;
	this.productImages = productImages;
}

	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	public Set<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getSale_price() {
		return sale_price;
	}

	public void setSale_price(BigDecimal sale_price) {
		this.sale_price = sale_price;
	}

	public Boolean getIs_hot() {
		return is_hot;
	}

	public void setIs_hot(Boolean is_hot) {
		this.is_hot = is_hot;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getDetail_description() {
		return detail_description;
	}

	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUserCreateProduct() {
		return userCreateProduct;
	}

	public void setUserCreateProduct(User userCreateProduct) {
		this.userCreateProduct = userCreateProduct;
	}

	public User getUserUpdateProduct() {
		return userUpdateProduct;
	}

	public void setUserUpdateProduct(User userUpdateProduct) {
		this.userUpdateProduct = userUpdateProduct;
	}

	public void addRelationalProductImage(ProductImage productImage) {
		// TODO Auto-generated method stub
		productImages.add(productImage);
		productImage.setProduct(this);
	}

	public void removeRelationalProductImage(ProductImage productImage) {
		// TODO Auto-generated method stub
		productImages.remove(productImage);
		productImage.setProduct(null);
	}

	public BigDecimal calculateDiscountPercentage() {
		if (price == null || sale_price == null || price.compareTo(BigDecimal.ZERO) == 0) {
			return BigDecimal.ZERO;
		}

		BigDecimal discount = price.subtract(sale_price);
		BigDecimal discountPercentage = discount.divide(price, 2, RoundingMode.HALF_UP)
				.multiply(BigDecimal.valueOf(100));

		return discountPercentage;
	}
}
