package demo.pojo;



import javax.persistence.*;


@Entity
@Table(name = "account_cus")
public class Account_cus {
	@Id
	@JoinColumn(name = "id_customer", referencedColumnName = "id")
	@Column(name="id_customer")
	
	private int customerId;
	@Column(name="mail")
	private String mail;
	@Column(name="phone")
	private String phone;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	@Column(name="username")
    private String username;
	@Column(name="password")
    private String password;
	
	
	public Account_cus() {
		
	}
	
	public Account_cus(int customerId, String mail, String phone, String username, String password) {
		super();
		this.customerId = customerId;
		this.mail = mail;
		this.phone = phone;
		this.username = username;
		this.password = password;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
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
   
}