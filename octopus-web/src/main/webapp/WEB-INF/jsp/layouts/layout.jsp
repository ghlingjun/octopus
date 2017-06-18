<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@include file="/taglib.jsp" %>
<html lang="en">
<head id="head">
    <meta charset="utf-8">
    <title>凤凰旅游供应链金融</title>
    <link rel="stylesheet" href="${staticPath}/static/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="${staticPath}/static/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${staticPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-core.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-forms.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-components.css">
    <link rel="stylesheet" href="${staticPath}/static/css/xenon-skins.css">
    <link rel="stylesheet" href="${staticPath}/static/css/custom.css">
    <script src="${staticPath}/static/js/jquery-1.11.1.min.js"></script>
    <script src="${staticPath}/static/js/vue/vue.js"></script>
    <script src="${staticPath}/static/js/toastr/toastr.min.js"></script>
    <style>
        .page-container .main-content{
            padding-bottom: 75px;/*新增 为了让footer显示*/
        }
        .navbar.horizontal-menu.navbar-fixed-top + .page-container {
            margin-top: 0;
        }
        /*新加*/
        .page-body{
            padding-top:85px;
        }
        .iconfont{
            cursor: pointer;
        }
        .btn{
            margin-bottom:0;
        }
        .well{
            margin-bottom: 0;
            margin-top:10px;
        }
        .blockquote{
            padding:12px 30px 12px 20px;
            margin-bottom:15px;
        }
        .blockquote.upload{
            padding:12px 30px 20px 20px;
            margin-bottom:15px;
        }
        .blockquote p.title{
            height:31px;
            line-height:31px;
        }
        .blockquote.upload p.title{
            /*margin:0 0 15px 0;*/
            margin:5px 0 0 0;
            height:31px;
            line-height:31px;
        }
        /*.btn.btn-xs.pull-right.upload{
            margin-top:-3px;
        }*/
        .panel.small-panel{
            margin-bottom:15px;
            padding:0 30px 0 30px;
        }
        .panel.small-panel .panel-heading{
            padding:10px 15px;
            font-size:14px;
        }
        .cbp_tmtimeline > li .cbp_tmtime{
            padding-right:115px;
        }
        .modal-content{
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            border: 1px solid #e3e3e3;
        }
        .navbar.horizontal-menu.navbar-fixed-top + .page-container > .sidebar-menu.fixed.collapsed .sidebar-menu-inner{
            top:30px;
        }
    </style>

</head>
<body class="page-body skin-facebook">
<div class="page-loading-overlay" id="loadingDiv">
    <div class="loader-2"></div>
</div>
<%@include file="/_header.jsp" %>
<div class="page-container">
    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

    <div class="sidebar-menu toggle-others fixed">

        <div class="sidebar-menu-inner">
            <ul id="main-menu" class="main-menu">

                <li v-for="m in menus" v-bind:class="{ active: m.isActiviti == 1}">
                    <a v-bind:href="'${contextPath}' + m.href">
                        <i v-bind:class="m.icon" style="width: 15px"></i>
                        <span class="title" v-text="m.resrcName"></span>
                    </a>
                </li>
            </ul>
        </div>

    </div>
    <div class="clearfix"></div>
    <jsp:include page="${mainPage}"></jsp:include>
</div>
<div id="modal">
    <div class="modal fade" id="modal-4" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title" v-text="title"></h4>
                </div>

                <div class="modal-body">
                    <span id="modal_message"></span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">确认</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="application/javascript">
    var layout = {
        url: {
            getMenus: '${contextPath}/rbacUser/getMenuList'
        },
        fn: {
            getId: function () {
                var pathName = window.location.pathname;
                var path = pathName.split("/");
                return path[3];
            }
        }
    }
    var modal = new Vue({
        el: '#modal',
        data: {
            title: "",
            message: ""
        }
    });
    var menu = new Vue({
        el: '#main-menu',
        data: {
            menus: {}
        }
    });

    Common.ajax.post(layout.url.getMenus, {}, function (res) {
        var id = layout.fn.getId();
        for (var m in res) {
            if (res[m].target == id) {
                res[m].isActiviti = '1';
            }
        }
        menu.menus = res;
    });

</script>
</html>
