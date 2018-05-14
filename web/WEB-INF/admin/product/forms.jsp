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
                <h2 class="pull-left"><i class="icon-table"></i> Product</h2>
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
                                    <s:form action="save" namespace="/admin/product" cssClass="form-horizontal" theme="simple" method="post" enctype="multipart/form-data">
                                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                                            <li class="active"><a href="#general" role="tab" data-toggle="tab">General</a></li>
                                            <li class=""><a href="#image" role="tab" data-toggle="tab">Image</a></li>
                                        </ul>
                                        <br />
                                        <div id="myTabContent" class="tab-content">
                                            <div class="tab-pane fade active in" id="general">
                                                <s:hidden name="product.id" />
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
                                                    <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                                    <div class="col-sm-10">
                                                        <s:textfield name="product.name" cssClass="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Brand</label>
                                                    <div class="col-sm-10">
                                                        <s:textfield name="product.brand" cssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Price</label>
                                                    <div class="col-sm-10">
                                                        <s:textfield value="%{getText('{0,number,#,##0}',{product.price})}" name="product.price" cssClass="form-control"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Stock</label>
                                                    <div class="col-sm-10">
                                                        <s:textfield name="product.stock" cssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Discount</label>
                                                    <div class="col-sm-10">
                                                        <s:textfield value="%{getText('{0,number,#,##0}',{product.discount})}" name="product.discount" cssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Description</label>
                                                    <div class="col-sm-10">
                                                        <s:textarea name="product.description" cssClass="form-control" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Category</label>
                                                    <div class="col-sm-10">
                                                        <s:select headerKey="0" headerValue="--None--"
                                                                  list="listCategory" 
                                                                  name="product.category.id" cssClass="form-control" listKey="id" listValue="name"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Status</label>
                                                    <div class="col-sm-10">
                                                        <s:select cssClass="form-control"
                                                                  name="product.status"
                                                                  list="#@java.util.LinkedHashMap@{'1' : 'Active', '2' : 'Inactive'}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="image">
                                                <div class="col-md-12">
                                                    <hr>
                                                    <table class="table table-striped table-hover table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Image</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>1</td>
                                                                <td><div id="imagePreview"></div><s:file name="userImage" label="User Image"/></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                </div>
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