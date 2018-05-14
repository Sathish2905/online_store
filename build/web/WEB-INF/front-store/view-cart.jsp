<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Cart starts -->
<div class="cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Title with number of items in shopping kart -->
                <s:if test="hasActionErrors()">
                    <div class="alert alert-warning fade in" role="alert">
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <s:actionerror/>
                    </div>
                </s:if>
                <s:if test="hasActionMessages()">
                    <div class="alert alert-warning fade in" role="alert">
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <s:actionmessage />
                    </div>
                </s:if>
                <h3 class="title"><i class="icon-shopping-cart"></i> Items in your cart [<span class="color"><s:property value="#session.cart.size" /></span>]</h3>
                <br />
                <!-- Table -->
                <table class="table table-striped tcart">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#session.cart" var="item">
                            <tr>
                                <!-- Index -->
                                <td>1</td>
                                <!-- Product  name -->
                                <td><a href="single-item.html"><s:property value="#item.product.name"/></a></td>
                                <!-- Product image -->
                                <s:url action="product" var="urlTag">
                                    <s:param name="id"><s:property value="#item.product.id" /></s:param>
                                </s:url>
                                <td><s:a href="%{urlTag}"><img src="<s:property value="#item.product.productImage[0].url" />" alt="<s:property value="name"/>" /></s:a></td>
                                    <!-- Quantity with refresh and remove button -->
                                    <td class="item-input">
                                        <div class="input-group">
                                            <input class="form-control" type="text" value="<s:property value="#item.quantity"/>">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"><i class="icon-refresh"></i></button>
                                            <button class="btn btn-danger" type="button"><i class="icon-remove"></i></button>     
                                        </span>
                                    </div>
                                </td>
                                <!-- Unit price -->
                                <td><s:property value="getText('{0,number,#,##0}',{#item.price})"/></td>
                                <!-- Total cost -->
                                <td><s:property value="getText('{0,number,#,##0}',{#item.price * #item.quantity})"/></td>
                            </tr>
                        </s:iterator>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Total</th>
                            <th><s:property value="getText('{0,number,#,##0}',{total})"/></th>
                        </tr>
                    </tbody>
                </table>
                <!-- Button s-->
                <div class="row">
                    <div class="col-md-4 col-md-offset-8">
                        <div class="pull-right">
                            <s:a action="checkout.action" namespace="/" cssClass="btn btn-primary">Checkout</s:a>
                            <s:a action="clear_cart.action" namespace="/" cssClass="btn btn-danger">Clear</s:a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart ends -->
<%@include file="/template/footer.jsp" %>