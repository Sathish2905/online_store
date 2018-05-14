<%--<%@include file="template/header.jsp" %>--%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <div class="col-md-9 col-sm-9">

                <!-- Breadcrumb -->
                <ul class="breadcrumb">
                    <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                    <li><a href="items.html">Smartphone</a> <span class="divider">/</span></li>
                    <li class="active">Apple</li>
                </ul>

                <!-- Title -->
                <h4 class="pull-left"><s:property value="category.name"/></h4>


                <!-- Sorting -->
                <div class="form-group pull-right">                               
                    <select class="form-control">
                        <option>Sort By</option>
                        <option>Name (A-Z)</option>
                        <option>Name (Z-A></option>
                        <option>Price (Low-High)</option>
                        <option>Price (High-Low)</option>
                        <option>Ratings</option>
                    </select>  
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <s:iterator value="listProduct" var="product">
                        <div class="col-md-4 col-sm-6">
                            <div class="item">
                                <div class="item-image">
                                    <s:url action="product" var="urlTag">
                                        <s:param name="id"><s:property value="id" /></s:param>
                                    </s:url>
                                    <s:a href="%{urlTag}"><img src="${productImage[0].url}" alt="<s:property value="name"/>" /></s:a>
                                    </div>
                                    <div class="item-details">
                                        <h5><a href="single-item.html"><s:property value="name"/></a></h5>
                                    <div class="item-price pull-left">$<s:property value="getText('{0,number,#,##0}',{price})"/></div>
                                    <s:url action="buy" var="buyTag">
                                        <s:param name="id"><s:property value="#product.id" /></s:param>
                                    </s:url>
                                    <div class="button pull-right"><s:a href="%{buyTag}">Add to Cart</s:a></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>  
                    </s:iterator>
                    <div class="paging">
                        <c:forEach var="i" begin="1" end="${maxPage}">
                            <s:url action="category" var="urlTag">
                                <s:param name="id">${param.id}</s:param>
                                <s:param name="page">${i}</s:param>
                            </s:url>

                            <c:choose>
                                <c:when test="${param.page == i}"><s:a href="%{urlTag}" cssClass="current">${i}</s:a></c:when>
                                <c:when test="${param.page == null}">
                                    <c:choose>
                                        <c:when test="${i == 1}">
                                            <s:a href="%{urlTag}" cssClass="current">${i}</s:a>
                                        </c:when>
                                        <c:otherwise>
                                            <s:a href="%{urlTag}">${i}</s:a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise><s:a href="%{urlTag}">${i}</s:a></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </div>                                                                    
        </div>
    </div>
</div>

<%@include file="/template/footer.jsp" %>