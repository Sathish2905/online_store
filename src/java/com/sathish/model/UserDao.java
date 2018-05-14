/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.model;

import com.sathish.obj.User;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sathish
 */
public class UserDao extends AbstractDao {

    private Session session;
    private Transaction tx;

    public UserDao() {
        super();
    }

    public Integer count() {
        return super.count(User.class); //To change body of generated methods, choose Tools | Templates.
    }

    public List findAll() {
        return super.findAll(User.class); //To change body of generated methods, choose Tools | Templates.
    }

    public User find(Integer id) {
        return (User) super.find(User.class, id); //To change body of generated methods, choose Tools | Templates.
    }

    public void delete(User obj) {
        super.delete(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(User obj) {
        super.update(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(User obj) {
        super.save(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveOrUpdate(User obj) {
        super.saveOrUpdate(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public User findByUsername(String username) {
        Object obj = null;
        try {
            startOperation2();
            obj = session.createQuery("from User where username=?").setString(0, username).uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return (User) obj;
    }

    public void startOperation2() throws HibernateException {
        session = HibernateFactory.openSession();
        tx = session.beginTransaction();
    }

    public User findWithOrder(Integer id) {
        User user = null;
        try {
            startOperation2();
            user = (User) session.load(User.class, id);
            Hibernate.initialize(user.getOrder());
            tx.commit();
        } catch (HibernateException e) {
            handleException(e);
        } finally {
            HibernateFactory.close(session);
        }
        return user;
    }
}
