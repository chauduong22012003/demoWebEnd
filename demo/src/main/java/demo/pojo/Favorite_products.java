package demo.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;


import demo.feld.favorite;
@IdClass(favorite.class)
@Entity
@Table(name = "favorite_products")
public class Favorite_products {
    @Id
    @Column(name="id")
    private int id;
    
    @Id
    @Column(name="id_cus")
    private int id_cus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
	public Favorite_products() {
		super();
	}

	public int getId_cus() {
		return id_cus;
	}

	public void setId_cus(int id_cus) {
		this.id_cus = id_cus;
	}

	public Favorite_products(int id, int id_cus) {
		super();
		this.id = id;
		this.id_cus = id_cus;
	}

	
}
