package demo.dao;
import demo.pojo.*;
import demo.utl.HibernateUtils;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class FeelbackDao {
	
	public static List<Feedback> getAllFeelback() {
		List<Feedback> feedbacks=null;
		try(Session sess=HibernateUtils.getSessionFactory().openSession()) {
			sess.beginTransaction();
			
			Query<Feedback> query = sess.createQuery("FROM Feedback", Feedback.class);
            feedbacks = query.list();
			sess.close();
		}
		catch (Exception e) {
			System.out.print("query table feedback failure!");
		}
		return feedbacks; 
	}
	public static void addFeedback(String _name,String _email, String _content) {
		
		try(Session sess=HibernateUtils.getSessionFactory().openSession()) {
			sess.beginTransaction();
			Feedback fb=new Feedback(_name,_email,_content);
			sess.save(fb);
			sess.getTransaction().commit();
			sess.close();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
