
package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
//    method to save data to db
    public int saveCategory(Category cat){
        Session session=this.factory.openSession();
        Transaction tx=session.beginTransaction();
        int catId=(int)session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories(){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from Category");
        List<Category> list=q.getResultList();
        return list;
    }
  
}
