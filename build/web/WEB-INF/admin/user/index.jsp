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
                <h2 class="pull-left"><i class="icon-table"></i> Users</h2>
                <!-- Breadcrumb -->
<!--                <div class="bread-crumb pull-right">
                    <p>
                    <s:a action="insert" namespace="/admin/user" cssClass="btn btn-primary btn-xs">Insert</s:a>
                        <button type="button" class="btn btn-danger btn-xs">Delete</button>
                    </p>
                </div>-->
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
                                                <th>Username</th>
                                                <th>Fullname</th>
                                                <th>Address</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Control</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="listUser" var="user">
                                            <tr>
                                                <td><s:property value="#user.id" /></td>
                                                <td><s:property value="#user.username" /></td>
                                                <td><s:property value="#user.fullname"/></td>
                                                <td><s:property value="#user.address"/></td>
                                                <td><s:property value="#user.phone"/></td>
                                                <td><s:property value="#user.email"/></td>
                                                <td>
                                                    <s:url action="delete" var="delete">
                                                        <s:param name="id"><s:property value="#user.id" /></s:param>
                                                    </s:url>
                                                    <s:url action="edit" var="edit">
                                                        <s:param name="id"><s:property value="#user.id" /></s:param>
                                                    </s:url>
                                                    <s:a href="%{edit}" cssClass="btn btn-xs btn-warning"><i class="icon-pencil"></i></s:a>
                                                    <s:a onclick="return confirm('Are you sure you want to delete this record')" href="%{delete}" cssClass="btn btn-xs btn-danger"><i class="icon-remove"></i></s:a>
                                                    </td>
                                                </tr>
                                        </s:iterator>               
                                    </tbody>
                                </table>
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