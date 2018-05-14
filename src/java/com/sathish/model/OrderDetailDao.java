/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.model;

import com.sathish.obj.OrderDetail;
import java.util.List;

/**
 *
 * @author Sathish
 */
public class OrderDetailDao extends AbstractDao {

    public OrderDetailDao() {
        super();
    }

    public List paging(Integer pageNumber, Integer perPage) {
        return super.paging(OrderDetail.class, pageNumber, perPage); //To change body of generated methods, choose Tools | Templates.
    }

    public Integer count() {
        return super.count(OrderDetail.class); //To change body of generated methods, choose Tools | Templates.
    }

    public List findAll() {
        return super.findAll(OrderDetail.class); //To change body of generated methods, choose Tools | Templates.
    }

    public OrderDetail find(Integer id) {
        return (OrderDetail) super.find(OrderDetail.class, id); //To change body of generated methods, choose Tools | Templates.
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

}
