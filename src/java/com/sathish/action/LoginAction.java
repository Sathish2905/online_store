/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.action;

import com.sathish.helper.MD5Hash;
import com.sathish.model.UserDao;
import com.sathish.obj.User;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author Sathish
 */
public class LoginAction extends ActionSupport {

    private UserDao userDao;
    private User userBean;

    public LoginAction() {
        userDao = new UserDao();
    }

    @Override
    public String execute() throws Exception {
        String username = userBean.getUsername();
        String password = userBean.getPassword();//MD5Hash.hash(userBean.getPassword());
        try {
            User user = userDao.findByUsername(username);
            if (user == null) {
                return INPUT;
            }
            if (user.getPassword().equals(password)) {
                Map session = ActionContext.getContext().getSession();
                session.put("user", user);
                session.put("role", user.getRole().getName());
                if (user.getRole().getId() == 1) {
                    return "admin";
                } else {
                    return "store";
                }
            } else {
                return INPUT;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return INPUT;
    }

    public String page() throws Exception {
        return SUCCESS;
    }

    public User getUserBean() {
        return userBean;
    }

    public void setUserBean(User userBean) {
        this.userBean = userBean;
    }
}
