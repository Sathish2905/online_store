///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.aptech.action;
//
//import com.aptech.helper.MD5Hash;
//import com.aptech.obj.*;
//import com.aptech.model.*;
//import com.opensymphony.xwork2.ActionContext;
//import com.opensymphony.xwork2.ActionSupport;
//import com.opensymphony.xwork2.validator.annotations.Validation;
//import com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator;
//import java.sql.Timestamp;
//import java.util.*;
//import javax.servlet.http.HttpServletRequest;
//import org.apache.struts2.ServletActionContext;
//import org.apache.struts2.interceptor.validation.SkipValidation;
//
///**
// *
// * @author Sathish
// */
//@Validation
//public class StoreAction extends ActionSupport {
//
////<editor-fold defaultstate="collapsed" desc="variable">
//    private ProductDao productDao;
//    private CategoryDao categoryDao;
//    private static final long serialVersionUID = 9149826260758390091L;
//    private List<Category> listCategory;
//    private List<Product> listProduct;
//    private String searchString;
//    private Integer maxPage;
//    private UserDao userDao;
//    private OrderDao orderDao;
//
//    private ArrayList<OrderDetail> cart;
//    private Double total;
//    private User userBean;
//
////</editor-fold>
//    public StoreAction() {
//        productDao = new ProductDao();
//        categoryDao = new CategoryDao();
//        userDao = new UserDao();
//        orderDao = new OrderDao();
//    }
//
//    @Override
//    @SkipValidation
//    public String execute() throws Exception {
//        listProduct = productDao.findRecent();
//        listCategory = categoryDao.findAll();
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String pagingProduct() throws Exception {
//        try {
//            listProduct = productDao.findRecent();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String header() throws Exception {
//        try {
//            listCategory = categoryDao.findAll();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String sidebar() throws Exception {
//        try {
//            listCategory = categoryDao.findAll();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String search() throws Exception {
//        try {
//            if ("".equals(searchString)) {
//                Integer page;
//                Double totalNumberOfRecords = 0.0;
//                Double numberOfRecordsPerPage = 4.0;
//                HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//                if (request.getParameter("page") != null) {
//                    page = Integer.parseInt(request.getParameter("page"));
//                } else {
//                    page = 1;
//                }
//                totalNumberOfRecords = productDao.count().doubleValue();
//                Double startIndex = (page * numberOfRecordsPerPage) - numberOfRecordsPerPage;
//                Double temp = Math.ceil(totalNumberOfRecords / numberOfRecordsPerPage);
//                maxPage = temp.intValue();
//                if (totalNumberOfRecords % 2 != 0) {
//                    maxPage += 1;
//                }
//                listProduct = productDao.paging(startIndex.intValue(), numberOfRecordsPerPage.intValue());
//            } else {
//                Integer page;
//                Double totalNumberOfRecords = 0.0;
//                Double numberOfRecordsPerPage = 4.0;
//                HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//                if (request.getParameter("page") != null) {
//                    page = Integer.parseInt(request.getParameter("page"));
//                } else {
//                    page = 1;
//                }
//                totalNumberOfRecords = productDao.count().doubleValue();
//                Double startIndex = (page * numberOfRecordsPerPage) - numberOfRecordsPerPage;
//                Double temp = Math.ceil(totalNumberOfRecords / numberOfRecordsPerPage);
//                maxPage = temp.intValue();
//                if (totalNumberOfRecords % 2 != 0) {
//                    maxPage += 1;
//                }
//                listProduct = productDao.findByName(searchString);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String buy() throws Exception {
//        try {
//            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//            Integer id = Integer.parseInt(request.getParameter("id"));
//
//            cart = (ArrayList<OrderDetail>) ActionContext.getContext().getSession().get("cart");
//            if (cart == null) {
//                cart = new ArrayList<OrderDetail>();
//            }
//
//            Product p = productDao.getProductWithReviewById(id);
//            for (int i = 0; i < cart.size(); i++) {
//                OrderDetail orderDetail = cart.get(i);
//                if (orderDetail.getProduct().getId() == p.getId()) {
//                    orderDetail.setQuantity(orderDetail.getQuantity() + 1.0);
//                    cart.set(i, orderDetail);
//                    ActionContext.getContext().getSession().put("cart", cart);
//                    return SUCCESS;
//                }
//            }
//            cart.add(new OrderDetail(p, p.getPrice(), 1.0, p.getDiscount()));
//            ActionContext.getContext().getSession().put("cart", cart);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String cart() throws Exception {
//        cart = (ArrayList<OrderDetail>) ActionContext.getContext().getSession().get("cart");
//        if (cart != null) {
//            total = 0.0;
//            for (OrderDetail orderDetail : cart) {
//                total = total + (orderDetail.getQuantity() * orderDetail.getPrice());
//            }
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String logout() throws Exception {
//        ActionContext.getContext().getSession().remove("user");
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String clear_cart() throws Exception {
//        ActionContext.getContext().getSession().remove("cart");
//        addActionMessage("Cart are cleaned");
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String checkout() throws Exception {
//        try {
//            cart = (ArrayList<OrderDetail>) ActionContext.getContext().getSession().get("cart");
//            if (cart == null) {
//                addActionError("No items");
//                return INPUT;
//            }
//            User user = (User) ActionContext.getContext().getSession().get("user");
//            Order order = new Order();
//            order.setCreated(new java.sql.Date(System.currentTimeMillis()));
//            order.setCode(MD5Hash.getCode());
//            order.setId(0);
//            order.setStatus(0);
//            order.setUser(user);
//            for (int i = 0; i < cart.size(); i++) {
//                cart.get(i).setOrder(order);
//            }
//            order.setOrderDetails(cart);
//            orderDao.save(order);
//            ActionContext.getContext().getSession().remove("cart");
//            addActionMessage("Your order has been submitted");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    @SkipValidation
//    public String register() throws Exception {
//        return SUCCESS;
//    }
//
//    public String addUser() throws Exception {
//        try {
//            UserRole role = new UserRole();
//            role.setId(2);
//            userBean.setPassword(MD5Hash.hash(userBean.getPassword()));
//            userBean.setId(0);
//            userBean.setRole(role);
//            userDao.save(userBean);
//            Map session = ActionContext.getContext().getSession();
//            session.put("user", userBean);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return SUCCESS;
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="Getter setter">
//    public List<Category> getListCategory() {
//        return listCategory;
//    }
//
//    public void setListCategory(List<Category> listCategory) {
//        this.listCategory = listCategory;
//    }
//
//    public String getSearchString() {
//        return searchString;
//    }
//
//    public void setSearchString(String searchString) {
//        this.searchString = searchString;
//    }
//
//    public List<Product> getListProduct() {
//        return listProduct;
//    }
//
//    public void setListProduct(List<Product> listProduct) {
//        this.listProduct = listProduct;
//    }
//
//    public Integer getMaxPage() {
//        return maxPage;
//    }
//
//    public void setMaxPage(Integer maxPage) {
//        this.maxPage = maxPage;
//    }
//
//    public ArrayList<OrderDetail> getCart() {
//        return cart;
//    }
//
//    public void setCart(ArrayList<OrderDetail> cart) {
//        this.cart = cart;
//    }
//
//    public Double getTotal() {
//        return total;
//    }
//
//    @VisitorFieldValidator(message = "")
//    public User getUserBean() {
//        return userBean;
//    }
//
//    public void setUserBean(User userBean) {
//        this.userBean = userBean;
//    }
//
//// </editor-fold>
//}
