<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Account page -->

<div class="items">
    <div class="container">
        <div class="row">
            <!-- Sidebar navigation-->
            <div class="col-md-3 col-sm-3 hidden-xs">

                <h4 class="title">Pages</h4>
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

            <div class="col-md-9 col-sm-9">
                <!-- Title -->
                <h4 class="title">Confirmation</h4>

                <h5>Thanks for buying from MacKart!!</h5>
                <p>Your Order #id is <strong>43454354</strong>. Say this Order while communicating further.</p>
                <hr />
                <!-- Some links -->
                <div class="horizontal-links">
                    <h5>Take a look around our site</h5>
                    <a href="#">Home</a> <a href="#">About us</a> <a href="#">Support</a> <a href="#">Contact Us</a> <a href="#">Disclaimer</a>
                </div>
                <hr />
                <!-- Search form -->
                <div class="form">
                    <form class="form-inline" role="form">
                        <div class="form-group">
                            <input type="email" class="form-control" id="search" placeholder="">
                        </div>

                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                </div>
            </div>                                                                    



        </div>
    </div>
</div>
<%@include file="/template/footer.jsp" %>