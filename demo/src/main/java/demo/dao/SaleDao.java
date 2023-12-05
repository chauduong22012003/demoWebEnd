package demo.dao;

import org.hibernate.Session;

import demo.pojo.Saled;
import demo.utl.HibernateUtils;

public class SaleDao {
	public static void addSaled(Saled sale) {
		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			sess.save(sale);
			sess.getTransaction().commit();
			sess.close();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
}
