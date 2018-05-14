<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="col-md-3 col-sm-3 hidden-xs">

    <h5 class="title">Categories</h5>
    <!-- Sidebar navigation -->
    <nav>
        <ul id="nav">
            <!-- Main menu. Use the class "has_sub" to "li" tag if it has submenu. -->
            <s:url action="store" var="urlTag">
            </s:url>
            <li><s:a href="%{urlTag}">Home</s:a></li>
                <s:iterator value="listCategory" var="parent">
                    <s:if test="%{parent_id == 0}">
                    <li class="has_sub">
                        <a href="#"><s:property value="#parent.name" /></a>
                        <ul>
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