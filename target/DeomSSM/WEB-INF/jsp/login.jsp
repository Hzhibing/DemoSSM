<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/5/17
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>起航课堂</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
    <%--<script>
        function changeImage() {
            document.getElementById("verifyCodeImage").src = "${pageContext.request.contextPath }/getVerifyCode";
        }
    </script>--%>
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
                <a class="navbar-brand" href="#" style="" id="navbar-brandid"><i class="iconfont icon-lunchuan "></i>启航课堂</a>
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

<div class = "container" id="loginhtml">
    <div class="row">
        <div class="col-md-7 col-sm-6 col-xs-5" ></div>
        <div class="col-md-10 col-sm-12 col-xs-14 login-col">
            <ul class="nav nav-tabs" id="ul1">
                <li class="active col-xs-12 col-lg-12 col-sm-12"><a data-toggle="tab" href="#login">用户登录</a></li>
                <li class="col-xs-12 col-lg-12 col-sm-12"><a data-toggle="tab" href="#register">用户注册</a></li>
            </ul>
            <div class="tab-content">
                <div id="login" class="tab-pane fade in active">
                    <form action="${pageContext.request.contextPath}/login" method="post" id="loginform">
                        <%
                            String result =(String) request.getAttribute("result");
                            String node = (String) request.getAttribute("code");
                            if(result!=null&& !"".equals(result)){
                        %>
                          <script>
                              alert("用户名或密码错误");
                              </script>
                        <%
                            }
                            if(node!=null&& !"".equals(node)){
                        %>
                        <script>
                            alert("验证码输入错误");
                        </script>
                        <%
                            }
                        %>
                        <div class="form-group">
                            <label for="lousername">账号:</label>
                            <input id="lousername" type="text" name="username" class="form-control" placeholder="请输入账号......">
                        </div>
                        <div class="form-group">
                            <label for="lopassword">密码:</label>
                            <input id="lopassword" type="password" name="password" class="form-control" placeholder="请输入密码......">
                        </div>
                        <div class="form-group">
                            <label for="captcha">验证码:</label>
                            <input type="text" name="captcha" value=""
                                   class="form-control" placeholder="请输入验证码"style="width:180px;" maxlength="4" id="captcha">
                            <img style="position: absolute;left: 200px;top: 25px;"  alt="验证码"
                                 src="servlet/google/kaptcha.jpg" id="id_captcha"
                                 onclick="changeCode()">
                            <br>
                            <a href="#" class="a"
                               onclick="changeCode()" style="margin-right: 0px">看不清，换一张</a>
                        </div>
                        <div class="check">
                            <input type="checkbox" name="checkbox">  记住密码
                        </div>
                        <div class="form-group">
                            <input type="submit" class="form-control btn btn-primary" value="登录">
                        </div>
                        <div class="form-group">
                            <p><a href="#">找回密码</a> | 还没有账号？| <a href="#">注册账号</a></p>
                        </div>
                        <div class="form-group" >
                            <p style="text-align: right;">使用第三方登录</p>
                            <p style="text-align: right;" id="icons">
                                <a href="#" class="qq"><i class="iconfont icon-qq " style="/font-size:30px"></i></a>
                                <a href="#" class="weixin"><i class="iconfont icon-weixin1 " style="/font-size:30px"></i></a>
                            </p>
                        </div>
                    </form>
                </div>

                <div id="register" class="tab-pane fade">
                    <form action="#" method="post" id="registerform">

                        <div class="form-group">
                            <label for="phone">手机</label>
                            <input id="phone" type="text" name="phone" class="form-control" placeholder="请输入手机号......">
                        </div>
                        <div class="form-group">
                            <label for="reusername">账号</label>
                            <input id="reusername" type="text" name="username" class="form-control" placeholder="请输入账号......">
                        </div>
                        <div class="form-group">
                            <label for="repassword">密码:</label>
                            <input id="repassword" type="password" name="password" class="form-control" placeholder="请输入密码......">
                        </div>
                        <div class="form-group">
                            <label for="password1">确认密码:</label>
                            <input id="password1" type="password" name="password" class="form-control" placeholder="确认密码......">
                        </div>
                        <div class="form-group">
                            <label>手机验证码:</label>
                            <div class="row" id="coderow">
                                <div class="col-xs-12">
                                    <input type="text" name="phoneCode" class="form-control" placeholder="验证码">
                                </div>
                                <div class="col-xs-12">
                                    <input type="button" value="获取验证码" class="btn btn-default form-control">
                                </div>
                            </div>

                        </div>
                        <div class="form-group" id="registerid">
                            <input type="submit" class="form-control btn btn-primary" value="注册" >
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-7 col-sm-6 col-xs-5" ></div>
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
<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
</body>
</html>