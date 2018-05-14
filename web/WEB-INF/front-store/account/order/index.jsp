<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" namespace="/" executeResult="true">
</s:action>
<!-- Edit profile -->
<div class="items">
    <div class="container">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-sm-3 hidden-xs">
                <h5 class="title">Pages</h5>
                <!-- Sidebar navigation -->
                <nav>
                    <ul id="navi">
                        <li><s:a action="edit" namespace="/account">Edit Information</s:a></li>
                        <li><s:a action="password" namespace="/account">Change password</s:a></li>
                        <li><s:a action="order" namespace="/account">Order history</s:a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Main content -->
                <div class="col-md-9 col-sm-9">
                    <!-- title -->
                    <h5 class="title">Order History</h5>
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
    </div>
</div>
<%@include file="/template/footer.jsp" %>