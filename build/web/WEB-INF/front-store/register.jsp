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
                <h4 >Morbi tincidunt posuere turpis eu laoreet</h4>
                <p>Nullam in est urna. In vitae adipiscing enim. 
                    Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. 
                    In vitae adipiscing enim. Curabitur rhoncus condimentum lorem,
                    non convallis dolor faucibus eget. In ut nulla est. </p>
            </div>

            <div class="col-md-6">
                <div class="formy well">
                    <h4 class="title">Register for New Account</h4>
                    <div class="form">
                        <!-- Register form (not working)-->
                        <s:form action="addUser" namespace="/" cssClass="form-horizontal" theme="simple">
                            <!-- Name -->
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <s:if test="fieldErrors.size > 0">
                                        <div class="alert alert-warning fade in" role="alert">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <s:fielderror/>
                                        </div>
                                    </s:if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3" for="name1">Name</label>
                                <div class="col-md-6">
                                    <s:textfield cssClass="form-control" name="userBean.fullname" />
                                </div>
                            </div>   
                            <!-- Email -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="email1">Email</label>
                                <div class="col-md-6">
                                    <s:textfield cssClass="form-control" name="userBean.email" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3" for="email1">Address</label>
                                <div class="col-md-6">
                                    <s:textfield cssClass="form-control" name="userBean.address" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3" for="email1">Phone number</label>
                                <div class="col-md-6">
                                    <s:textfield cssClass="form-control" name="userBean.phone" />
                                </div>
                            </div>
                            <div class="form-group">
                                <hr />
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3" for="email1">Login name</label>
                                <div class="col-md-6">
                                    <s:textfield cssClass="form-control" name="userBean.username" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3" for="email1">Password</label>
                                <div class="col-md-6">
                                    <s:password cssClass="form-control" name="userBean.password" />
                                </div>
                            </div>
                            <!-- Buttons -->
                            <div class="form-actions">
                                <!-- Buttons -->
                                <div class="col-md-9 col-md-offset-3">
                                    <s:submit cssClass="btn btn-danger" value="Register"/>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </div>
                            </div>
                        </s:form>
                        <div class="clearfix"></div>
                        <hr />
                        <p>Already have an Account? <a href="login.html">Login</a></p>
                    </div> 
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Page content ends -->
<%@include file="/template/footer.jsp" %>