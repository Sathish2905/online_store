/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.action;

import com.sathish.model.*;
import com.sathish.obj.*;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Sathish
 */
public class UserAction extends ActionSupport {

    private UserDao userDao;
    private UserRoleDao userRoleDAO;
    private User user;
    private List<User> listUser;
    private List<UserRole> listUserRole;

    public UserAction() {
        userDao = new UserDao();
        userRoleDAO = new UserRoleDao();
    }

    @Override
    public String execute() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer id = Integer.parseInt(request.getParameter("id"));
            user = userDao.find(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String index() throws Exception {
        try {
            listUser = userDao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String indexCustomer() throws Exception {
        try {
            List<User> a = userDao.findAll();
            listUser = new ArrayList<User>();
            for (User user1 : a) {
                if (user1.getRole().getId().equals(2)) {
                    listUser.add(user1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String insert() throws Exception {
        try {
            user = new User();
            user.setId(0);
            listUserRole = userRoleDAO.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String delete() throws Exception {
        try {
            Integer userId = 0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            userId = Integer.parseInt(request.getParameter("id"));
            userDao.delete(userDao.find(userId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String edit() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            int userId = Integer.parseInt(request.getParameter("id"));
            user = userDao.find(userId);
            listUserRole = userRoleDAO.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String editProfile() throws Exception {
        try {
            int userId = ((User) ActionContext.getContext().getSession().get("user")).getId();
            user = userDao.find(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String save() throws Exception {
        try {
            userDao.save(user);
            ActionContext.getContext().getSession().remove("user");
            ActionContext.getContext().getSession().put("user", userDao.find(user.getId()));
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
    //</editor-fold>   

}
