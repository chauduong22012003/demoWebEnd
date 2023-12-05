package demo.pojo;
import demo.feld.*;
import java.math.BigDecimal;

import javax.persistence.*;

import com.google.protobuf.Timestamp;

@Entity
@Table(name = "saled")
public class Saled {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="id_customer")
	private int customerId;

	@Column(name="id_product")
    private int productId;
	@Column(name="name_product")
    private String nameProduct;
	@Column(name="price")
    private BigDecimal price;
	@Column(name="quantity")
    private int quantity;
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Saled() {
		super();
	}
	public Saled(int customerId, int productId, String nameProduct, BigDecimal price, int quantity) {
		super();
		this.customerId = customerId;
		this.productId = productId;
		this.nameProduct = nameProduct;
		this.price = price;
		this.quantity = quantity;
	}
	
	
	
	
	
	
	
	
   
}