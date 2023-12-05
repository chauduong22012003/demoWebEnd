package demo.pojo;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mail")
public class mail {
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name="id")
	private int idmail;
	
	 @Column(name="email")
   private String mailName;

	public int getIdmail() {
		return idmail;
	}

	public void setIdmail(int idmail) {
		this.idmail = idmail;
	}

	public String getMailName() {
		return mailName;
	}

	public void setMailName(String mailName) {
		this.mailName = mailName;
	}

	public mail(String mailName) {
		super();
	
		this.mailName = mailName;
	}

	public mail() {
		super();
	}
	 
	 
}
