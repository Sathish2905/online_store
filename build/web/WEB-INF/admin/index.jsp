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
                <h2 class="pull-left"><i class="icon-home"></i> Dashboard</h2>
                <div class="clearfix"></div>
            </div>
            <!-- Page heading ends -->
            <!-- Matter -->
            <div class="matter">
                <div class="container">
                    <!-- Dashboard Graph starts -->
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Widget -->
                            <div class="widget">
                                <!-- Widget head -->
                                <div class="widget-head">
                                    <div class="pull-left">Latest order</div>
                                    <div class="widget-icons pull-right">
                                        <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                                        <a href="#" class="wclose"><i class="icon-remove"></i></a>
                                    </div>  
                                    <div class="clearfix"></div>
                                </div>              
                                <!-- Widget content -->
                                <div class="widget-content">
                                    <div class="padd">
                                        <!-- Curve chart (Blue color). jQuery Flot plugin used. -->
                                        <table class="table table-striped tcart">
                                            <thead>
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Date</th>
                                                    <th>No. item</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <s:iterator value="listOrder" var="order">
                                                <tr>
                                                    <s:url action="order-detail" var="link">
                                                        <s:param name="id"><s:property value="#order.id" /></s:param>
                                                    </s:url>
                                                    <td><s:a href="%{link}"><s:property value="#order.code" /></s:a></td>
                                                    <td><s:property value="#order.created" /></td>
                                                    <td><s:property value="#order.orderDetails.size" /></td>
                                                    <s:if test="#order.status == 1">
                                                        <td><span class="label label-success">Completed</span></td>
                                                    </s:if>
                                                    <s:else>
                                                        <td><span class="label label-danger">Incomplete</span></td>
                                                    </s:else>
                                                </tr>
                                            </s:iterator>                                                                                                             
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Widget ends -->
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="widget">
                            <div class="widget-head">
                                <div class="pull-left">Status</div>
                                <div class="widget-icons pull-right">
                                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                                </div>  
                                <div class="clearfix"></div>
                            </div>             
                            <div class="widget-content">
                                <div class="padd">
                                    <!-- Visitors, pageview, bounce rate, etc., Sparklines plugin used -->
                                    <ul class="current-status">
                                        <li>
                                            <span id="status1"></span> <span class="bold">Visits : 2000</span>
                                        </li>                                                                                                     
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Dashboard graph ends -->
            </div>
        </div>
        <!-- Matter ends -->
    </div>
    <!-- Mainbar ends -->
    <div class="clearfix"></div>
</div>
<!-- Content ends -->
<%@include file="/template/admin_footer.jsp" %>