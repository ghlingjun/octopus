<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isErrorPage="true" %>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>500</title>


    <link rel="stylesheet" href="${staticPath}/static/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="${staticPath}/static/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${staticPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-core.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-forms.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-components.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-skins.css">
    <link rel="stylesheet" href="${staticPath}/static/css/custom.css">
    <script src="${staticPath}/static/js/jquery-1.11.1.min.js"></script>

</head>
<body class="page-body page-error-env">

<div class="page-error centered">
    <div class="error-symbol">
        <i class="fa-warning"></i>
    </div>
    <h2>
        Error 500
    </h2>
    <p>Sorry！系统发生了一个异常，我们对耽误您的工作感到十分抱歉！</p>
    <p>错误信息：<span style="color: red;font-weight: bold">${errorMsg}</span></p>
    <p>您可以点击<a style="margin:0px 5px" href="${contextPath}/customer/center">首页</a>返回系统</p>

</div>

</body>
</html>