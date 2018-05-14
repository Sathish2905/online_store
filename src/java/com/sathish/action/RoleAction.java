/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.action;

import com.sathish.model.UserRoleDao;
import com.sathish.obj.User;
import com.sathish.obj.UserRole;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.Validation;
import com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author Sathish
 */
@Validation
public class RoleAction extends ActionSupport {

    private User user;
    private UserRole userRole;
    private List<User> listUser;
    private List<UserRole> listUserRole;
    private UserRoleDao dao;

    public RoleAction() {
        dao = new UserRoleDao();
    }

    @Override
    @SkipValidation
    public String execute() throws Exception {
        return SUCCESS;
    }

    @SkipValidation
    public String index() throws Exception {
        try {
            listUserRole = dao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String insert() throws Exception {
        userRole = new UserRole();
        userRole.setId(0);
        return SUCCESS;
    }

    @SkipValidation
    public String delete() throws Exception {
        try {
            Integer userId = 0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            userId = Integer.parseInt(request.getParameter("id"));
            UserRole role = new UserRole();
            role.setId(userId);
            dao.delete(role);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String edit() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            int userId = Integer.parseInt(request.getParameter("id"));
            userRole = (UserRole) dao.find(userId);
            listUserRole = dao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String save() throws Exception {
        try {
            dao.save(userRole);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    //<editor-fold defaultstate="collapsed" desc="getter setter">
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getListUser() {
        return listUser;
    }

    public void setListUser(List<User> listUser) {
        this.listUser = listUser;
    }

    public List<UserRole> getListUserRole() {
        return listUserRole;
    }

    public void setListUserRole(List<UserRole> listUserRole) {
        this.listUserRole = listUserRole;
    }

    @VisitorFieldValidator(message = "")
    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }
    //</editor-fold>
}
