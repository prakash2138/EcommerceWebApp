
package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {
   private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
//    method to get category object by its id
    public Category getCategoryById(int catId){
        Category category=null;
        
        Session s=this.factory.openSession();
        category=s.get(Category.class, catId);
        s.close();
        return category;
    }
    
    //    method to save data to db
    public boolean saveProduct(Product product){
        boolean f=false;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    
     public List<Product> getAllProducts(){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from Product");
        List<Product> list=q.getResultList();
        return list;
    }
     
     public List<Product> getProductsById(int cid){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from Product as p where p.category.categoryId=:id");
        q.setParameter("id", cid);
        List<Product> list=q.getResultList();
        return list;
    }
}

