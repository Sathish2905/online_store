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
                    <!-- Title -->
                    <h5 class="title">Edit Information</h5>
                    <div class="form form-small">
                        <!-- Edit profile form (not working)-->
                    <s:form action="update" namespace="/account" cssClass="form-horizontal" theme="simple">
                        <s:hidden name="user.id" />
                        <s:hidden name="user.username" />
                        <s:hidden name="user.role.id" />
                        <s:hidden name="user.fullname" />
                        <s:hidden name="user.address" />
                        <s:hidden name="user.phone" />
                        <s:hidden name="user.email" />
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                                <s:password name="user.password" cssClass="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <div class="col-lg-offset-1 col-lg-9">
                                <s:submit cssClass="btn btn-primary"/>
                                <s:a action="/account/profile" cssClass="btn btn-default">Discard</s:a>
                                </div>
                            </div>
                    </s:form>
                </div>
            </div>                                                                    
        </div>
    </div>
</div>
<%@include file="/template/footer.jsp" %>