/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.model;

import com.sathish.obj.Order;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sathish
 */
public class OrderDao extends AbstractDao {

    private Session session;
    private Transaction tx;
    
    public OrderDao() {
        super();
    }

    public List paging(Integer pageNumber, Integer perPage) {
        return super.paging(Order.class, pageNumber, perPage); //To change body of generated methods, choose Tools | Templates.
    }

    public Integer count() {
        return super.count(Order.class); //To change body of generated methods, choose Tools | Templates.
    }

    public List findAll() {
        return super.findAll(Order.class); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List findLatest() {
        List objects = null;
        try {
            startOperation2();
            Query query = session.createQuery("from " + Order.class.getName() + " o ORDER BY o.id DESC");
            query.setMaxResults(8);
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }

    public Order find(Integer id) {
         Order obj = null;
        try {
            startOperation2();
            obj = (Order) session.load(Order.class, id);
            Hibernate.initialize(obj.getOrderDetails());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return obj;
    }

    public void delete(Object obj) {
        super.delete(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(Object obj) {
        super.update(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Object obj) {
        super.save(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveOrUpdate(Object obj) {
        super.saveOrUpdate(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void startOperation2() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }
}
