<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/taglib.jsp" %>
<head>
<link rel="stylesheet" href="${staticPath}/static/lib/bootstrap/fonts/linecons/css/linecons.css">
<link rel="stylesheet" href="${staticPath}/static/lib/bootstrap/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${staticPath}/static/lib/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${staticPath}/static/css/index.css">
</head>

<body>
    <div class="top">
        <div class="top-ct">
            <div class="top-01">
                <i class="fa fa-volume-up"></i>
                <span>您好！欢迎来到华誉佳信旅游供应链金融平台！</span>
            </div>
            <ul>
                <li><a href="#" target="_blank">帮助中心</a></li>
                <li><a href="#" target="_blank">关于我们</a></li>
                <li><a href="#" target="_blank">联系我们</a></li>
            </ul>
        </div>
    </div>
    <div class="header">
        <div class="header-ct">
            <div class="logo"><a href="#"><img src="${staticPath}/static/img/fenghuangLogo-02.png" alt="logo"></a></div>
            <div class="but">
                <ul>
                    <li onclick="login(1)"><a href="#" >登录</a></li>
                    <li class="li" onclick="login(0)"><a href="#">注册新用户</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="${staticPath}/static/img/banner.jpg" alt="banner">
                <div class="carousel-caption banner-f">
                    <img src="${staticPath}/static/img/banner-f.png" alt="">
                </div>
            </div>
            <div class="item">
                <img src="${staticPath}/static/img/banner.jpg" alt="banner">
                <div class="carousel-caption banner-f">
                    <img src="${staticPath}/static/img/banner-f.png" alt="">
                </div>
            </div>
            <div class="item">
                <img src="${staticPath}/static/img/banner.jpg" alt="banner">
                <div class="carousel-caption banner-f">
                    <img src="${staticPath}/static/img/banner-f.png" alt="">
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="main01">
        <div class="main01-ct">
            <div class="title">
            <h3>选择我们</h3>
            <span>Choose us</span>
            </div>
            <div class="m1-l m1">
                <em><img src="${staticPath}/static/img/zhuanye-icon.png" alt=""> </em>
                <h3>专业</h3>
                <hr>
                <p>专为旅游供应链金融提供担保及<br/>贷款服务，多重风控体系<br/>安全保障。</p>
                <!-- <a href="#" onclick="login()">详情>></a> -->
            </div>
            <div class="m1-c m1">
                <em><img src="${staticPath}/static/img/fkk-icon.png" alt=""> </em>
                <h3>放款快</h3>
                <hr>
                <p>最高可贷1000万，最快1天审批通<br/>过，及时满足客户大额<br/>资金需求。</p>
                <!--<a href="#" onclick="login()">详情>></a>-->
            </div>
            <div class="m1-r m1">
                <em><img src="${staticPath}/static/img/lcjd-icon.png" alt=""> </em>
                <h3>流程简单</h3>
                <hr>
                <p>在线申请，及时审批，流程清晰<br/>简单灵活，贷款便捷<br/>放款迅速。</p>
                <!-- <a href="#" onclick="login()">详情>></a> -->
            </div>
        </div>
    </div>
    <div class="main02">
       <div class="main02-ct">
           <div class="title">
               <h3>贷款流程</h3>
               <span>Loan process</span>
           </div>
           <div class="dklc">
               <img src="${staticPath}/static/img/dklc.png" alt="">
           </div>
       </div>
    </div>
    <div class="main03">
        <div class="main03-ct">
            <img src="${staticPath}/static/img/dklc-02.png" alt="">
        </div>
    </div>
    <div class="main04">
        <div class="main04-ct">
            <div class="title">
                <h3>简介</h3>
                <span>summary</span>
            </div>
            <div class="m4-l m4">
                <img src="${staticPath}/static/img/fh-jianjie.jpg" alt="">
                <h3>北京凤凰假期国际旅行社有限公司</h3>
                <hr>
                <p>5A级特许经营国际旅行社，全国百强企业，中国旅行社协会会员、北京旅行社协会会员、PATA（亚太旅游协会）会员、出境旅游优质服务供应商计划保荐机构</p>
            </div>
            <div class="m4-c m4">
                <img src="${staticPath}/static/img/hx-jianjie.jpg" alt="">
                <h3>安徽汇信金融投资集团有限责任公司</h3>
                <hr>
                <p>古井集团旗下全资子公司，经亳州市国资委批准成立的亳州市首家金融控股平台，旗下有安徽恒信典当有限公司、安徽众信租赁有限公司、安徽小额贷款有限责任公司、安徽瑞信典当有限公司、安徽力信电子商务有限公司五家类金融公司</p>
            </div>
            <div class="m4-r m4">
                <img src="${staticPath}/static/img/hyjx-jianjie.jpg" alt="">
                <h3>安徽华誉佳信金融服务有限公司</h3>
                <hr>
                <p>业内领先的IT技术服务供应商，国内知名互联网企业，安徽省十二五规划中重点发展金融服务产业的领军企业，为旅游供应链业务需求度身定做全方位和个性化的供应链金融贷款业务解决方案，提供旅游供应链金融贷款平台服务和互联网大数据征信服务</p>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-ct">
            <div class="ft-l">
              <span> 友情链接</span>
                <img src="${staticPath}/static/img/yqlj-logo.png" alt="">
            </div>
            <div class="ft-r">
              <span>技术支持</span>
                <h3>0551-6539-3358</h3>
                <p>e-mail : info@primecocn.com</p>
                <p>地址：合肥市高新区文曲路与云飞路交口创业园二期F1楼1301-1303室</p>
            </div>
        </div>
    </div>

    <script src="${staticPath}/static/lib/jquery-1.11.1.min.js"></script>
    <script src="${staticPath}/static/lib/bootstrap/bootstrap.min.js"></script>
    <script>
        $('.carousel').carousel({
            interval: 6000
        })
        function login(flag){
            window.location.href = "${contextPath}/login/"+flag
        }
    </script>
</body>