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

            <!-- Main bar -->
            <div class="col-md-9 col-sm-9">

                <h5 class="title">My Account</h5>

                <!-- Your details -->
                <div class="address">
                    <address>
                        <!-- Your name -->
                        <strong><s:property value="#session.user.fullname" /></strong><br>
                        <!-- Address -->
                        <s:property value="#session.user.address" /><br>

                        <!-- Phone number -->
                        <abbr title="Phone">Phone:</abbr> <s:property value="#session.user.phone" /><br />
                        <a href="mailto:<s:property value="#session.user.email" />"><s:property value="#session.user.email" /></a>
                    </address>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/template/footer.jsp" %>