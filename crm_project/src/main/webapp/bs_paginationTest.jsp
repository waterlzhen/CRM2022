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

    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">

    <!--  JQUERY -->
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <!--  BOOTSTRAP -->
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <!--  datetimepicker plugin -->
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <!--  PAGINATION plugin -->
    <script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>
    <title>Title</title>
    <script type="text/javascript">
        $(function() {

            $("#demo_pag1").bs_pagination({
                currentPage:1,//当前页码，相当于pageNo

                rowsPerPage:10,//每页显示记录条数，相当于pageSise
                totalRows:1000,//总记录条数
                totalPages: 100,//总页数，必填项

                visiblePageLinks:5,//显示页码卡片的个数

                showGoToPage: true,//是否显示“跳转到”部分，默认是---true  显示
                showRowsPerPage: true,//是否显示“每页显示记录条数”，默认是---true 显示
                showRowsInfo: true,//是否显示记录的信息，默认是---true 显示


                /*
                getOption 用于获取分页对象中的参数
               例如： 用rowsPerPage 代替option_name  返回的就是 每页显示记录条数
                    $("#element_id").bs_pagination('getOption', 'option_name');
                */
                //用户每次切换页码，都会自动触发本回调函数
                //每次返回也换页码之后pageNo,pageSize
                //形参：event 事件本身
                //形参：pageObj 翻页对象，其中记录了翻页的所有信息，当前页码，每页显示记录条数，总页数等
                onChangePage: function(event,pageObj) { // returns page_num and rows_per_page after a link has clicked
                }
            });

        });
    </script>
</head>
<body>
<!--  Just create a div and give it an ID -->

<div id="demo_pag1"></div>
</body>
</html>
