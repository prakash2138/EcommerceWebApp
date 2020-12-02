package com.learn.mycart.dao;

import com.learn.mycart.entities.User;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class userDao {

    private SessionFactory factory;

    public userDao(SessionFactory factory) {
        this.factory = factory;
    }

    
    
    public User getUserByEmailAndPassword(String email, String password){
        User user=null;
        try {
           String query="from User where userEmail=:e and userPassword=:p"; 
            Session session=this.factory.openSession();
            Query q=session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user=(User)q.getSingleResult();
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
