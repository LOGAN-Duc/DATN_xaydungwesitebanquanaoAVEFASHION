package vn.devpro.asestore.Model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Random;
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
@Table(name = "tbl_sale_order")
public class SaleOrder extends BaseModel {

	@Column(name = "code", length = 60, nullable = false)
	private String code;

	@Column(name = "total", nullable = false)
	private BigDecimal total;

	@Column(name = "customer_name", length = 300, nullable = true)
	private String customer_name;

	@Column(name = "customer_mobile", length = 120, nullable = true)
	private String customer_mobile;

	@Column(name = "customer_email", length = 120, nullable = true)
	private String customer_email;

	@Column(name = "customer_address", length = 300, nullable = true)
	private String customer_address;

	// Mappihng many to one : SaleOrder to User
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	// Mapping one to many : Sale order to Sale Order Product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleOrder")
	private Set<SaleOrderProduct> saleOrderProducts = new HashSet<SaleOrderProduct>();

	public SaleOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public SaleOrder(String code, BigDecimal total, String customer_name, String customer_mobile, String customer_email,
			String customer_address, User user, Set<SaleOrderProduct> saleOrderProducts) {
		super();
		this.code = code;
		this.total = total;
		this.customer_name = customer_name;
		this.customer_mobile = customer_mobile;
		this.customer_email = customer_email;
		this.customer_address = customer_address;
		this.user = user;
		this.saleOrderProducts = saleOrderProducts;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}
	public String generateRandomString(int length) {
		// TODO Auto-generated method stub
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();

        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            char randomChar = characters.charAt(index);
            sb.append(randomChar);
        }

        return sb.toString();
	}

	public void addRelationalSaleOrderProduct(SaleOrderProduct orderProduct) {
		// TODO Auto-generated method stub
		saleOrderProducts.add(orderProduct);
		orderProduct.setSaleOrder(this);
	}
	public void removeRelationalSaleOrderProduct(SaleOrderProduct orderProduct) {
		// TODO Auto-generated method stub
		saleOrderProducts.remove(orderProduct);
		orderProduct.setSaleOrder(this);
	}
}
