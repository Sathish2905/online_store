/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sathish.model;

import com.sathish.obj.UserRole;
import java.util.List;

/**
 *
 * @author Sathish
 */
public class UserRoleDao extends AbstractDao{

    public UserRoleDao() {
        super();
    }

    public List findAll() {
        return super.findAll(UserRole.class); //To change body of generated methods, choose Tools | Templates.
    }

    public Object find(Integer id) {
        return super.find(UserRole.class, id); //To change body of generated methods, choose Tools | Templates.
    }

    public void delete(UserRole obj) {
        super.delete(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(UserRole obj) {
        super.update(obj); //To change body of generated methods, choose Tools | Templates.
    }
    
    public void save(UserRole obj) {
        super.save(obj); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveOrUpdate(UserRole obj) {
        super.saveOrUpdate(obj); //To change body of generated methods, choose Tools | Templates.
    }

}
