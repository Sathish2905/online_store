<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Order history -->

<div class="items">
    <div class="container">
        <div class="row">
            <!-- Sidebar navigation -->
            <div class="col-md-3 col-sm-3 hidden-xs">

                <h5 class="title">Pages</h5>
                <!-- Sidebar navigation -->
                <nav>
                    <ul id="navi">
                        <li><a href="myaccount.html">My Account</a></li>
                        <li><a href="wish-list.html">Wish List</a></li>
                        <li><a href="order-history.html">Order History</a></li>
                        <li><a href="edit-profile.html">Edit Profile</a></li>
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
                            <th>Date</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>25-08-12</td>
                            <td>4423</td>
                            <td>HTC One</td>
                            <td>$530</td>
                            <td>Completed</td>
                        </tr>
                        <tr>
                            <td>15-02-12</td>
                            <td>6643</td>
                            <td>Sony Xperia</td>
                            <td>$330</td>
                            <td>Shipped</td>
                        </tr>
                        <tr>
                            <td>14-08-12</td>
                            <td>1243</td>
                            <td>Nokia Asha</td>
                            <td>$230</td>
                            <td>Processing</td>
                        </tr>  
                        <tr>
                            <td>14-08-12</td>
                            <td>1283</td>
                            <td>Xperia Tipo</td>
                            <td>$330</td>
                            <td>Shipping</td>
                        </tr>
                        <tr>
                            <td>14-08-12</td>
                            <td>8283</td>
                            <td>Apple iPhone</td>
                            <td>$730</td>
                            <td>Processing</td>
                        </tr>
                        <tr>
                            <td>14-08-12</td>
                            <td>3283</td>
                            <td>Windows Mobile</td>
                            <td>$130</td>
                            <td>Shipped</td>
                        </tr>
                        <tr>
                            <td>14-08-12</td>
                            <td>1523</td>
                            <td>Galaxy SIII</td>
                            <td>$430</td>
                            <td>Completed</td>
                        </tr>                                                                                                             
                    </tbody>
                </table>

            </div>                                                                    



        </div>
    </div>
</div>

<%@include file="/template/footer.jsp" %>