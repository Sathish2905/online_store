/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sathish.action;

import com.sathish.model.CategoryDao;
import com.sathish.model.ProductDao;
import com.sathish.model.ProductReviewDao;
import com.sathish.obj.Category;
import com.sathish.obj.Product;
import com.sathish.obj.ProductImage;
import com.sathish.obj.ProductReview;
import com.sathish.obj.User;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.Validation;
import com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author Sathish
 */
@Validation
public class ProductAction extends ActionSupport implements ServletRequestAware {

    private final ProductDao productDao;
    private final CategoryDao categoryDao;
    private final ProductReviewDao productReviewDao;
    private Product product;
    private List<Product> listProduct;
    private List<Category> listCategory;
    private ProductReview productReview;
    private File userImage;
    private String userImageContentType;
    private String userImageFileName;
    private HttpServletRequest servletRequest;
    private ProductDao dao;
    private Integer maxPage;

    public ProductAction() {
        productDao = new ProductDao();
        categoryDao = new CategoryDao();
        productReviewDao = new ProductReviewDao();
        dao = new ProductDao();
        listCategory = new ArrayList<>();
    }

    @Override
    public String execute() throws Exception {
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            Integer id = Integer.parseInt(request.getParameter("id"));
            product = productDao.getProductWithReviewById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String review() throws Exception {
        try {
            product = new Product();
            product.setId(productReview.getId());
            productReview.setProduct(product);
            User user = (User) ActionContext.getContext().getSession().get("user");
            productReview.setUser(user);
            productReview.setId(0);
            productReviewDao.save(productReview);
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
            totalNumberOfRecords = dao.count().doubleValue();
            Double startIndex = (page * numberOfRecordsPerPage) - numberOfRecordsPerPage;
            Double temp = Math.ceil(totalNumberOfRecords / numberOfRecordsPerPage);
            maxPage = temp.intValue();
            if (totalNumberOfRecords % 2 != 0) {
                maxPage += 1;
            }
            listProduct = dao.paging(startIndex.intValue(), numberOfRecordsPerPage.intValue());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String insert() throws Exception {
        product = new Product();
        product.setId(0);
        listCategory = categoryDao.findAll();
        return SUCCESS;
    }

    @SkipValidation
    public String delete() throws Exception {
        try {
            Integer productId = 0;
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
            productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDao.findWithOrder(productId);
            if (product.getOrderDetail() != null) {
                productDao.delete(product);
            } else {
                addFieldError("name","This product is in another order, you should not delete!");
                return INPUT;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    @SkipValidation
    public String edit() throws Exception {
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        int productId = Integer.parseInt(request.getParameter("id"));
        product = (Product) productDao.find(productId);
        listCategory = categoryDao.findAll();
        return SUCCESS;
    }

    public String save() throws Exception {
        String timeStamp = new SimpleDateFormat("HHmmss").format(Calendar.getInstance().getTime());
        try {
            try {

                String filePath = servletRequest.getSession().getServletContext().getRealPath(
                        "/store/product/" + timeStamp);
                System.out.println("Server path:" + filePath);
                File fileToCreate = new File(filePath, this.userImageFileName);
                FileUtils.copyFile(this.userImage, fileToCreate);
            } catch (Exception e) {
                e.printStackTrace();
                addActionError(e.getMessage());
            }
            ProductImage image = new ProductImage();
            image.setUrl("store/product/" + timeStamp + "/" + this.userImageFileName);
            image.setProduct(product);
            List<ProductImage> listImage = new ArrayList<ProductImage>();
            listImage.add(image);
            product.setProductImage(listImage);

            productDao.save(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    //<editor-fold defaultstate="collapsed" desc="getter-setter">
    public List<Product> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<Product> listProduct) {
        this.listProduct = listProduct;
    }

    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }

    @VisitorFieldValidator(message = "")
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public File getUserImage() {
        return userImage;
    }

    public void setUserImage(File userImage) {
        this.userImage = userImage;
    }

    public String getUserImageContentType() {
        return userImageContentType;
    }

    public void setUserImageContentType(String userImageContentType) {
        this.userImageContentType = userImageContentType;
    }

    public String getUserImageFileName() {
        return userImageFileName;
    }

    public void setUserImageFileName(String userImageFileName) {
        this.userImageFileName = userImageFileName;
    }

    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;

    }

    //</editor-fold>
    public ProductReview getProductReview() {
        return productReview;
    }

    public void setProductReview(ProductReview productReview) {
        this.productReview = productReview;
    }

    public Integer getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(Integer maxPage) {
        this.maxPage = maxPage;
    }

}
