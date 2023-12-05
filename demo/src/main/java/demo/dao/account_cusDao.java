package demo.dao;
import demo.pojo.*;

import java.util.List;

import org.hibernate.Session;

import org.hibernate.query.Query;

import demo.feld.*;
import demo.utl.*;

public class account_cusDao {
	
	public static boolean Register(String _mail, String _pass,String _username,String _phone) {
		if(checkAcc(_mail)==true && checkPhone(_phone)==true) {
			Customer newcus=new Customer(_username,_mail,_phone);
			
			try(Session sess=HibernateUtils.getSessionFactory().openSession()) {
				sess.beginTransaction();
				sess.save(newcus);
				sess.getTransaction().commit();
				sess.beginTransaction();
				Account_cus newAcc=new Account_cus(newcus.getId() , _mail,_phone  ,  _username,_pass);
				sess.save(newAcc);
				sess.getTransaction().commit();
				sess.close();
				return true;
			}
			catch (Exception e) {
				return false;
			}
		}
		
		return false;
	}
	
	public static boolean checkAcc(String _mail) {
	    String hql = "SELECT COUNT(*) FROM Customer WHERE email = :_email";
	    Session sess = HibernateUtils.getSessionFactory().openSession();
	    sess.beginTransaction();
	    Query<Long> query = sess.createQuery(hql, Long.class);
	    query.setParameter("_email", _mail);

	    List<Long> resultList = query.list();
	    if (!resultList.isEmpty()) {
	        long count = resultList.get(0);
	        if (count > 0) {
	            sess.close();
	            return false;
	        }
	    }

	    sess.close();
	    return true;
	}
	public static boolean checkPhone(String phone) {
		String regex = "0\\d{9,10}";
		return phone.matches(regex);
	}
	
	public static boolean checkLogin(String mail, String pass) {
		Session sess=HibernateUtils.getSessionFactory().openSession();
		sess.beginTransaction();
		Query<Account_cus> query = sess.createQuery("SELECT u FROM Account_cus u WHERE u.mail = :_mail AND u.password = :_password", Account_cus.class);
		query.setParameter("_mail", mail);
	    query.setParameter("_password", pass);
	    Account_cus e=query.uniqueResult();
	    sess.close();
	    if (e != null) {
	        return true; 
	    } else {
	        return false; 
	    }
	}
	public static Customer getUser(String mail) {
		Customer cus=null;
		Session sess=HibernateUtils.getSessionFactory().openSession();
		sess.beginTransaction();
		 String hql = "FROM Customer WHERE email = :email";
         Query<Customer> query = sess.createQuery(hql,Customer.class);
         query.setParameter("email", mail);

        
         cus = query.uniqueResult();
         
		sess.close();
		return cus;
	}
	
	
}
