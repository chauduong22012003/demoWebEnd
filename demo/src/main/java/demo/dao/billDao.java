package demo.dao;

import java.time.LocalDateTime;

import org.hibernate.Session;

import demo.pojo.Bills;
import demo.utl.HibernateUtils;

public class billDao {
	public static void AddBill(Bills bill) {

		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			sess.save(bill);
			sess.close();
			sess.getTransaction().commit();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
