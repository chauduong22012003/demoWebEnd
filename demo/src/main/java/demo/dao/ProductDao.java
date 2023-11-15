package demo.dao;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import demo.pojo.*;
import demo.utl.*;
public class ProductDao {
	public static void addProduct(Product newProduct) {
		try {
			Session sess=HibernateUtils.getSessionFactory().openSession();
			sess.beginTransaction();
			sess.save(newProduct);
			sess.getTransaction().commit();
			
			sess.close();
		}catch (Exception e) {
			System.out.print("add product was failure!");
		}	
	}
	public static List<Product> getNikeProducts() {
	    try (Session session = HibernateUtils.getSessionFactory().openSession()) {
	        String hql = "FROM Product WHERE branch = :branch";
	        Query<Product> query = session.createQuery(hql, Product.class);
	        query.setParameter("branch", "Nike");
	        List<Product> nikeProducts = query.getResultList();
	        return nikeProducts;
	    }catch (Exception e) {
			System.out.print("load Nike failure!");
			return null;
		}
	}
}
