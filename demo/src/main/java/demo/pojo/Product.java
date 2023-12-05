package demo.pojo;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "price")
    private double price;





  

	@Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Lob
    @Column(name = "image")
    private byte[] image;
    
    @Lob
    @Column(name = "img1")
    private byte[] img1;
    
    @Lob
    @Column(name = "img2")
    private byte[] img2;
    
    @Column(name = "date_up")
    private java.util.Date date_up;
    
    @Column(name = "quantity")
    private int quantity;
    
    @Column(name = "material")
    private String material;
   

	@Column(name = "branch")
    private String branch;
    
    
	public Product(String name, double price, String description, byte[] image, byte[] img1, byte[] img2, java.util.Date date_up,
				int quantity, String material,String _branch) {
			super();
			this.name = name;
			this.price = price;
			this.description = description;
			this.image = image;
			this.img1 = img1;
			this.img2 = img2;
			this.date_up = date_up;
			this.quantity = quantity;
			this.material = material;
			this.branch = _branch;
		}
 



    public String getBranch() {
		return branch;
	}



	public void setBranch(String branch) {
		this.branch = branch;
	}


	public byte[] getImg1() {
		return img1;
	}



	public void setImg1(byte[] img1) {
		this.img1 = img1;
	}



	public byte[] getImg2() {
		return img2;
	}



	public void setImg2(byte[] img2) {
		this.img2 = img2;
	}



	public java.util.Date getDate_up() {
		return date_up;
	}



	public void setDate_up(java.util.Date date_up) {
		this.date_up = date_up;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}







	public String getMaterial() {
		return material;
	}



	public void setMaterial(String material) {
		this.material = material;
	}

	
    

	public Product() {
		
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

    // Constructors, getters, and setters
    // ...

    // toString method (optional)
    
}
