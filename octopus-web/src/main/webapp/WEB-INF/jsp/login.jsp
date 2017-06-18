<%--
  Created by IntelliJ IDEA.
  User: ytvip
  Date: 2017/3/15
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@include file="/taglib.jsp" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>
    <title>凤凰旅贷 - 登录</title>
    <link rel="stylesheet" href="${staticPath}/static/lib/bootstrap/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="${staticPath}/static/lib/bootstrap/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${staticPath}/static/lib/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${staticPath}/static/lib/xenon/css/xenon-core.css">
    <link rel="stylesheet" href="${staticPath}/static/lib/xenon/css/xenon-forms.css">
    <link rel="stylesheet" href="${staticPath}/static/lib/xenon/css/xenon-components.css">
    <link rel="stylesheet" href="${staticPath}/static/lib/xenon/css/xenon-skins.css">
    <link rel="stylesheet" href="${staticPath}/static/css/login.css">

    <script src="${staticPath}/static/lib/jquery-1.11.1.min.js"></script>
    <script src="${staticPath}/static/lib/vue/vue.js"></script>
    <script src="${staticPath}/static/js/common.js"></script>
    <style>
        .login-page {
            color: #0c0c0c;
        }
        #signForm .form-group{
            margin-bottom:10px;
        }
    </style>

</head>
<body>
<div class="page-loading-overlay">
    <div class="loader-2"></div>
</div>
<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><img src="${staticPath}/static/img/fenghuangLogo-02.png" alt="logo"></a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${staticPath}">返回首页</a></li>
                <li><a href="#">帮助中心</a></li>
                <li><a href="#">关于我们</a></li>
                <li><a href="#">联系我们</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

    <div class="row signLogin_content">
        <div class="loanDesc">
            <h3>借款步骤</h3>
            <ul class="list-unstyled">
                <li>
                    <div class="loanStepNum">01</div>
                    <div class="loanStepDesc">
                        <span class="stepTitle">注册借款人</span>
                        <span class="stepDesc">注册凤凰旅贷账户，选择借款人身份，开启您的借款之旅</span>
                    </div>
                </li>
                <li>
                    <div class="loanStepNum">02</div>
                    <div class="loanStepDesc">
                        <span class="stepTitle">获取授权</span>
                        <span class="stepDesc">在获取授权中，填写相关资料，提交授权信息，专业的工作人员审核您的信息</span>
                    </div>
                </li>
                <li>
                    <div class="loanStepNum">03</div>
                    <div class="loanStepDesc">
                        <span class="stepTitle">获取授信</span>
                        <span class="stepDesc">在我的授信中，填写相关资料，提交授信信息，专业的工作人员审核您的信息</span>
                    </div>
                </li>
                <li>
                    <div class="loanStepNum">04</div>
                    <div class="loanStepDesc">
                        <span class="stepTitle">预约借款</span>
                        <span class="stepDesc">在我要贷款中，填写相关资料，提交预约信息</span>
                    </div>
                </li>
                <li>
                    <div class="loanStepNum">05</div>
                    <div class="loanStepDesc">
                        <span class="stepTitle">获得资金</span>
                        <span class="stepDesc">签订合同，获得资金，解燃眉之急</span>
                    </div>
                </li>
                <li class="bg_line">
                </li>
                <li class="bg_line2">

                </li>
            </ul>
        </div>
        <div class="login-content" id="loginContent">
            <h3>
                <span>用户登录</span>
                <span class="pull-right">
                    还没有账号？
                    <a class="color11b0e9" onclick="page.fn.signIn()" href="javascript:void(0)">
                        立即注册
                    </a>
                </span>
            </h3>

            <div class="errors-container">
            </div>

            <form  id="login" class="login-form fade-in-effect validate">

                <div class="form-group">
                    <i class="iconfont">&#xe655;</i>
                    <input type="text"  class="form-control" name="username" id="username"
                           data-validate="required"
                           data-message-required="请输入正确的邮箱账号"
                           autocomplete="off" value="guest" placeholder="请输入邮箱账号"/>
                </div>

                <div class="form-group">
                    <i class="iconfont">&#xef14;</i>
                    <input type="password" class="form-control" id="password" name="password" onpaste="return false"
                           data-validate="required"
                           data-message-required="请输入账号密码"
                           oncopy="return false" oncut="return false" id="password"
                           autocomplete="off" value="000000" placeholder="请输入您的密码"/>
                </div>

                <div class="form-group" style="margin-top: 50px;">
                    <button  type="button" id="loginBtn" onclick="loginForm()" class="btn btn-info  btn-block text-left">
                        登录
                    </button>
                    <p>
                        <span>如登录出现异常,清理浏览器缓存后再试。</span>
                        <a href="#" class="pull-right color11b0e9">忘记密码</a>
                    </p>
                </div>
            </form>
        </div>
        <div class="sign-content hide" id="signIn">
            <!-- Errors container -->
            <h3>
                <span>用户注册</span>
                <span class="pull-right">已有账号？<a class="color11b0e9" onclick="page.fn.changeToLogIn()" href="javascript:void(0)">直接登录</a></span>
            </h3>

            <div class="errors-container">
            </div>
            <form id="signForm" role="form"  class="login-form fade-in-effect validate">
                <div class="type_sel">
                    <label>用户类型：&nbsp;&nbsp;</label>
                    <input type="radio" name="radio-2" id="radio_company" checked="checked">
                    <label for="radio_company">企业用户&nbsp;&nbsp;</label>
                    <input type="radio" name="radio-2" id="radio_person" disabled>
                    <label for="radio_person">个人用户</label>
                </div>
                <div class="form-group">
                    <i class="iconfont">&#xe655;</i>
                    <input type="text" class="form-control" id="loginName" name="loginName"
                           data-validate="required"
                           data-message-required="请输入邮箱账号"
                           autocomplete="off" <%--v-model="info.loginName"--%>
                           placeholder="请输入邮箱账号">
                </div>
                <div class="form-group">
                    <i class="iconfont">&#xe655;</i>
                    <input type="text" class="form-control" data-validate="required" id="customerName" name="customerName"
                           data-message-required="请输入昵称" autocomplete="off" <%--v-model="info.userName"--%>
                           placeholder="请输入昵称">
                </div>
                <div class="form-group">
                    <i class="iconfont">&#xef14;</i>
                    <input type="password" class="form-control" data-validate="required" id="signPwd" name="signPwd"
                           data-message-required="请输入密码"   <%--v-model="info.password"--%> autocomplete="off"
                           placeholder="请输入密码">

                </div>
                <div class="form-group">
                    <i class="iconfont">&#xef14;</i>
                    <input type="password" class="form-control" data-validate="required" id="dobChkPwd" name="dobChkPwd"
                           data-message-required="请再次输入密码"   <%--v-model="info.conformPwd"--%> autocomplete="off"
                           placeholder="请再次输入密码">

                </div>
                <div class="form-group">
                    <button id="signInBtn"  onclick="signForm()" type="button" class="btn btn-info  btn-block text-left">
                        注册
                    </button>

                </div>


            </form>
        </div>
    </div>


<div class="footer">
    <div class="footer-ct container">
        <div class="ft-l col-sm-7">
            <span> 友情链接</span>
            <img src="${staticPath}/static/img/yqlj-logo.png" alt="">
        </div>
        <div class="ft-r col-sm-5">
            <span>技术支持</span>
            <h3>0551-6539-3358</h3>
            <p>e-mail : info@primecocn.com</p>
            <p>地址：合肥市高新区文曲路与云飞路交口创业园二期F1楼1301-1303室</p>
        </div>
    </div>
</div>


</body>
<!-- Bottom Scripts -->
<script src="${staticPath}/static/lib/bootstrap/bootstrap.min.js"></script>
<script src="${staticPath}/static/lib/TweenMax.min.js"></script>
<script src="${staticPath}/static/lib/resizeable.js"></script>
<script src="${staticPath}/static/lib/joinable.js"></script>
<script src="${staticPath}/static/lib/xenon/js/xenon-api.js"></script>
<script src="${staticPath}/static/lib/xenon/js/xenon-toggles.js"></script>

<script src="${staticPath}/static/lib/toastr/toastr.min.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="${staticPath}/static/lib/xenon/js/xenon-custom.js"></script>

<script src="${staticPath}/static/lib/jquery-validate/jquery.validate.min.js"></script>
<script src="${staticPath}/static/js/common.js"></script>
<script src="${staticPath}/static/js/form-validate.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var flag = ${flag};
        page.fn.init();
        if(!flag){
            page.fn.signIn();
        };
        Common.fn.validate();
        document.onkeydown = function(e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode == 13) {
                if($('#loginContent').hasClass('hide')){
                    signForm();

                }else{
                    loginForm();
                }
            }
        }
    });
    /*登录form表单*/
    function loginForm(){
        if($('#login').valid()){
            show_loading_bar(70);
            var opts = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-top-full-width",
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            $.ajax({
                url: page.url.login,
                method: 'POST',
                dataType: 'json',
                data: {
                    username: $("#username").val().trim(),
                    password: $("#password").val().trim()
                },
                success: function (res) {
                    console.log(res);

                    show_loading_bar({
                        delay: .5,
                        pct: 100,
                        finish: function () {
                            if (res.status < 1) {
                                toastr.error(res.desc, "登录失败", opts);
                            } else {
                                window.location.href = res.data;
                            }
                        }
                    });
                }
            });
        }
    }
    function signForm(){
        console.log($('#signForm').valid());
        if($('#signForm').valid()){
            var SignUserInfo={
                loginName: $("#loginName").val().trim(),
                userName:$("#customerName").val().trim(),
                password: $("#signPwd").val().trim(),
                customerType: 2
            };
            if($('#signPwd').val()==$('#dobChkPwd').val()){
                console.log(SignUserInfo);
                Common.ajax.post(page.url.sign,SignUserInfo,function(){
                    Common.msg.success("注册成功请登录系统");
                    page.fn.changeToLogIn();
                    $('#username').val(SignUserInfo.loginName);
                    $('#password').val(SignUserInfo.password);
                })
            }else{
                Common.msg.warning("两次密码不一致");
                return;
            }
        }
    }
    var page = {
        url: {
            login: rootPath + "/login",
            sign: rootPath + '/signIn'
        },
        fn: {
            changeToLogIn:function(){
                $('#signIn').addClass('hide');
                $('#loginContent').removeClass('hide');
            }
        }
    }

    page.fn.init = function () {
        setTimeout(function () {
            $(".fade-in-effect").addClass('in');
        }, 1);
    };

    page.fn.signIn = function () {
        $('#signIn').removeClass('hide');
        $('#loginContent').addClass('hide');
    }

    page.fn.signPost = function () {
        if (!page.user.info.userName) {
            Common.msg.warning("请输入您的邮箱账号");
            return;
        }
        if (!page.user.info.password) {
            Common.msg.warning("请输入密码");
            return;
        }
        if(page.user.info.password !=page.user.info.conformPwd){
            Common.msg.warning("两次密码不一致");
            return;
        }
        Common.ajax.post(page.url.sign,page.user.info,function(){
            Common.msg.success("注册成功请登录系统");
            page.fn.changeToLogIn();
        })

    }
</script>


</html>