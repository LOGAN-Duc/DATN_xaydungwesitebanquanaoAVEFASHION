package vn.devpro.asestore.dto;

public class Contact {
	private String txtName;
	private String txtEmail;
	private String txtMobile;
	private String txtAddress;
	private String txtMessage;
	private String txtCustomerId;
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	


	public Contact(String txtName, String txtEmail, String txtMobile, String txtAddress, String txtMessage,
			String txtCustomerId) {
		super();
		this.txtName = txtName;
		this.txtEmail = txtEmail;
		this.txtMobile = txtMobile;
		this.txtAddress = txtAddress;
		this.txtMessage = txtMessage;
		this.txtCustomerId = txtCustomerId;
	}



	public String getTxtCustomerId() {
		return txtCustomerId;
	}



	public void setTxtCustomerId(String txtCustomerId) {
		this.txtCustomerId = txtCustomerId;
	}



	public void setTxtMessage(String txtMessage) {
		this.txtMessage = txtMessage;
	}

	public String getTxtName() {
		return txtName;
	}
	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}
	public String getTxtEmail() {
		return txtEmail;
	}
	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}
	public String getTxtMobile() {
		return txtMobile;
	}
	public void setTxtMobile(String txtMobile) {
		this.txtMobile = txtMobile;
	}
	public String getTxtAddress() {
		return txtAddress;
	}
	public void setTxtAddress(String txtAddress) {
		this.txtAddress = txtAddress;
	}
	public String getTxtMessage() {
		return txtMessage;
	}
	public void setTxtMassage(String txtMessage) {
		this.txtMessage = txtMessage;
	}
	
}
