<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>启航课堂</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <style>
        body {
            padding-top: 70px;
            padding-left: 50px;
            padding-right: 50px;
        }
    </style>
    <!--[if lt IE 9]>
    <script src="https://apps.bdimg.com/${pageContext.request.contextPath}${pageContext.request.contextPath}/libs/html5shiv/3.7/html5shiv.min.${pageContext.request.contextPath}/js"></script>
    <![endif]-->
</head>
<body>
<nav id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div style="margin: 0 20px 0 20px">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" style=""><i class="iconfont icon-lunchuan "></i>启航课堂</a>
            </div>
            <div class="collapse navbar-collapse  bs-js-navbar-scrollspy" id="collapsebar">
                <ul class="nav navbar-nav">
                    <li ><a href="#home" class="home">首页</a></li>
                    <li><a href="#shop"> 全部课程</a></li>
                    <li><a href="#support"> 问题讨论</a></li>
                    <li ><a href="">学习路线</a></li>
                    <li><a href="">资料下载</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >dropdown<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation" class="dropdown-header" >下拉菜单标题</li>
                            <li role="presentation"   tabindex="-1">
                                <a role="menuitem" tabindex="-1" href="#java">Java</a>
                            </li>
                            <li role="presentation"  >
                                <a role="menuitem" tabindex="-1" href="#data">数据挖掘</a>
                            </li>
                            <li role="presentation"  >
                                <a role="menuitem" tabindex="-1" href="#information">
                                    数据通信/网络
                                </a>
                            </li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation" class="dropdown-header">下拉菜单标题</li>
                            <li role="presentation" >
                                <a role="menuitem" tabindex="-1"  href="#part">分离的链接</a>
                            </li>
                        </ul>
                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right hidden-sm">

                    <li><a href=""><span class="glyphicon glyphicon-console"></span> 注册</a></li>
                    <li><a href=""><span class="glyphicon glyphicon-user"></span> 登录</a></li>
                </ul>
                <form class="navbar-form navbar-right hidden-md hidden-sm" action="" method="get">
                    <div class="input-group">
                        <input type="text" name = "search" class="form-control" placeholder="课程名称...">
                        <span class="input-group-btn">
						<button class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
						</span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</nav>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active" style="background: url(${pageContext.request.contextPath}/image/photo1.jpg) no-repeat;">
            <!--<img src="image/photo1.jpg" alt="...">      -->
        </div>
        <div class="item" style="background: url(${pageContext.request.contextPath}/image/photo2.jpg) no-repeat;">
            <!--<img src="image/photo2.jpg" alt="...">-->
        </div>
        <div class="item" style="background: url(${pageContext.request.contextPath}/image/photo3.jpg) no-repeat;">
            <!--<img src="image/photo3.jpg" alt="...">-->
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
<div class="container-fluid">
    <div class="page-header">
        <h3 class="text-center">最新课程<a href="#">全部课程 &gt;</a></h3>
    </div>
    <div class="row">
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
    </div>
    <div class="page-header">
        <h3 class="text-center">JAVASE<a href="#">全部课程 &gt;</a></h3>
    </div>
    <div class="row">
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
    </div>
    <div class="page-header">
        <h3 class="text-center">JAVAEE<a href="#">全部课程 &gt;</a></h3>
    </div>
    <div class="row">
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-6">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/image/java.jpg"
                     alt="通用的占位符缩略图">
                <div class="caption">
                    <a><h3>java系列课程</h3></a>
                    <p>$10 <a href="#">其他课程</a></p>

                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-2 col-md-6">
        <div class="thumbnail">
            <img src="${pageContext.request.contextPath}/image/java.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <a><h3>java系列课程</h3></a>
                <p>$10 <a href="#">其他课程</a></p>

            </div>
        </div>
    </div>
    <div class="col-sm-2 col-md-6">
        <div class="thumbnail">
            <img src="${pageContext.request.contextPath}/image/java.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <a><h3>java系列课程</h3></a>
                <p>$10 <a href="#">其他课程</a></p>

            </div>
        </div>
    </div>
    <div class="col-sm-2 col-md-6">
        <div class="thumbnail">
            <img src="${pageContext.request.contextPath}/image/java.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <a><h3>java系列课程</h3></a>
                <p>$10 <a href="#">其他课程</a></p>

            </div>
        </div>
    </div>
    <div class="col-sm-2 col-md-6">
        <div class="thumbnail">
            <img src="${pageContext.request.contextPath}/image/java.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <a><h3>java系列课程</h3></a>
                <p>$10 <a href="#">其他课程</a></p>

            </div>
        </div>
    </div>
</div>

<div class="footer hidden-xs">
    <div class="footericon">
        <i class="iconfont icon-lunchuan "></i>
    </div>
    <p class="adress">CopyRight @2018 qihangketang. All student access</p>
    <p class="link">启航在线课程  <a href="#">版权所有</a> | <a href="#">工具下载</a> | <a href="#">资料下载</a> | <a href="#">视频下载</a> | <a href="#">问题反馈</a> | <a href="#">帮助</a></p>
</div>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 包含了所有编译插件 -->
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
