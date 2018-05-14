/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.interceptor;

import com.sathish.action.AdminAction;
import com.sathish.obj.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;

/**
 *
 * @author Sathish
 */
public class AuthenticationInterceptor implements Interceptor {

    public AuthenticationInterceptor() {
    }

    public void destroy() {

    }

    public void init() {

    }

    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();

        User user = (User) sessionAttributes.get("user");

        if (user == null) {
            return "login";
        } else {
            Action action = (Action) actionInvocation.getAction();
            if (action instanceof AdminAction) {
                ((AdminAction) action).setUserBean(user);
            }
            return actionInvocation.invoke();
        }
    }

}
