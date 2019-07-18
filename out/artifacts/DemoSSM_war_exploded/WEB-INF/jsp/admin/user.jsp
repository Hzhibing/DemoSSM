<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/5/20
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>起航课堂</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/datetimepicker/css/bootstrap-datetimepicker.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
    <!--[if lt IE 9]>
    <script src="https://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<div class="container-fluid">
    <div class="row">
        <div class="bar">
            搜 索
        </div>
    </div>
    <div class="row">
        <form class="form-inline" id="search_form" action="${pageContext.request.contextPath}/admin/userSearch.html" method="post">
            <div class="form-group has-feedback">
                <label>报名时间</label>&nbsp;
                <input type="text" name="startime" class="form-control form_datetime" placeholder="有待实现">
                <i class="iconfont icon-rili form-control-feedback"></i>
            </div>
            &nbsp;
            <div class="form-group has-feedback">
                <label>至</label>&nbsp;
                <input type="text" name="endtime" class="form-control form_datetime" placeholder="有待实现">
                <i class="iconfont icon-rili form-control-feedback"></i>
            </div>
            &nbsp;
            <div class="form-group">
                <label>报名课程</label>&nbsp;
                <input type="text" name="courseName" class="form-control" placeholder="有待实现">
            </div>
            &nbsp;
            <div class="form-group">
                <label>学员信息</label>&nbsp;
                <input type="text" name="studentInfo" class="form-control" placeholder="用户名/电话">
            </div>
        </form>
    </div>
    <div class="row text-right" id="search_btn">
        <button id="searchBtn" class="btn btn-default"  value="查询">查询</button>
        <button class="btn btn-default" type="button" value="添加" data-toggle="modal" data-target="#addModal">添加</button>
        <button id ="deleteUsers" class="btn btn-default" type="button" value="删除">删除</button>
        <button  disabled href="#" class="btn btn-default" type="button" value="导入">导入</button>
        <button disabled class="btn btn-default" type="button" value="导出">导出</button>
    </div>
    <div class="row">
        <div class="table-responsive" id="content-table">
            <table class="table-bordered table table-hover table-striped">
                <tr class="text-center">
                    <td><input type="checkbox" name="allcheck" id="allcheck" class="checkall" onclick="checkall();">全选</td>
                    <td>用户名</td>
                    <td>手机号</td>
                    <td>邮箱地址</td>
                    <td>角色</td>
                    <td>用户状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${userPageInfoList.list}" var="item">
                    <tr class="text-center">
                        <td><input value="${item.id}" type="checkbox" name="checkuser" class="checkone" onclick="checkone();"></td>
                        <td>${item.username}</td>
                        <td>${item.phone}</td>
                        <td>${item.email}</td>
                        <td>${item.role.name}</td>
                        <td>${item.enable}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/updateUser?id=${item.id}" class="btn btn-default" data-target="#updateModal" data-toggle="modal">编辑</a> <a href="javascript:removeUser(${item.id})" class="btn btn-default" >删除</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row" id="page">
        <p>一共<span>${userPageInfoList.total}</span>条记录，当前页<span>${userPageInfoList.pageNum}/${userPageInfoList.pages}</span></p>
        <div class="btngroup pull-right" id="fen">
            <a href="${pageContext.request.contextPath}/admin/user_manager.html?pageNum=1&pageSize=5" class="btn btn-default">首 页</a>
            <a href="${pageContext.request.contextPath}/admin/user_manager.html?pageNum=${userPageInfoList.prePage}&pageSize=5" class="btn btn-default">上一页</a>
            <a href="${pageContext.request.contextPath}/admin/user_manager.html?pageNum=${userPageInfoList.nextPage}&pageSize=5" class="btn btn-default">下一页</a>
            <a href="${pageContext.request.contextPath}/admin/user_manager.html?pageNum=${userPageInfoList.pages}&pageSize=5" class="btn btn-default">尾 页</a>
        </div>
    </div>
</div>
<!--添加-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用戶</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/addjsp" method="post" id="addform">
                    <div class="form-group">
                        <label for="username">用户名:</label>
                        <input id="username" type="text" name="username" class="form-control" placeholder="请输入账号......">
                    </div>
                    <div class="form-group">
                        <label for="password">密码:</label>
                        <input id="password" type="password" name="password" class="form-control" placeholder="请输入密码......">
                    </div>
                    <div class="form-group">
                        <label for="phone">手机号:</label>
                        <input id="phone" type="text" name="phone" class="form-control" placeholder="请输入手机号......">
                    </div>
                    <div class="form-group">
                        <label for="email">邮箱:</label>
                        <input id="email" type="text" name="email" class="form-control" placeholder="请输入邮箱......">
                    </div>
                    <div class="form-group">
                        <label>用户类别:</label>
                        <select name="roles" class="form-control">
                            <c:forEach items="${result}" var="item">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <!--<div class="text-right">
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>


                         <input type="submit" class="btn btn-primary" value="添加" id="submitBtn">

                    </div>-->
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
                <button type="button" class="btn btn-primary" id="btnadd">添加</button>
            </div>
        </div>
    </div>
</div>
<!--编辑-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

        </div>
    </div>
</div>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 包含了所有编译插件 -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script><!--把日期显示设为中文，引入的国际化样式-->
<script src="${pageContext.request.contextPath}/lib/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap-select/dist/js/i18n/defaults-zh_CN.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>

<script type='text/javascript'>



</script>
</body>

</html>
