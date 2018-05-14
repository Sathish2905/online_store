/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.action;

import com.sathish.model.OrderDao;
import com.sathish.model.OrderDetailDao;
import com.sathish.model.UserDao;
import com.sathish.model.UserRoleDao;
import com.sathish.obj.Order;
import com.sathish.obj.OrderDetail;
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
public class OrderAction extends ActionSupport {

    private List<Order> listOrder;
    private UserDao userDao;
    private OrderDao orderDao;
    private Order order;
    private Integer maxPage;
    public OrderAction() {
        userDao = new UserDao();
        orderDao = new OrderDao();
    }

    @Override
    @SkipValidation
    public String execute() throws Exception {
        return SUCCESS;
    }

    @SkipValidation
    public String getOrderByUser() throws Exception {
        try {
            Integer id = ((User) ActionContext.getContext().getSession().get("user")).getId();
            User user = userDao.findWithOrder(id);
            listOrder = user.getOrder();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String deleteOrderById() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer id = Integer.parseInt(request.getParameter("id"));
            orderDao.delete(orderDao.find(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String getOrderDetailById() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer id = Integer.parseInt(request.getParameter("id"));
            order = orderDao.find(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String index() throws Exception {
        try {
            Integer page;
            Double totalNumberOfRecords = 0.0;
            Double numberOfRecordsPerPage = 4.0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            } else {
                page = 1;
            }
            totalNumberOfRecords = orderDao.count().doubleValue();
            Double startIndex = (page * numberOfRecordsPerPage) - numberOfRecordsPerPage;
            Double temp = Math.ceil(totalNumberOfRecords / numberOfRecordsPerPage);
            maxPage = temp.intValue();
            if (totalNumberOfRecords % 2 != 0) {
                maxPage += 1;
            }
            listOrder = orderDao.paging(startIndex.intValue(), numberOfRecordsPerPage.intValue());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String delete() throws Exception {
        try {
            Integer orderId = 0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            orderId = Integer.parseInt(request.getParameter("id"));
            orderDao.delete(orderDao.find(orderId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String edit() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer orderId = Integer.parseInt(request.getParameter("id"));
            order = orderDao.find(orderId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String save() throws Exception {
        try {
            orderDao.update(order);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public List<Order> getListOrder() {
        return listOrder;
    }

    public void setListOrder(List<Order> listOrder) {
        this.listOrder = listOrder;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Integer getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(Integer maxPage) {
        this.maxPage = maxPage;
    }

}
