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
                                <th>Product</th>
                                <th>Price</th>
                                <th>No.</th>
                                <th>Discount</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody> 
                        <s:iterator value="order.orderDetails" var="detail">
                            <tr>
                                <td><s:property value="product.name" /></td>
                                <td>$<s:property value="getText('{0,number,#,##0}',{product.price})"/></td>
                                <td><s:property value="#detail.quantity" /></td>
                                <td><s:property value="#detail.discount" /> %</td>
                                <s:set name="total" value="product.price * #detail.quantity" />
                                <td>$<s:property value="getText('{0,number,#,##0}',{#total - (#total/100*#detail.discount)})" /></td>
                            </tr>
                        </s:iterator>                                                                                                             
                    </tbody>
                </table>
                <hr>
                <s:if test="order.status == 0">
                    <s:url action="delete-order" var="buyTag">
                        <s:param name="id"><s:property value="order.id" /></s:param>
                    </s:url>
                    <s:a href="%{buyTag}" cssClass="btn btn-xs btn-danger">Delete Order</s:a>
                </s:if>
            </div>                                                                    
        </div>
    </div>
</div>
<%@include file="/template/footer.jsp" %>