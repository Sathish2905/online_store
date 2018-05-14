/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.action;

import com.sathish.obj.*;
import com.sathish.model.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.Validation;
import com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author Sathish
 */
@Validation
public class CategoryAction extends ActionSupport {

    private final CategoryDao categoryDao;
    private final ProductDao productDao;
    private List<Category> listCategory;
    private Category category;
    private List<Product> listProduct;
    private Integer maxPage;

    public CategoryAction() {
        categoryDao = new CategoryDao();
        productDao = new ProductDao();
        listCategory = new ArrayList<>();
    }

    @Override
    @SkipValidation
    public String execute() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer id = Integer.parseInt(request.getParameter("id"));
            category = categoryDao.find(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String categoryPaging() throws Exception {
        try {
            Integer page, catId;
            Double totalNumberOfRecords = 0.0;
            Double numberOfRecordsPerPage = 4.0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            catId = Integer.parseInt(request.getParameter("id"));
            category = categoryDao.find(catId);
            System.out.println(category.getName());
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            } else {
                page = 1;
            }
            totalNumberOfRecords = productDao.countWithCategoryId(catId).doubleValue();
            Double startIndex = (page * numberOfRecordsPerPage) - numberOfRecordsPerPage;
            Double temp = Math.ceil(totalNumberOfRecords / numberOfRecordsPerPage);
            maxPage = temp.intValue();
            if (totalNumberOfRecords % 2 != 0) {
                maxPage += 1;
            }
            listProduct = productDao.pagingWithCategoryId(startIndex.intValue(), numberOfRecordsPerPage.intValue(), catId);
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
            totalNumberOfRecords = categoryDao.count().doubleValue();
            Double startIndex = (page * numberOfRecordsPerPage) - numberOfRecordsPerPage;
            Double temp = Math.ceil(totalNumberOfRecords / numberOfRecordsPerPage);
            maxPage = temp.intValue();
            if (totalNumberOfRecords % 2 != 0) {
                maxPage += 1;
            }
            listCategory = categoryDao.paging(startIndex.intValue(), numberOfRecordsPerPage.intValue());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String insert() throws Exception {
        try {
            category = new Category();
            category.setId(0);
            listCategory = categoryDao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String delete() throws Exception {
        try {
            Integer categoryId = 0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            categoryId = Integer.parseInt(request.getParameter("id"));
            Category c = new Category();
            c.setId(categoryId);
            categoryDao.delete(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String edit() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer categoryId = Integer.parseInt(request.getParameter("id"));
            category = categoryDao.find(categoryId);
            listCategory = categoryDao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String save() throws Exception {
        try {
            categoryDao.save(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    //<editor-fold defaultstate="collapsed" desc="getter setter">
    @SkipValidation
    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }

    @VisitorFieldValidator(message = "")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Product> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<Product> listProduct) {
        this.listProduct = listProduct;
    }

    public Integer getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(Integer maxPage) {
        this.maxPage = maxPage;
    }
//</editor-fold>

}
