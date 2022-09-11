<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">

    <!--  JQUERY -->
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <title>文件下载</title>
    <script type="text/javascript">
        $(function (){
            $("#fileDownloadBtn").click(function (){
            //    文件下载发送都是同步请求
                window.location.href="workbench/activity/fileDownload.do";
            })
        })
    </script>
</head>
<body>

<input type="button" value="下载" id="fileDownloadBtn">
</body>
</html>
