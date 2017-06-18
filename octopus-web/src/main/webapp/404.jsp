<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>404</title>


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
        Error 404
        <small>I Guess You Just Access To A Fake Page!</small>
    </h2>
    <p>我们并没有在系统找到您要访问的页面，我猜您可能点了一个假的链接地址</p>
    <p>您可以点击<a style="margin:0px 5px" href="${contextPath}/customer/center">首页</a>返回系统</p>

</div>

</body>
</html>