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
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/echars/echarts.min.js"></script>
    <title>交易图表</title>
    <script type="text/javascript">

        $(function () {
            //发送查询请求
            $.ajax({
                url:'workbench/chart/transaction/queryCountTranGroupByStage.do',
                type:'post',
                dataType:'json',
                success:function (data) {
                    //调用echarts工具函数，显示漏斗图
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main'));

                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '交易统计图表',
                            subtext: '交易表中各个阶段的数量'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c}"
                        },
                        toolbox: {
                            feature: {
                                dataView: {readOnly: false},
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        series: [
                            {
                                name: '数据量',
                                type: 'funnel',
                                left: '10%',
                                width: '80%',
                                label: {
                                    formatter: '{b}'
                                },
                                labelLine: {
                                    show: true
                                },
                                itemStyle: {
                                    opacity: 0.7
                                },
                                emphasis: {
                                    label: {
                                        position: 'inside',
                                        formatter: '{b}: {c}'
                                    }
                                },
                                data: data
                            }
                        ]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                }
            });
        });
/*
        $(function (){
            $.ajax({
                url:"workbench/chart/transaction/queryCountTranGroupByStage.do",
                type:"POST",
                dataType:"json",
                success:function (data){
                        //调用echarts 工具函数 ，显示漏斗图
                    var echarts =  echarts.init(document.getElementById("main"));

                    var option = {
                        title: {
                            text: '交易统计图表',
                            subtext:'交易表各阶段的数量'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c}'
                        },
                        toolbox: {
                            feature: {
                                dataView: { readOnly: false },
                                restore: {},
                                saveAsImage: {}
                            }
                        },

                        series: [
                            {
                                name: '数据量',
                                type: 'funnel',
                                left: '10%',
                                width: '80%',
                                label: {
                                    formatter: '{b}'
                                },
                                labelLine: {
                                    show: true
                                },
                                itemStyle: {
                                    opacity: 0.7
                                },
                                emphasis: {
                                    label: {
                                        position: 'inside',
                                        formatter: '{b}: {c}'
                                    }
                                },
                                data: data
                            },

                        ]
                    };

                    echarts.setOption(option)
                    }
            });
        })*/
    </script>
</head>
<body>
    <div id="main" style=" margin-left: 5%;width: 80%;height: 90%;">


    </div>
</body>
</html>
