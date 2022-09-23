<%--
  Created by IntelliJ IDEA.
  User: zhen
  Date: 2022/9/15 0015
  Time: 下午 02:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>错误页面</title>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
</head>
<body>
<h1>Code:${code}</h1>
<h3>${message}</h3>
<p>${ex}</p>
<a href="workbench/main/index.do" class="btn btn-default">返回主页</a>
</body>
</html>
