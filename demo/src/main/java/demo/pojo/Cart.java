package demo.pojo;
import demo.feld.*;


import java.math.BigDecimal;

import javax.persistence.*;
@IdClass(cartId.class)
@Entity
@Table(name = "cart")
public class Cart {
	@Id
	@Column(name="id_customer")
	private int customerId;
	@Id
	@Column(name="id_product")
    private int productId;
	@Column(name="name_product")
    private String nameProduct;
	@Column(name="price")
    private BigDecimal price;
	@Column(name="quantity")
    private int quantity;
	@Column(name="size")
    private int size;
	@Column(name="material")
    private String material;
	
	
	
	
	public Cart() {
		
	}
	
	public Cart(int customerId, int productId, String nameProduct, BigDecimal price, int quantity, int size,
			String material) {
		super();
		this.customerId = customerId;
		this.productId = productId;
		this.nameProduct = nameProduct;
		this.price = price;
		this.quantity = quantity;
		this.size = size;
		this.material = material;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

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
   
}


