/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.model;

import com.sathish.obj.ProductReview;
import java.util.List;

/**
 *
 * @author Sathish
 */
public class ProductReviewDao extends AbstractDao {

    public ProductReviewDao() {
        super();
    }

    public List paging(Integer pageNumber, Integer perPage) {
        return super.paging(ProductReview.class, pageNumber, perPage); //To change body of generated methods, choose Tools | Templates.
    }

    public Integer count() {
        return super.count(ProductReview.class); //To change body of generated methods, choose Tools | Templates.
    }

    public List findAll() {
        return super.findAll(ProductReview.class); //To change body of generated methods, choose Tools | Templates.
    }

    public ProductReview find(Integer id) {
        return (ProductReview) super.find(ProductReview.class, id); //To change body of generated methods, choose Tools | Templates.
    }

    public void delete(ProductReview obj) {
        super.delete(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(ProductReview obj) {
        super.update(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(ProductReview obj) {
        super.save(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveOrUpdate(ProductReview obj) {
        super.saveOrUpdate(obj); //To change body of generated methods, choose Tools | Templates.
    }

}
