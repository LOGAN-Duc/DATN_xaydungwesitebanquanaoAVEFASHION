package vn.devpro.asestore.Model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;


@Entity
@Table(name = "tbl_role")
public class Role extends BaseModel implements GrantedAuthority{
	@Column(name = "name", length = 300, nullable = true)
	private String name;
	@Column(name = "description", length = 500, nullable = true)
	private String description;
	// Mapping many to one : role to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateRole;

	// Mapping many to one : role to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateRole;

	// Mapping many-to-many
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_user_role", joinColumns = @JoinColumn(name = " role_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users = new ArrayList<User>();

	public String getName() {
		return name;
	}

	public Role(String name, String description, User userCreateRole, User userUpdateRole, List<User> users) {
		super();
		this.name = name;
		this.description = description;
		this.userCreateRole = userCreateRole;
		this.userUpdateRole = userUpdateRole;
		this.users = users;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUserCreateRole() {
		return userCreateRole;
	}

	public void setUserCreateRole(User userCreateRole) {
		this.userCreateRole = userCreateRole;
	}

	public User getUserUpdateRole() {
		return userUpdateRole;
	}

	public void setUserUpdateRole(User userUpdateRole) {
		this.userUpdateRole = userUpdateRole;
	}

	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.name;
	}

	

}
