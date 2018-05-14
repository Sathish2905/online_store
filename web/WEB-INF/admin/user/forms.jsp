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
                <h2 class="pull-left"><i class="icon-table"></i> User</h2>
                <div class="clearfix"></div>
            </div>
            <!-- Page heading ends -->
            <!-- Matter -->
            <div class="matter">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="widget wgreen">
                                <div class="widget-content">
                                    <div class="padd">
                                        <!-- Form starts.  -->
                                    <s:form action="save" namespace="/admin/user" cssClass="form-horizontal" theme="simple">
                                        <s:hidden name="user.id" />
                                        <s:hidden name="user.password" />
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="user.username" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Fullname</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="user.fullname" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Address</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="user.address" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Phone</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="user.phone" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="user.email" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Role</label>
                                            <div class="col-sm-10">
                                                <s:select headerKey="0" headerValue="--None--"
                                                          list="listUserRole" 
                                                          name="user.role.id" cssClass="form-control" listKey="id" listValue="name"/>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="form-group">
                                            <div class="col-lg-offset-1 col-lg-9">
                                                <s:submit cssClass="btn btn-primary"/>
                                                <s:a action="index" cssClass="btn btn-default">Discard</s:a>
                                                </div>
                                            </div>
                                    </s:form>
                                </div>
                            </div>
                            <div class="widget-foot">
                                <!-- Footer goes here -->
                            </div>
                        </div>  

                    </div>

                </div>

            </div>
        </div>

        <!-- Matter ends -->

    </div>

    <!-- Mainbar ends -->	    	
    <div class="clearfix"></div>

</div>
<!-- Content ends -->
<%@include file="/template/admin_footer.jsp" %>