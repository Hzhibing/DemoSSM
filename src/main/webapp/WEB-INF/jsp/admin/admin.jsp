<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/5/20
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>起航课堂</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/iconfont.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <!--[if lt IE 9]>
    <script src="https://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
    <script>
        setInterval("cg.innerHTML=new Date().toLocaleString()",1000);
    </script>
</head>
<body>
<div id="admin-top" class="container-fluid">
    <div class="row">
        <div class="navbar navbar-static-top navbar-inverse">
            <div class="navbar-header col-md-8">
                <a class="navbar-brand" href="#" style=""><i class="iconfont icon-lunchuan"></i>启航课堂后台首页</a>
            </div>
            <div class="col-md-8 col-md-offset-8 icon_i text-right">
                <i class="iconfont icon-ren1" ></i> admin
                <i class="iconfont icon-rili" style="margin-left: 20px;"></i> <span id="cg">2016/12/21 上午12:00:00</span>
                <a class="pull-right" style="margin-left: 20px;"><i class="iconfont icon-wulumuqishigongandashujuguanlipingtai-ico-"></i></a>
            </div>
        </div>
    </div>
</div>
<div class="slid_bar">
    <div class="slid_bar_title">
        <p>
            <span class = "daohang">导航模块 /</span>
            <span>navigation part</span>
        </p>
    </div>
    <div class="slid_bar_content navbar-fixed-top">
        <a href="#collapse_ul" data-toggle="collapse"><i class="iconfont icon-iconfontadd"></i>系统设置</a>
        <ul id="collapse_ul" class="collapse collapse_UL">
            <li><a href="#"  data-iframesrc="${pageContext.request.contextPath}/admin/user_manager.html?pageNum=1&pageSize=6"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#" data-iframesrc="${pageContext.request.contextPath}/admin/role_manager.html"><i class="iconfont icon-jianhao"></i>角色管理</a></li>
            <li><a href="#" data-iframesrc="${pageContext.request.contextPath}/admin/resource_manager.html"><i class="iconfont icon-jianhao"></i>资源管理</a></li>
        </ul>
        <a href="#collapse_employee" data-toggle="collapse"><i class="iconfont icon-iconfontadd"></i>人员管理</a>
        <ul id="collapse_employee" class="collapse collapse_UL">
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
        </ul>
        <a href="#collapse_salary" data-toggle="collapse"><i class="iconfont icon-iconfontadd"></i>薪资管理</a>
        <ul id="collapse_salary" class="collapse collapse_UL">
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
        </ul>
        <a href="#collapse_huo" data-toggle="collapse"><i class="iconfont icon-iconfontadd"></i>货物管理</a>
        <ul id="collapse_huo" class="collapse collapse_UL">
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
            <li><a href="#"><i class="iconfont icon-jianhao"></i>用户管理</a></li>
        </ul>
    </div>
</div>
<div id="path_nav">
    <ol class="breadcrumb">
        <li><a href="#">后台首页</a></li>
        <li><a href="#">系統</a></li>
        <li class="active">系統介紹</li>
    </ol>
</div>
<div class="content"></div>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 包含了所有编译插件 -->
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
<iframe frameborder="no" scrolling="auto" width="100%" height="100%" allowtransparency="true" class="navbar-fixed-bottom" id="iframe_content" src="${pageContext.request.contextPath}/html/iframe.html">
</iframe>