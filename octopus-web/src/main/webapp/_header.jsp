<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/taglib.jsp" %>
<nav class="navbar horizontal-menu navbar-fixed-top"><!-- set fixed position by adding class "navbar-fixed-top" -->

    <div class="navbar-inner">

        <!-- Navbar Brand -->
        <div class="navbar-brand">
            <a href="${contextPath}/customer/center" class="logo">
                <img src="${staticPath}/static/img/fenghuangLogo.png" class="hidden-xs" width="260" height="77"
                     alt=""/>
                <img src="${staticPath}/static/img/small_logo.png" alt="" class="visible-xs" width="40">
            </a>

        </div>
        <ul class="nav nav-userinfo navbar-left">
            <li class="hidden-sm hidden-xs" style="min-height: 76px;">
                <a href="#" data-toggle="sidebar">
                    <i class="fa-bars"></i>
                </a>
            </li>

            <%--<li class="dropdown hover-line" style="min-height: 76px;">
                <a href="#" data-toggle="dropdown">
                    <i class="fa-envelope-o"></i>
                    <span class="badge badge-green">15</span>
                </a>

                <ul class="dropdown-menu messages">
                    <li>

                        <ul class="dropdown-menu-list list-unstyled ps-scrollbar ps-container ps-active-y">

                            <li class="active"><!-- "active" class means message is unread -->
                                <a href="#">
											<span class="line">
												<strong>Luc Chartier</strong>
												<span class="light small">- yesterday</span>
											</span>

                                    <span class="line desc small">
												This ain’t our first item, it is the best of the rest.
											</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
											<span class="line">
												Hayden Cartwright
												<span class="light small">- a week ago</span>
											</span>

                                    <span class="line desc small">
												Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
											</span>
                                </a>
                            </li>

                        </ul>

                    </li>

                    <li class="external">
                        <a href="blank-sidebar.html">
                            <span>All Messages</span>
                            <i class="fa-link-ext"></i>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="dropdown hover-line" style="min-height: 76px;">
                <a href="#" data-toggle="dropdown">
                    <i class="fa-bell-o"></i>
                    <span class="badge badge-purple">7</span>
                </a>

                <ul class="dropdown-menu notifications">
                    <li class="top">
                        <p class="small">
                            <a href="#" class="pull-right">Mark all Read</a>
                            You have <strong>3</strong> new notifications.
                        </p>
                    </li>

                    <li>
                        <ul class="dropdown-menu-list list-unstyled ps-scrollbar ps-container ps-active-y">
                            <li class="active notification-success">
                                <a href="#">
                                    <i class="fa-user"></i>

                                    <span class="line">
												<strong>New user registered</strong>
											</span>

                                    <span class="line small time">
												30 seconds ago
											</span>
                                </a>
                            </li>

                            <li class="active notification-secondary">
                                <a href="#">
                                    <i class="fa-lock"></i>

                                    <span class="line">
												<strong>Privacy settings have been changed</strong>
											</span>

                                    <span class="line small time">
												3 hours ago
											</span>
                                </a>
                            </li>

                            <li class="notification-primary">
                                <a href="#">
                                    <i class="fa-thumbs-up"></i>

                                    <span class="line">
												<strong>Someone special liked this</strong>
											</span>

                                    <span class="line small time">
												2 minutes ago
											</span>
                                </a>
                            </li>

                            <li class="notification-danger">
                                <a href="#">
                                    <i class="fa-calendar"></i>

                                    <span class="line">
												John cancelled the event
											</span>

                                    <span class="line small time">
												9 hours ago
											</span>
                                </a>
                            </li>

                            <li class="notification-info">
                                <a href="#">
                                    <i class="fa-database"></i>

                                    <span class="line">
												The server is status is stable
											</span>

                                    <span class="line small time">
												yesterday at 10:30am
											</span>
                                </a>
                            </li>

                            <li class="notification-warning">
                                <a href="#">
                                    <i class="fa-envelope-o"></i>

                                    <span class="line">
												New comments waiting approval
											</span>

                                    <span class="line small time">
												last week
											</span>
                                </a>
                            </li>
                            <div class="ps-scrollbar-x-rail"
                                 style="display: block; width: 368px; left: 0px; bottom: 3px;">
                                <div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps-scrollbar-y-rail"
                                 style="display: inherit; top: 0px; height: 276px; right: 2px;">
                                <div class="ps-scrollbar-y" style="top: 0px; height: 181px;"></div>
                            </div>
                        </ul>
                    </li>

                    <li class="external">
                        <a href="#">
                            <span>View all notifications</span>
                            <i class="fa-link-ext"></i>
                        </a>
                    </li>
                </ul>
            </li>--%>
        </ul>

        <!-- notifications and other links -->
        <ul class="nav nav-userinfo navbar-right">

            <li class="dropdown user-profile" style="margin-right: 20px">
                <a href="#" data-toggle="dropdown">
                    <span style="margin-right:10px;">
								您好！${sessionScope.name}
							</span>
                    <img src="${staticPath}/static/img/user-4.png" alt="user-image"
                         class="img-circle img-inline userpic-32"
                         width="28"/>
                    <i class="fa-angle-down"></i>
                </a>

                <ul class="dropdown-menu user-profile-menu list-unstyled">
                    <li>
                        <a href="${contextPath}/customer/accountInfo">
                            <i class="fa-home"></i>
                            账户信息
                        </a>
                    </li>
                    <li class="last">
                        <a href="${contextPath}/logout">
                            <i class="fa-lock"></i>
                            注销
                        </a>
                    </li>
                </ul>
            </li>
        </ul>

    </div>

</nav>

