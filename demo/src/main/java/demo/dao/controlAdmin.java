package demo.dao;
import org.hibernate.Session;

import demo.pojo.*;
import demo.utl.*;
public class controlAdmin {
	
	public static void addUser(String _name, String _pass) {
		User newUSer=new User();
		newUSer.setName(_name);
		newUSer.setPassword(_pass);
		
		try {
			Session sess=HibernateUtils.getSessionFactory().openSession();
			sess.beginTransaction();
			sess.save(newUSer);
			sess.getTransaction().commit();
			sess.close();
			System.out.print("add successful!");
		}
		catch (Exception e) {
			System.out.print("process has a error! ");
		}
	}
	public static void removeUser(int _id) {
		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			User us=sess.get(User.class, _id);
			if(us!=null) {
				sess.beginTransaction();
				sess.delete(us);
				sess.getTransaction().commit();
			}
			sess.close();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
