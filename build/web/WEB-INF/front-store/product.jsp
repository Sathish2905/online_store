<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Items -->

<div class="items">
    <div class="container">
        <div class="row">

            <!-- Sidebar -->
            <s:action name="sidebar" executeResult="true">
            </s:action>

            <!-- Main content -->

            <div class="col-md-8 col-sm-8">

                <!-- Breadcrumbs -->
                <ul class="breadcrumb">
                    <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                    <li><a href="items.html">Smartphone</a> <span class="divider">/</span></li>
                    <li class="active">Apple</li>
                </ul>

                <!-- Product details -->

                <div class="product-main">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">

                            <!-- Image. Flex slider -->
                            <div class="product-slider">
                                <div class="product-image-slider flexslider">
                                    <ul class="slides">
                                        <!-- Each slide should be enclosed inside li tag. -->

                                        <!-- Slide #1 -->
                                        <s:iterator value="product.productImage" var="image">
                                            <li>
                                                <!-- Image -->
                                                <img src="${image.url}" alt=""/>
                                            </li>
                                        </s:iterator>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6 col-sm-6">
                            <!-- Title -->
                            <h4 class="title"><s:property value="product.name" /></h4>
                            <h4>$<s:property value="getText('{0,number,#,##0}',{product.price})"/></h4>
                            <p>Brand: <s:property value="product.brand" /></p>
                            <p>Availability : <s:property value="product.stock" /></p>
                            <!-- Quantity and add to cart button -->

                            <s:url action="buy" var="buyTag">
                                <s:param name="id"><s:property value="product.id" /></s:param>
                            </s:url>
                            <div class="button"><s:a href="%{buyTag}">Add to Cart</s:a></div>
                            </div>
                        </div>
                    </div>

                    <br />

                    <!-- Description, specs and review -->

                    <ul class="nav nav-tabs">
                        <!-- Use uniqe name for "href" in below anchor tags -->
                        <li class="active"><a href="#tab1" data-toggle="tab">Description</a></li>
                        <li><a href="#tab2" data-toggle="tab">Specs</a></li>
                        <li><a href="#tab3" data-toggle="tab">Review (${product.productReview.size()})</a></li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content">
                    <!-- Description -->
                    <div class="tab-pane active" id="tab1">
                        <h5 class="title">Product Descriptions</h5>
                        <div class="item-review">
                            <p><s:property value="product.description" /></p>    
                        </div>
                    </div>

                    <!-- Sepcs -->
                    <div class="tab-pane" id="tab2">
                        <h5 class="title">Product Specs</h5>
                        <table class="table table-striped tcart">
                            <tbody>
                                <tr>
                                    <td><strong>Name</strong></td>
                                    <td>Apple iPhone 5G</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <!-- Review -->
                    <div class="tab-pane" id="tab3">
                        <h5>Product Reviews</h5>
                        <s:iterator value="product.productReview" var="review">
                            <div class="item-review">
                                <h5>${review.user.fullname} <span class="color">${review.rate}/5</span></h5>
                                <p>${review.comment}</p>
                            </div>
                        </s:iterator>
                        <hr />
                        <h5 class="title">Write a Review</h5>

                        <div class="form form-small">
                            <!-- Review form (not working)-->
                            <s:if test="#session.user != null">
                                <s:form action="review" cssClass="form-horizontal" theme="simple">    
                                    <s:hidden name="productReview.id" value="%{product.id}"/>
                                    <!-- Select box -->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Rate  </label>
                                        <div class="col-sm-10">
                                            <s:select cssClass="form-control"
                                                      name="productReview.rate"
                                                      list="#@java.util.LinkedHashMap@{'1' : '1', '2' : '2', '3' : '3', '4' : '4', '5' : '5'}" />
                                        </div>
                                    </div>
                                    <!-- Review -->
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Comment</label>
                                        <div class="col-sm-10">
                                            <s:textarea name="productReview.comment" cssClass="form-control" />
                                        </div>
                                    </div>
                                    <!-- Buttons -->
                                    <div class="form-group">
                                        <!-- Buttons -->
                                        <div class="col-md-6 col-md-offset-3">
                                            <s:submit cssClass="btn btn-primary" label="Post" />

                                            <button type="reset" class="btn btn-danger">Reset</button>
                                        </div>
                                    </div>
                                </s:form>
                            </s:if>
                        </div> 
                    </div>
                </div>
            </div>                                                                    
        </div>
    </div>
</div>
<%@include file="/template/footer.jsp" %>