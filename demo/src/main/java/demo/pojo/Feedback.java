package demo.pojo;



import javax.persistence.*;


@Entity
@Table(name = "feedback")
public class Feedback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	 private int id;
	@Column(name="name")
    private String name;
	@Column(name="mail")
    private String mail;
	@Column(name="content")
    private String content;
	
	
	
	
	
	public Feedback() {
		
	}
	public Feedback( String name, String mail, String content) {
		super();
		
		this.name = name;
		this.mail = mail;
		this.content = content;
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
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}