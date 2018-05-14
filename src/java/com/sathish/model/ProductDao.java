/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.model;

import com.sathish.obj.Product;
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
public class ProductDao extends AbstractDao {

    private Session session;
    private Transaction tx;

    public ProductDao() {
        super();
    }

    public List findAll() {
        return super.findAll(Product.class); //To change body of generated methods, choose Tools | Templates.
    }

    public Product find(Integer id) {
        Product product = null;
        try {
            startOperation2();
            product = (Product) session.load(Product.class, id);
            Hibernate.initialize(product.getProductReview());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return product;
    }

    public Product findWithOrder(Integer id) {
        Product product = null;
        try {
            startOperation2();
            product = (Product) session.load(Product.class, id);
            Hibernate.initialize(product.getOrderDetail());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return product;
    }
    
    public void delete(Product obj) {
        super.delete(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(Product obj) {
        super.update(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Product obj) {
        super.save(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveOrUpdate(Product obj) {
        super.saveOrUpdate(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public List paging(Integer pageNumber, Integer perPage) {
         List objects = null;
        try {
            startOperation2();
            Query query = session.createQuery("from " + Product.class.getName());
            query.setMaxResults(perPage);
            query.setFirstResult(pageNumber);
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }

    public List pagingWithCategoryId(Integer pageNumber, Integer perPage, Integer catId) {
        List objects = null;
        try {
            startOperation2();
            Query query = session.createQuery("from " + Product.class.getName() + " p where p.category.id = " + catId);
            query.setMaxResults(perPage);
            query.setFirstResult(pageNumber);
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }
    
    public List findRecent() {
        List objects = null;
        try {
            startOperation2();
            Query query = session.createQuery("from Product order by id desc").setMaxResults(8);
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }

    public Integer count() {
        Long size = null;
        startOperation2();
        try {
            Query query = session.createQuery("select count(*) from " + Product.class.getName());
            size = (Long) query.uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return size.intValue();
    }

    public Integer countWithCategoryId(Integer catId) {
        Long size = null;
        startOperation2();
        try {
            Query query = session.createQuery("select count(*) from " + Product.class.getName() + " p where p.category.id = " + catId);
            size = (Long) query.uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return size.intValue();
    }

    public Product getProductWithReviewById(Integer productId) {
        Product product = null;
        try {
            startOperation2();
            product = (Product) session.load(Product.class, productId);
            Hibernate.initialize(product.getProductReview());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return product;
    }
    
    public void startOperation2() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

    public List findByName(String searchString) {
        List objects = null;
        try {
            startOperation2();
            Query query = session.createQuery("from Product p where p.name like '%" + searchString + "%'");
            objects = query.list();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return objects;
    }

}
