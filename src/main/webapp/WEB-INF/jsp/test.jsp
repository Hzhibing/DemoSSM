<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/6/25
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-select/dist/css/bootstrap-select.min.css">
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script>
        function sendjson(){
            $.ajax({
                url:"${pageContext.request.contextPath}/json",
                type:"POST",
                data:'{"username":"hanzhibing","password","admin123"}',
                contentType : "application/json;charset=utf-8",
                success : function(result) {
                    alert("request success ! ");
                }
            });
        }

    </script>
    <title>Title</title>
</head>
<body>
<button onclick="sendjson()">json数据交互测试</button>
</body>
</html>
