<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<s:action name="header" executeResult="true"></s:action>
    <!-- Main content starts -->
    <br />
    <div class="content">
        <!-- Sidebar -->
    <s:action name="sidebar" executeResult="true"></s:action>
        <!-- Sidebar ends -->
        <!-- Main bar -->
        <div class="mainbar">
            <!-- Page heading -->
            <div class="page-head">
                <h2 class="pull-left"><i class="icon-table"></i> Product</h2>
                <!-- Breadcrumb -->
                <div class="bread-crumb pull-right">
                    <p>
                    <s:a action="insert" namespace="/admin/product" cssClass="btn btn-primary btn-xs">Insert</s:a>
                        <button type="button" class="btn btn-danger btn-xs">Delete</button>
                    </p>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- Page heading ends -->
            <!-- Matter -->
            <div class="matter">
                <div class="container">
                    <!-- Table -->
                    <div class="row">
                        <div class="col-md-12"> 
                            <div class="widget">
                                <div class="widget-content">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Control</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <s:if test="fieldErrors.size > 0">
                                        <div class="alert alert-warning fade in" role="alert">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <s:fielderror/>
                                        </div>
                                    </s:if>
                                    <s:iterator value="listProduct" var="product">
                                        <tr>
                                            <td><s:property value="#product.id" /></td>
                                            <td><s:property value="#product.name" /></td>
                                            <td><s:property value="getText('{0,number,#,##0}',{#product.price})"/></td>
                                            <s:if test="#product.status == 1">
                                                <td><span class="label label-success">Active</span></td>
                                            </s:if>
                                            <s:else>
                                                <td><span class="label label-danger">Inactive</span></td>
                                            </s:else>
                                            <td>
                                                <s:url action="delete" var="delete">
                                                    <s:param name="id"><s:property value="#product.id" /></s:param>
                                                </s:url>
                                                <s:url action="edit" var="edit">
                                                    <s:param name="id"><s:property value="#product.id" /></s:param>
                                                </s:url>
                                                <s:a href="%{edit}" cssClass="btn btn-xs btn-warning"><i class="icon-pencil"></i></s:a>
                                                <s:a onclick="return confirm('Are you sure you want to delete this record')" href="%{delete}" cssClass="btn btn-xs btn-danger"><i class="icon-remove"></i></s:a>
                                                </td>
                                            </tr>
                                    </s:iterator>               
                                    </tbody>
                                </table>
                                <div class="widget-foot">
                                    <ul class="pagination pull-right">
                                        <c:forEach var="i" begin="1" end="${maxPage}">
                                            <s:url action="index" namespace="/admin/product" var="urlTag">
                                                <s:param name="id">${param.id}</s:param>
                                                <s:param name="page">${i}</s:param>
                                            </s:url>

                                            <c:choose>
                                                <c:when test="${param.page == i}"><li class="active"><s:a href="%{urlTag}">${i}</s:a></li></c:when>
                                                    <c:when test="${param.page == null}">
                                                        <c:choose>
                                                            <c:when test="${i == 1}">
                                                            <li class="active"><s:a href="%{urlTag}">${i}</s:a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <li><s:a href="%{urlTag}">${i}</s:a></li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise><li><s:a href="%{urlTag}">${i}</s:a></li></c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                    </ul>
                                    <div class="clearfix"></div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Matter ends -->
    </div>
    <!-- Mainbar ends -->	    	
    <div class="clearfix"></div>
</div>
<!-- Content ends -->
<%@include file="/template/admin_footer.jsp" %>