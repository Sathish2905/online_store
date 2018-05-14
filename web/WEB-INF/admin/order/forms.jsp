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
                <h2 class="pull-left"><i class="icon-table"></i> Category</h2>
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
                                    <s:form action="save" namespace="/admin/order" cssClass="form-horizontal" theme="simple">
                                        <s:hidden name="order.id" />
                                        <s:hidden name="order.user.id" />
                                        <s:hidden name="order.created" />
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
                                            <label for="inputEmail3" class="col-sm-2 control-label">Code</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="order.code" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Created date</label>
                                            <div class="col-sm-10">
                                                <s:textfield name="order.created" cssClass="form-control" disabled="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Status</label>
                                            <div class="col-sm-10">
                                                <s:select cssClass="form-control"
                                                          name="order.status"
                                                          list="#@java.util.LinkedHashMap@{'1' : 'Completed', '0' : 'Incomplete'}"/>
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