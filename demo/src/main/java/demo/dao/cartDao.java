package demo.dao;

import java.math.BigDecimal;
import java.util.Base64;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import demo.pojo.*;
import demo.utl.HibernateUtils;

public class cartDao {
    public static List<Cart> getAllCart() {
        List<Cart> carts = null;
        try (Session sess = HibernateUtils.getSessionFactory().openSession()) {
            sess.beginTransaction();
            Query<Cart> query = sess.createQuery("FROM Cart", Cart.class);
            carts = query.list();
            System.out.println(carts.get(0).getNameProduct());
            sess.getTransaction().commit();
        } catch (Exception e) {
            // Handle or log the exception
            e.printStackTrace();
        }
        return carts;
    }
    
    
    public static void addToCart(int customerId, int productId, String nameProduct, BigDecimal price, int quantity, int size,
			String material) {
    	try(Session sess =HibernateUtils.getSessionFactory().openSession()){
    		sess.beginTransaction();
    		Cart newcart=new Cart(customerId,productId,nameProduct,price,quantity,size,material);
    		sess.save(newcart);
    		sess.getTransaction().commit();  		
    		sess.close();
    	}catch (Exception e) {
			// TODO: handle exception
		}
    }
    
    
    
    public static List<Cart> getAllCartOfCus(String id_cus){
    	int id=Integer.parseInt(id_cus);
    	
    	List<Cart> list=null;
    	try(Session sess=HibernateUtils.getSessionFactory().openSession()){
    		String hql = "FROM Cart p WHERE p.customerId = :_customerId";
    		Query<Cart> query = sess.createQuery(hql, Cart.class);
    		query.setParameter("_customerId", id);
    		list = query.getResultList();
    	}catch (Exception e) {
    		e.printStackTrace();
            return null;
		}
    	
    	return list;
    }
    public static byte[] getimagePro(int idpro) {
    	try(Session sess=HibernateUtils.getSessionFactory().openSession()){
    		sess.beginTransaction();
    		Product product = sess.get(Product.class, idpro);
    		byte[] image=product.getImage();
    		sess.getTransaction().commit();
    		sess.close();
    		return image;
    	}catch (Exception e) {
			return null;
		}
    	
    }
    
    public static void Inc_Quantity(int idPro,int id_cus) {
    	try(Session sess=HibernateUtils.getSessionFactory().openSession()){
    		sess.beginTransaction();
    		String hql = "FROM Cart WHERE customerId = :_id_cus AND productId = :_idPro";
    		Query<Cart> query = sess.createQuery(hql, Cart.class);
    		query.setParameter("_id_cus", id_cus);
    		query.setParameter("_idPro", idPro);
    		Cart cart=query.uniqueResult();
    		cart.setQuantity(cart.getQuantity()+1);
    		sess.update(cart);
    		sess.getTransaction().commit();
    		sess.close();
    	}catch (Exception e) {
			// TODO: handle exception
		}
    }
    
    public static void Dec_Quantity(int idPro,int id_cus) {
    	try(Session sess=HibernateUtils.getSessionFactory().openSession()){
    		sess.beginTransaction();
    		String hql = "FROM Cart WHERE customerId = :_id_cus AND productId = :_idPro";
    		Query<Cart> query = sess.createQuery(hql, Cart.class);
    		query.setParameter("_id_cus", id_cus);
    		query.setParameter("_idPro", idPro);
    		Cart cart=query.uniqueResult();
    		if(cart.getQuantity()>1) {
    			cart.setQuantity(cart.getQuantity()-1);
        		sess.update(cart);
        		sess.getTransaction().commit();
    		}
    		
    		sess.close();
    	}catch (Exception e) {
			// TODO: handle exception
		}
    }
    
    public static BigDecimal getTotalPrice(String id_cus) {
    	 double total=0;
        if (id_cus == null) {
            
            return BigDecimal.ZERO; 
        }

        try {
            int idCus = Integer.parseInt(id_cus);
           
            try (Session sess = HibernateUtils.getSessionFactory().openSession()) {
                sess.beginTransaction();
                String hql = "FROM Cart p WHERE p.customerId = :_customerId";
                Query<Cart> query = sess.createQuery(hql, Cart.class);
                query.setParameter("_customerId", idCus);
                List<Cart> list = query.getResultList();
               
                for (Cart i : list) {
                	
                    total=total+i.getPrice().doubleValue()*i.getQuantity();
                   
                }
                
                sess.close();
            
            } catch (Exception e) {
                return BigDecimal.ZERO; 
            }
            BigDecimal bigTotal=BigDecimal.valueOf(total);
            return bigTotal;
        } catch (NumberFormatException e) {
            
            return BigDecimal.ZERO; 
        }
    }
    
}