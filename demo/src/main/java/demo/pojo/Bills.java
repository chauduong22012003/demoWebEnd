package demo.pojo;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.*;

import com.google.protobuf.Timestamp;

@Entity
@Table(name = "bills")
public class Bills {
	
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name="id_bill")
	private int idBill;
	 @Column(name="idCus")
    private int idCus;
	 @Column(name="time")
    private LocalDateTime time;
	 @Column(name="name")
    private String name;
	 @Column(name="address")
    private String address;
	 @Column(name="city")
    private String city;
	 @Column(name="phone")
    private String phone;
	 @Column(name="mail")
    private String mail;
	 @Column(name="orderNote")
    private String orderNote;
	 @Column(name="payment_method")
    private String paymentMethod;
	 @Column(name="price")
	 private double price ;
	 
	public int getIdBill() {
		return idBill;
	}
	public void setIdBill(int idBill) {
		this.idBill = idBill;
	}
	public int getIdCus() {
		return idCus;
	}
	public void setIdCus(int idCus) {
		this.idCus = idCus;
	}
	public LocalDateTime getTime() {
		return time;
	}
	public void setTime(LocalDateTime time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
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
	public String getOrderNote() {
		return orderNote;
	}
	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Bills() {
		super();
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Bills(int idCus, LocalDateTime time, String name, String address, String city, String phone, String mail,
			String orderNote, String paymentMethod, double price) {
		super();
		this.idCus = idCus;
		this.time = time;
		this.name = name;
		this.address = address;
		this.city = city;
		this.phone = phone;
		this.mail = mail;
		this.orderNote = orderNote;
		this.paymentMethod = paymentMethod;
		this.price = price;
	}
	
	
	
	
	
	
   
}