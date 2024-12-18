package vn.devpro.asestore.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseModel{
	@Column(name = "firstname", length = 120, nullable = true)
	private String firstname;
	
	@Column(name = "lastname", length = 120, nullable = true)
	private String lastname;
	
	@Column(name = "email",length = 200,nullable = true)
	private String email;
	
	@Column(name = "mobile",length = 60,nullable = true)
	private String mobile;
	
	@Column(name = "address",length = 300,nullable = true)
	private String address;
	
	@Column(name = "request_type",length = 300,nullable = true)
	private String request_type;
	
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Contact(String firstname, String lastname, String email, String mobile, String address,
			String request_type) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.request_type = request_type;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
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
	public String getRequest_type() {
		return request_type;
	}
	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}
}
