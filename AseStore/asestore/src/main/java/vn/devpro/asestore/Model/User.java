package vn.devpro.asestore.Model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_user")
public class User extends BaseModel implements UserDetails {

	@Column(name = "username", length = 120, nullable = false)
	private String username;

	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;

	@Column(name = "password", length = 120, nullable = false)
	private String password;

	@Column(name = "name", length = 60, nullable = true)
	private String name;

	@Column(name = "email", length = 200, nullable = true)
	private String email;

	@Column(name = "mobile", length = 60, nullable = true)
	private String mobile;

	@Column(name = "address", length = 300, nullable = true)
	private String address;

	@Column(name = "description", length = 500, nullable = true)
	private String description;

	// Mapping many to one : user to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateUser;

	// Mapping many to one : user to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateUser;

	// Mapping One to many : User to User(for create user)
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateUser")
	private Set<User> userCreateUsers = new HashSet<User>();

	// Mapping One to many : User to User(for update user)
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateUser")
	private Set<User> userUpdateUsers = new HashSet<User>();

	// ------------Mapping many_to many : tbl_user-to-tbl_role
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	private List<Role> roles = new ArrayList<Role>();

	// Mapping One to many : User to SaleOrder
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	private Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();

	// Mapping One to many : User to User(for create user)
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateProduct")
	private Set<Product> userCreateProducts = new HashSet<Product>();

	// Mapping One to many : User to User(for update user)
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateProduct")
	private Set<Product> userUpdateProducts = new HashSet<Product>();

	// Mapping one to many : User create Category
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateCategory")
	private Set<Category> userCreateCategories = new HashSet<Category>();
	// Mapping one to many : User update Category
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateCategory")
	private Set<Category> userUpdateCategories = new HashSet<Category>();

	// Mapping One to many : User to User(for create user)
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userCreateRole")
	private Set<Role> userCreateRoles = new HashSet<Role>();

	// Mapping One to many : User to User(for update user)
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userUpdateRole")
	private Set<Role> userUpdateRoles = new HashSet<Role>();

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String username, String avatar, String password, String name, String email, String mobile,
			String address, String description, User userCreateUser, User userUpdateUser, Set<User> userCreateUsers,
			Set<User> userUpdateUsers, List<Role> roles, Set<SaleOrder> saleOrders, Set<Product> userCreateProducts,
			Set<Product> userUpdateProducts, Set<Category> userCreateCategories, Set<Category> userUpdateCategories,
			Set<Role> userCreateRoles, Set<Role> userUpdateRoles) {
		super();
		this.username = username;
		this.avatar = avatar;
		this.password = password;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.description = description;
		this.userCreateUser = userCreateUser;
		this.userUpdateUser = userUpdateUser;
		this.userCreateUsers = userCreateUsers;
		this.userUpdateUsers = userUpdateUsers;
		this.roles = roles;
		this.saleOrders = saleOrders;
		this.userCreateProducts = userCreateProducts;
		this.userUpdateProducts = userUpdateProducts;
		this.userCreateCategories = userCreateCategories;
		this.userUpdateCategories = userUpdateCategories;
		this.userCreateRoles = userCreateRoles;
		this.userUpdateRoles = userUpdateRoles;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Set<Role> getUserCreateRoles() {
		return userCreateRoles;
	}

	public void setUserCreateRoles(Set<Role> userCreateRoles) {
		this.userCreateRoles = userCreateRoles;
	}

	public Set<Role> getUserUpdateRoles() {
		return userUpdateRoles;
	}

	public void setUserUpdateRoles(Set<Role> userUpdateRoles) {
		this.userUpdateRoles = userUpdateRoles;
	}

	public Set<Product> getUserCreateProducts() {
		return userCreateProducts;
	}

	public void setUserCreateProducts(Set<Product> userCreateProducts) {
		this.userCreateProducts = userCreateProducts;
	}

	public Set<Product> getUserUpdateProducts() {
		return userUpdateProducts;
	}

	public void setUserUpdateProducts(Set<Product> userUpdateProducts) {
		this.userUpdateProducts = userUpdateProducts;
	}

	public Set<Category> getUserCreateCategories() {
		return userCreateCategories;
	}

	public void setUserCreateCategories(Set<Category> userCreateCategories) {
		this.userCreateCategories = userCreateCategories;
	}

	public Set<Category> getUserUpdateCategories() {
		return userUpdateCategories;
	}

	public void setUserUpdateCategories(Set<Category> userUpdateCategories) {
		this.userUpdateCategories = userUpdateCategories;
	}

	public User getUserCreateUser() {
		return userCreateUser;
	}

	public void setUserCreateUser(User userCreateUser) {
		this.userCreateUser = userCreateUser;
	}

	public User getUserUpdateUser() {
		return userUpdateUser;
	}

	public void setUserUpdateUser(User userUpdateUser) {
		this.userUpdateUser = userUpdateUser;
	}

	public Set<User> getUserCreateUsers() {
		return userCreateUsers;
	}

	public void setUserCreateUsers(Set<User> userCreateUsers) {
		this.userCreateUsers = userCreateUsers;
	}

	public Set<User> getUserUpdateUsers() {
		return userUpdateUsers;
	}

	public void setUserUpdateUsers(Set<User> userUpdateUsers) {
		this.userUpdateUsers = userUpdateUsers;
	}

	public void addRelationaUserRole(Role role) {
		role.getUsers().add(this);
		roles.add(role);
	}

	public void removeRelationaUserRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}

	public Set<SaleOrder> getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(Set<SaleOrder> saleOrders) {
		this.saleOrders = saleOrders;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
