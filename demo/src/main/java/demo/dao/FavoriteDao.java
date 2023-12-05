package demo.dao;

import org.hibernate.Session;

import demo.pojo.Favorite_products;
import demo.utl.HibernateUtils;

public class FavoriteDao {
	
	
	
	
	public static void add_favorite_pro(int id_pro, int id_cus) {
		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			Favorite_products FP=new Favorite_products(id_pro,id_cus);
			sess.save(FP);
			sess.getTransaction().commit();
			sess.close();
		}catch (Exception e) {
			System.out.print("failure");
		}
	}
}
