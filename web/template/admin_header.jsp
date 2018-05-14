<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <!-- Title and other stuffs -->
        <title>Dashboard - MacAdmin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <!-- Stylesheets -->
        <link href="${pageContext.request.contextPath}/admin/style/bootstrap.css" rel="stylesheet">
        <!-- Font awesome icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/font-awesome.css"> 
        <!-- jQuery UI -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/jquery-ui.css"> 
        <!-- Calendar -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/fullcalendar.css">
        <!-- prettyPhoto -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/prettyPhoto.css">  
        <!-- Star rating -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/rateit.css">
        <!-- Date picker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/bootstrap-datetimepicker.min.css">
        <!-- CLEditor -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/jquery.cleditor.css"> 
        <!-- Uniform -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/uniform.default.css"> 
        <!-- Bootstrap toggle -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/bootstrap-switch.css">
        <!-- Main stylesheet -->
        <link href="${pageContext.request.contextPath}/admin/style/style.css" rel="stylesheet">
        <!-- Widgets stylesheet -->
        <link href="${pageContext.request.contextPath}/admin/style/widgets.css" rel="stylesheet">   
        <!-- HTML5 Support for IE -->
        <!--[if lt IE 9]>
        <script src="js/html5shim.js"></script>
        <![endif]-->
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/img/favicon/favicon.png">
    </head>
    <body>
        <div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
            <div class="container">
                <!-- Menu button for smallar screens -->
                <div class="navbar-header">
                    <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                        <span>Menu</span>
                    </button>
                    <!-- Site name for smallar screens -->
                    <a href="index.html" class="navbar-brand hidden-lg">MacBeth</a>
                </div>
                <!-- Navigation starts -->
                <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         
                    <ul class="nav navbar-nav">  
                        <!-- Upload to server link. Class "dropdown-big" creates big dropdown -->
                        <li class="dropdown dropdown-big">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-success"><i class="icon-cloud-upload"></i></span> Upload to Cloud</a>
                            <!-- Dropdown -->
                            <ul class="dropdown-menu">
                                <li>
                                    <!-- Progress bar -->
                                    <p>Photo Upload in Progress</p>
                                    <!-- Bootstrap progress bar -->
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete</span>
                                        </div>
                                    </div>
                                    <hr />
                                    <!-- Progress bar -->
                                    <p>Video Upload in Progress</p>
                                    <!-- Bootstrap progress bar -->
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete</span>
                                        </div>
                                    </div> 
                                    <hr />             
                                    <!-- Dropdown menu footer -->
                                    <div class="drop-foot">
                                        <a href="#">View All</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Sync to server link -->
                        <li class="dropdown dropdown-big">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger"><i class="icon-refresh"></i></span> Sync with Server</a>
                            <!-- Dropdown -->
                            <ul class="dropdown-menu">
                                <li>
                                    <!-- Using "icon-spin" class to rotate icon. -->
                                    <p><span class="label label-info"><i class="icon-cloud"></i></span> Syncing Members Lists to Server</p>
                                    <hr />
                                    <p><span class="label label-warning"><i class="icon-cloud"></i></span> Syncing Bookmarks Lists to Cloud</p>
                                    <hr />
                                    <!-- Dropdown menu footer -->
                                    <div class="drop-foot">
                                        <a href="#">View All</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!-- Search form -->
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                    </form>
                    <!-- Links -->
                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown pull-right">            
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="icon-user"></i> Admin <b class="caret"></b>              
                            </a>
                            <!-- Dropdown menu -->
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="icon-user"></i> Profile</a></li>
                                <li><a href="#"><i class="icon-cogs"></i> Settings</a></li>
                                <li><s:a action="logout" namespace="/" cssClass="icon-off">Logout</s:a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>