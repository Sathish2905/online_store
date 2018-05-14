<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Page content starts -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-6">

                <!-- Some content -->
                <h3 class="title">Register Today <span class="color">!!!</span></h3>
                <div class="lists">
                    <ul>
                        <li>Etiam adipiscing posuere justo, nec iaculis justo dictum non</li>
                        <li>Cras tincidunt mi non arcu hendrerit eleifend</li>
                        <li>Aenean ullamcorper justo tincidunt justo aliquet et lobortis diam faucibus</li>
                        <li>Maecenas hendrerit neque id ante dictum mattis</li>
                        <li>Vivamus non neque lacus, et cursus tortor</li>
                    </ul>
                </div>
            </div>


            <!-- Login form -->
            <div class="col-md-6">
                <div class="formy well">
                    <h4 class="title">Login to Your Account</h4>
                    <div class="form">

                        <!-- Login  form (not working)-->
                        <s:form action="login" namespace="/admin" cssClass="form-horizontal" theme="simple">
                            <!-- Username -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="username2">Username</label>
                                <div class="col-md-6">
                                    <s:textfield name="userBean.username" id="inputEmail" cssClass="form-control"/>
                                </div>
                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="password2">Password</label>
                                <div class="controls col-md-6">
                                    <s:password name="userBean.password" id="inputPassword" cssClass="form-control"/>
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="form-group">
                                <!-- Buttons -->
                                <div class="col-md-6 col-md-offset-3">
                                    <s:submit cssClass="btn btn-danger" value="Login"/>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </div>
                            </div>
                            </s:form>
                            <hr />
                            <h5>Lost password</h5>
                            You have lost your password? <s:a action="register" namespace="/">Retrive password</s:a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Page content ends -->
    <%@include file="/template/footer.jsp" %>