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
        <title>Store</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
        <!-- Stylesheets -->
        <link href="${pageContext.request.contextPath}/store/style/bootstrap.css" rel="stylesheet">
        <!-- Pretty Photo -->
        <link href="${pageContext.request.contextPath}/store/style/prettyPhoto.css" rel="stylesheet">
        <!-- Sidebar nav -->
        <link href="${pageContext.request.contextPath}/store/style/sidebar-nav.css" rel="stylesheet">
        <!-- Flex slider -->
        <link href="${pageContext.request.contextPath}/store/style/flexslider.css" rel="stylesheet">
        <!-- Font awesome icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/store/style/font-awesome.css">
        <!-- Main stylesheet -->
        <link href="${pageContext.request.contextPath}/store/style/style.css" rel="stylesheet">
        <!-- Stylesheet for Color -->
        <link href="${pageContext.request.contextPath}/store/style/red.css" rel="stylesheet">
        <!-- HTML5 Support for IE -->
        <!--[if lt IE 9]>
        <script src="js/html5shim.js"></script>
        <![endif]-->
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/store/img/favicon/favicon.png">
    </head>
    <body>
        <!-- Header starts -->
        <header>
            <div class="row header">
                <div class="col-md-2">
                    <!-- Logo. Use class "color" to add color to the text. -->
                    <div class="logo">
                        <h1><a href="store/#">Mac<span class="color bold">Kart</span></a></h1>
                        <p class="meta">online shopping is fun!!!</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <s:form action="search" cssClass="form-inline" theme="simple">
                        <div class="form-group">
                            <s:textfield name="searchString" label="" cssClass="form-control" id="search-box"/>
                        </div>
                        <s:submit label="Search" cssClass="btn btn-default btn-small"/>
                    </s:form>
                </div>
                <div class="col-md-4">
                    <!-- Search form -->
                    <div class="hlinks pull-right">
                        <span>
                            <!-- item details with price -->
                            <s:a action="cart" namespace="/"><s:property value="#session.cart.size" /> Item(s) in your <i class="icon-shopping-cart"></i></s:a>
                            </span>
                            <!-- Login and Register link -->
                        <s:if test="#session.user == null">
                            <span class="lr"><s:a action="login" namespace="/">Login</s:a> or <s:a action="register" namespace="/">Register</s:a></span>
                        </s:if>
                        <s:else>
                            <span class="lr"><s:a action="profile" namespace="/account">Welcome <s:property value="#session.user.username" /></s:a></span>
                            <span class="lr"><s:a action="logout" namespace="/">Logout</s:a></span>
                        </s:else>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header ends -->
        <!-- Navigation -->
        <div class="navbar bs-docs-nav" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
                    <ul class="nav navbar-nav">
                        <s:url action="store" var="urlTag">
                        </s:url>
                        <li><s:a href="%{urlTag}"><i class="icon-home"></i></s:a></li>
                            <s:iterator value="listCategory" var="parent">
                                <s:if test="%{parent_id == 0}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><s:property value="#parent.name" /><b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <s:iterator var="child" value="listCategory">
                                            <s:if test="#child.parent_id == #parent.id">
                                                <s:url action="category" var="urlTag">
                                                    <s:param name="id"><s:property value="#child.id" /></s:param>
                                                </s:url>
                                                <li><s:a href="%{urlTag}"><s:property value="#child.name" /></s:a></li>
                                                </s:if>
                                            </s:iterator>
                                    </ul>
                                </li>
                            </s:if>
                        </s:iterator>
                    </ul>
                </nav>
            </div>
        </div>
