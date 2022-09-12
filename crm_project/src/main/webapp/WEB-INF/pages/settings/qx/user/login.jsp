<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
			request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
<meta charset="UTF-8">
	<base href="<%=basePath%>">
<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

	<style>
		#msg{
			color: #fe0000;
		}
	</style>
	<script>

		$(function (){

			$(window).keyup(function (event){
				if (event.keyCode==13){
					$("#loginBtn").click();
				}
			})
			/*
			*
			* */
			$("#loginBtn").click(function () {

				var loginAct = $.trim($("#loginAct").val());
				var loginPwd = $.trim($("#loginPwd").val());
				var isRemPwd = $("#isRemPwd").prop("checked");
				if (loginAct==""){
					alert("用户名不能为空")
					return ;
				}
				if (loginPwd==""){
					alert("密码不能为空");
					return ;
				}

				$.ajax({
					url:"settings/qx/user/login.do",
					data:{
						loginAct:loginAct,
						loginPwd:loginPwd,
						isRemPwd:isRemPwd
					},
					type:"POST",
					dataType:"json",
					success:function (data){
						if (data.code=="1"){
							// alert(data.code)
							window.location.href="workbench/index.do";
						}
						else {
							$("#msg").html(data.message)
						}
					},
					beforeSend:function (){
						/*
						当ajax项后台真正发送请求之前，会自动执行本函数
						作用：此函数的返回值决定了ajax是否真正向后台发送请求
						函数返回true/false  当返回true是发送请求，否则不发送
						*/
						$("#msg").html("正在努力验证中.....");
					}
				});
			});

			//懒得输入账号和密码
			// $("#loginAct").val("zs");
			// $("#loginPwd").val("yf123");
			// $("input").focus(function (){
			// 	$("#msg").html("");
			// });
			$("input").keyup(function (){
				$("#msg").html("");
			});
		})
	</script>
</head>
<body>
	<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
		<img src="image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;">
	</div>
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">CRM &nbsp;<span style="font-size: 12px;">&copy;2019&nbsp;动力节点</span></div>
	</div>
	
	<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
		<div style="position: absolute; top: 0px; right: 60px;">
			<div class="page-header">
				<h1>登录</h1>
			</div>
			<form action="workbench/index.html" class="form-horizontal" role="form" method="post">
				<div class="form-group form-group-lg">
					<div style="width: 350px;">
						<input class="form-control" id="loginAct" value="${cookie.loginAct.value}" type="text" placeholder="用户名">
					</div>
					<div style="width: 350px; position: relative;top: 20px;">
						<input class="form-control" id="loginPwd" value="${cookie.loginPwd.value}" type="password" placeholder="密码">
					</div>
					<div class="checkbox"  style="position: relative;top: 30px; left: 10px;">
						<label>
							<c:if test="${not empty cookie.loginAct and not empty cookie.loginPwd}">
								<input id="isRemPwd" type="checkbox" checked> 十天内免登录
							</c:if>
							<c:if test="${ empty cookie.loginAct or  empty cookie.loginPwd}">
								<input id="isRemPwd" type="checkbox"> 十天内免登录
							</c:if>
						</label>
						&nbsp;&nbsp;
						<span id="msg"></span>
					</div>
					<button type="button" id="loginBtn" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>