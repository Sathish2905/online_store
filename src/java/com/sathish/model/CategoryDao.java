/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.model;

import com.sathish.obj.Category;
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
public class CategoryDao extends AbstractDao {

    private Session session;
    private Transaction tx;

    public CategoryDao() {
        super();
    }

    public List paging(Integer pageNumber, Integer perPage) {
        return super.paging(Category.class, pageNumber, perPage); //To change body of generated methods, choose Tools | Templates.
    }

    public Integer count() {
        return super.count(Category.class); //To change body of generated methods, choose Tools | Templates.
    }

    public List findAll() {
        List objects = null;
        try {
            startOperation2();
            Query query = session.createQuery("from " + Category.class.getName());
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }

    public Category find(Integer id) {
        Category obj = null;
        try {
            startOperation2();
            obj = (Category) session.load(Category.class, id);
            Hibernate.initialize(obj.getProduct());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return obj;
    }

    public void delete(Category obj) {
        super.delete(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(Category obj) {
        super.update(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Category obj) {
        super.save(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveOrUpdate(Category obj) {
        super.saveOrUpdate(obj); //To change body of generated methods, choose Tools | Templates.
    }
    
    public void startOperation2() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

}
