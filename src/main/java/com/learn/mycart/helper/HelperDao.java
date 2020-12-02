/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.helper;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class HelperDao {
    public static Map<String, Long> getCounts(SessionFactory factory){
        Session session=factory.openSession();
        
        String q1="select count(*) from User";
        String q2="select count(*) from Product";
        
        Query query1=session.createQuery(q1);
        Query query2=session.createQuery(q2);
        
        Long userCount=(Long)query1.getResultList().get(0);
        Long productCount=(Long)query2.getResultList().get(0);
        
        Map<String, Long> map=new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        
        return map;
    
    }
}
