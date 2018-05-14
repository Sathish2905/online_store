/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.interceptor;

import com.sathish.obj.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Sathish
 */
public class AuthorizationInterceptor implements Interceptor {

    public AuthorizationInterceptor() {
    }

    public void destroy() {

    }

    public void init() {

    }

    private List<String> allowedRoles = new ArrayList<String>();
    private List<String> disallowedRoles = new ArrayList<String>();

    public void setAllowedRoles(String roles) {
        this.allowedRoles = stringToList(roles);
    }

    public void setDisallowedRoles(String roles) {
        this.disallowedRoles = stringToList(roles);
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String result = null;
        if (!isAllowed(request, invocation.getAction())) {
            result = handleRejection(invocation, response);
        } else {
            result = invocation.invoke();
        }
        return result;
    }

    /**
     * Splits a string into a List
     */
    protected List<String> stringToList(String val) {
        if (val != null) {
            String[] list = val.split("[ ]*,[ ]*");
            return Arrays.asList(list);
        } else {
            return Collections.EMPTY_LIST;
        }
    }

    /**
     * Determines if the request should be allowed for the action
     *
     * @param request The request
     * @param action The action object
     * @return True if allowed, false otherwise
     */
    protected boolean isAllowed(HttpServletRequest request, Object action) {
        HttpSession session = request.getSession(false);
        boolean result = false;
        User loginUser = null;
        if (session != null) {
            loginUser = (User) session.getAttribute("user");
        }

        if (allowedRoles.size() > 0) {
            if (session == null || loginUser == null) {
                return result;
            }
            for (String role : allowedRoles) {
                if (role.equalsIgnoreCase(loginUser.getRole().getName())) {
                    result = true;
                }
            }
            return result;
        } else if (disallowedRoles.size() > 0) {
            if (session != null || loginUser != null) {
                for (String role : disallowedRoles) {
                    if (role.equalsIgnoreCase(loginUser.getRole().getName())) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    /**
     * Handles a rejection by sending a 403 HTTP error
     *
     * @param invocation The invocation
     * @return The result code
     * @throws Exception
     */
    protected String handleRejection(ActionInvocation invocation,
            HttpServletResponse response)
            throws Exception {

//        response.sendError(HttpServletResponse.SC_FORBIDDEN);
        return "invalidAdminAccess";
    }

}
