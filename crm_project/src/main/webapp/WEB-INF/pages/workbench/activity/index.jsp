<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="UTF-8">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<!--  JQUERY -->
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
	<!--  BOOTSTRAP -->
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
	<!--  datetimepicker plugin -->
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
	<!--  PAGINATION plugin -->
	<link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
	<script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
	<script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>
<script type="text/javascript">



	$(function(){

		//日期拾取器插件
		$(".time").datetimepicker({
			format:"yyyy-mm-dd",//日期格式
			minView:"month",//可选择最小视图
			autoclose:"true",//设置完日期后自动关闭
			todayBtn:"true",//显示当前时间的按钮
			initialDate:new Date(),//初始化显示时间
			clearBtn:"true",//是否显示清空按钮
			language:"zh-CN",//日期的格式
			pickerPosition: "bottom-left"//日期的悬浮位置

		})

		//给"创建"按钮添加点击事件
		$("#createActivityBtn").click(function (){
			//初始化工作
			//重置表单
			$("#createActivityFrom").get(0).reset();
			//创建市场活动的模态窗口
			$("#createActivityModal").modal("show");
		})

	//	给"保存"按钮添加单击事件
		$("#saveActivityBtn").click(function (){

		var owner		=	$("#create-marketActivityOwner").val();
 		var name 		= 	$.trim($("#create-marketActivityName").val());
 		var startDate	=	$("#create-startDate").val();
 		var endDate		=	$("#create-endDate").val();
 		var cost		=	$.trim($("#create-cost").val());
 		var description =	$.trim($("#create-description").val());
 		if (owner==""){
 			alert("所有者不能为空");
			return ;
		}
 		if (name==""){
 			alert("名称不能为空");
 			return ;
		}
 		if (startDate!=""&&endDate!=""){
 			if (endDate<startDate){
 				alert("开始时间必须小于结束时间");
 				return;
			}
		}
 		var regExp= /^(([1-9]\d*)|0)$/;
 		if (!regExp.test(cost)){
 			alert("成本只能是非负整数");
 			return ;
		}
 		$.ajax({
			url:"workbench/activity/saveCreateActivity.do",
			data:{
				owner:owner,
				name:name,
				startDate:startDate,
				endDate:endDate,
				cost:cost,
				description:description
			},
			type:"post",
			dataType:"json",
			success:function (data){
				if (data.code!="1"){
					//提示信息
					alert(data.message);
					$("#createActivityModal").modal("show");//可以不写
				//	窗口不关闭
				}else {
					//调用分页函数 刷新市场活动列表
					queryActivityByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
					//保存成功 ，关闭模态窗口
					$("#createActivityModal").modal("hide");

				}
			}
		})
			/*
			* 正则表达式：
			* 	语法通则：
			* 		1）//:在js中定义一个正则表达式 eg：regExp=/^[abc]$/
			* 		2) ^:匹配字符串的开头位置
			* 			$:匹配字符串结尾位置
			* 		3）[]:匹配字符集中的一位字符 eg：var regExp=/^[abcdef]$/;
			* 										var regExp=/^[a-z0-9]$/
			* 		4){}:匹配次数  eg :regExp =/[abcef]{5}/ ;匹配五次
			* 			{m}:匹配m次
			* 			{m,n}:匹配 m次到 n次 （n≥m）
			* 			{m,}:匹配m次或者更多次（）
			* 		5）特殊字符：
			* 		\d:匹配一个数字 ，相当于[0-9]
			* 		\D：匹配一个非数字
			* 		\w:匹配所有字符，包括字母，数字，下划线
			* 		\W:匹配所有非字符，除了字母，数字，下划线以外的字符
			*
			* 		*：匹配 0次或者多次，相当于{0,}
			* 		+：匹配1次或者多次，相当于{1,}
			* 		？：匹配0次或者1次，相当于{0,1}
			*
			* */

		})
		//当市场活动主页面加载完毕时，查询多有数据的第一页一所有的数据的总条数，每页默认10条
		queryActivityByConditionForPage(1,10);

		//给"查询"按钮添加点击事件
		$("#queryActivityBtn").click(function (){
			queryActivityByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
		});

	//	给全选按钮添加点击事件
		$("#checkAllBox").click(function (){
			//如果"全选"按钮是被选中的状态，则列表中所有的checkbox都选择中
		$("#tBody input[type='checkbox']").prop("checked",this.checked);
		});

	//单击市场活动列表中的复选框 添加点击事件，因为tBody里的是动态元素不能直接加click事件，而是使用以下方式
		//$(父容器).on(事件名称，子类选择器，函数)
		$("#tBody").on("click","input[type='checkbox']",function (){

			if($("#tBody input[type='checkbox']").size()==$("#tBody input[type='checkbox']:checked").size()){
				$("#checkAllBox").prop("checked",true);

			}else {
				$("#checkAllBox").prop("checked",false);

			}
		})


	//	给“删除”按钮添加点击事件
		$("#deleteActivityBtn").click(function (){
			//获取所有被选择的checkbox
		 var $checkedIds =	$("#tBody input[type='checkbox']:checked");

			if ($checkedIds.size()==0){
				alert("请选择需要删除市场活动")
				return ;
			}else {
				if (window.confirm("确认要删除"+$checkedIds.size()+"条记录")){
					var ids ="";
					$.each($checkedIds,function (index,obj){//id=xxx&id=xxx&.....id=xxx&
						ids		+= "id="+this.value+"&";
					})
					//截取字符串
					ids =ids.substr(0,ids.length-1);//id=xxx&id=xxx&.....id=xxx

					//	发送请求
					$.ajax({
						url:"workbench/activity/deleteActivityByIds.do",
						data: ids,
						type:"POST",
						dataType:"json",
						success:function (data){
							if (data.code=="0"){
							//	删除失败
							alert(data.message);
							}else{
								//删除成功，刷新列表
								queryActivityByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
							}
						}
					})
				}
			}
		});

	//	给"修改"按钮添加点击事件
		$("#editActivityBtn").click(function (){
			var $checkedIds = $("#tBody input[type='checkbox']:checked");
			if($checkedIds.size()==0){
				alert("请选择需要修改的市场活动");
			}else if($checkedIds.size()>1){
				alert("请选择单条市场活动");
			}else {
				var id=$checkedIds.val();
				$.ajax({
				    url:"workbench/activity/queryActivityById.do",
				    data:{
				    	id:id
				    },
				    type:"POST",
				    dataType:"json",
				    success:function (data){

				    	//被修改的市场活动id
						$("#edit-id").val(data.id);

				    	//填充模态窗口数据
						$("#edit-marketActivityOwner").val(data.owner)
				    	$("#edit-marketActivityName").val(data.name);
				    	$("#edit-startDate").val(data.startDate);
				    	$("#edit-endDate").val(data.endDate);
				    	$("#edit-cost").val(data.cost);
				    	$("#edit-description").val(data.description)

						//打开修改模态窗口

						$("#editActivityModal").modal("show");
				        }
				});
			}
		});

	//	给“更新”按钮添加单击事件
		$("#updateActivityBtn").click(function (){
			var id=$("#edit-id").val();
			var owner =$("#edit-marketActivityOwner").val();
			var name  =$.trim($("#edit-marketActivityName").val());
			var startDate=$("#edit-startDate").val();
			var endDate=$("#edit-endDate").val();
			var cost =$.trim($("#edit-cost").val());
			var description= $.trim($("#edit-description").val());

			if (owner==""){
				alert("所有者不能为空");
				return ;
			}
			if (name==""){
				alert("名称不能为空");
				return ;
			}
			if (startDate!=""&&endDate!=""){
				if (endDate<startDate){
					alert("开始时间必须小于结束时间");
					return;
				}
			}
			var regExp= /^(([1-9]\d*)|0)$/;
			if (!regExp.test(cost)){
				alert("成本只能是非负整数");
				return ;
			}
			$.ajax({
				url:"workbench/activity/saveEditActivity.do",
				data:{
					id:id,
					owner:owner,
					name:name,
					startDate:startDate,
					endDate:endDate,
					cost:cost,
					description:description
				},
				type:"post",
				dataType:"json",
				success:function (data){
					if (data.code=="0"){
						alert(data.message)
					}else {
						//更新市场活动列表
						queryActivityByConditionForPage($("#demo_pag1").bs_pagination('getOption', 'currentPage'),$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'))
						//关闭模态窗口
						$("#editActivityModal").modal("hide");
					}
				}
			});
		});

		//给“批量下载”的按钮添加单击事件
		$("#exportActivityAllBtn").click(function (){
			window.location.href="workbench/activity/exportAllActivities.do";
		});

		//给“选择导出”的按钮添加单击事件
		$("#exportActivityXzBtn").click(function (){
			var $checkedIds =	$("#tBody input[type='checkbox']:checked");

			if ($checkedIds.size()==0){
				alert("请选择需要导出的市场活动")
				return ;
			}else {
				var idsStr ="";
				$.each($checkedIds,function (index,obj){//id=xxx&id=xxx&.....id=xxx&
					idsStr		+= "id="+this.value+"&";
				})
				//截取字符串
				idsStr =idsStr.substr(0,idsStr.length-1);//id=xxx&id=xxx&.....id=xxx
				//发起同步请求
				window.location.href="workbench/activity/exportXzActivity.do?"+idsStr;
			}
		});

		//给“导入”按钮添加点击事件
		$("#importActivityBtn").click(function (){
		var activityFileName =	$("#activityFile").val();//获取文件名

			var suffix =  activityFileName.substr(activityFileName.indexOf(".")+1).toLocaleLowerCase();
			if (suffix!="xls"){
				alert("仅支持xls文件")
				return ;
			}
		var activityFile=	$("#activityFile")[0].files[0];
			//检验文件大小是否大于 5M
			if (activityFile.size>5*1024*1024){
				alert("文件大小必须小于5M")
				return ;
			}

			var formData= new FormData();

			formData.append("activityFile",activityFile)
		//	发起请求
			$.ajax({
			    url:"workbench/activity/inputActivity.do",
			    data:formData,
				processData:false,//参数作用：向后台发起请求前，是否把参数统一转换为字符串，true--是，false--否，默认true
				contentType:false,//参数作用：向后台发起请求前，是否把所有参数统一使用urlencoded编码，true--是，false--否，默认true
			    type:"POST",
			    dataType:"json",
			    success:function (data){
						if (data.code=="1"){
							alert("成功导入"+data.retData+"条记录")
							$("#importActivityModal").modal("hide")
							queryActivityByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'))
						}else {
							alert(data.message);
							$("#importActivityModal").modal("show");
						}
			        }
			});
		});

	});


	function queryActivityByConditionForPage(pageNo,pageSize){

		var name = $("#query-name").val();
		var owner = $("#query-owner").val();
		var startDate = $("#query-startDate").val();
		var endDate = $("#query-endDate").val();
		//发起请求
		$.ajax({
			url: "workbench/activity/queryActivityByCondition.do",
			data: {
				name:name,
				owner:owner,
				startDate:startDate,
				endDate:endDate,
				pageNo:pageNo,
				pageSize:pageSize
			},
			type: "POST",
			dataType: "json",
			success:function (data){
				//显示总记录条数
				$("#totalRowsB").html(data.totalRows);

				//遍历activityList,拼接所有行数据
				var htmlStr="";
				$.each(data.activityList,function (index,obj){
					htmlStr+="<tr class=\"active\">";
					htmlStr+="<td><input type=\"checkbox\" value='"+obj.id+"' /></td>";
					htmlStr+="<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/activity/detailActivity.do?id="+obj.id+"'\">"+obj.name+"</a></td>";
					htmlStr+="<td>"+obj.owner+"</td>";
					htmlStr+="<td>"+obj.startDate+"</td>";
					htmlStr+="<td>"+obj.endDate+"</td>";
					htmlStr+="</tr>";
				})
				$("#tBody").html(htmlStr);

				//取消全选按钮
				$("#checkAllBox").prop("checked",false);

				//计算总页数 总记录条数 除以 每页显示记录数 =总页数 但必须向上取整
				var total_Page =Math.ceil(data.totalRows/pageSize);
				$("#demo_pag1").bs_pagination({
					currentPage:pageNo,//当前页码，相当于pageNo

					rowsPerPage:pageSize,//每页显示记录条数，相当于pageSise
					totalRows:data.totalRows,//总记录条数
					totalPages: total_Page,//总页数，必填项

					visiblePageLinks:10,//显示页码卡片的个数

					showGoToPage: true,//是否显示“跳转到”部分，默认是---true  显示
					showRowsPerPage: true,//是否显示“每页显示记录条数”，默认是---true 显示
					showRowsInfo: true,//是否显示记录的信息，默认是---true 显示

					//回调函数
					onChangePage: function(event,pageObj) { // returns page_num and rows_per_page after a link has clicked

						queryActivityByConditionForPage(pageObj.currentPage,pageObj.rowsPerPage);
					}
				});
			}
		});

	}
</script>
</head>
<body>

	<!-- 创建市场活动的模态窗口 -->
	<div class="modal fade" id="createActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form  id="createActivityFrom" class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-marketActivityOwner">

									<c:forEach items="${requestScope.userList}" var="user">

										<c:if test="${sessionScope.sessionUser.id eq user.id}">
											<option value="${user.id}" selected>${user.name}</option>
										</c:if>
										<c:if test="${sessionScope.sessionUser.id ne user.id}">
											<option value="${user.id}" >${user.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
                            <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-marketActivityName" value="测试05">
                            </div>
						</div>
						
						<div class="form-group">
							<label for="create-startDate" class="col-sm-2 control-label"  >开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control time" id="create-startDate"  readonly autocomplete="off">
							</div>
							<label for="create-endDate" class="col-sm-2 control-label" >结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input  type="text" class="form-control time" id="create-endDate" readonly autocomplete="off">
							</div>
						</div>
                        <div class="form-group">

                            <label for="create-cost" class="col-sm-2 control-label">成本</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control " id="create-cost" value="1110">
                            </div>
                        </div>
						<div class="form-group">
							<label for="create-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-description" ></textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveActivityBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改市场活动的模态窗口 -->
	<div class="modal fade" id="editActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form id="eitdActivityFrom" class="form-horizontal" role="form">
					<input type="hidden" id="edit-id">
						<div class="form-group">
							<label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-marketActivityOwner">
									<c:forEach items="${requestScope.userList}" var="user">

										<c:if test="${sessionScope.sessionUser.id eq user.id}">
											<option value="${user.id}" selected>${user.name}</option>
										</c:if>
										<c:if test="${sessionScope.sessionUser.id ne user.id}">
											<option value="${user.id}" >${user.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
                            <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-marketActivityName" >
                            </div>
						</div>

						<div class="form-group">
							<label for="edit-startDate" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input   type="text" class="form-control time" id="edit-startDate"  readonly>
							</div>
							<label for="edit-endDate" class="col-sm-2 control-label">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input   type="text" class="form-control time" id="edit-endDate" readonly>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-cost" class="col-sm-2 control-label">成本</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-cost" value="5,000">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-description">市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等</textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="updateActivityBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 导入市场活动的模态窗口 -->
    <div class="modal fade" id="importActivityModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 85%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">导入市场活动</h4>
                </div>
                <div class="modal-body" style="height: 350px;">
                    <div style="position: relative;top: 20px; left: 50px;">
                        请选择要上传的文件：<small style="color: gray;">[仅支持.xls]</small>
                    </div>
                    <div style="position: relative;top: 40px; left: 50px;">

							<input type="file" id="activityFile">


                    </div>
                    <div style="position: relative; width: 400px; height: 320px; left: 45% ; top: -40px;" >
                        <h3>重要提示</h3>
                        <ul>
                            <li>操作仅针对Excel，仅支持后缀名为XLS的文件。</li>
                            <li>给定文件的第一行将视为字段名。</li>
                            <li>请确认您的文件大小不超过5MB。</li>
                            <li>日期值以文本形式保存，必须符合yyyy-MM-dd格式。</li>
                            <li>日期时间以文本形式保存，必须符合yyyy-MM-dd HH:mm:ss的格式。</li>
                            <li>默认情况下，字符编码是UTF-8 (统一码)，请确保您导入的文件使用的是正确的字符编码方式。</li>
                            <li>建议您在导入真实数据之前用测试文件测试文件导入功能。</li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="importActivityBtn" type="button" class="btn btn-primary">导入</button>
                </div>
            </div>
        </div>
    </div>
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>市场活动列表</h3>
			</div>
		</div>
	</div>
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input class="form-control" type="text" id="query-name">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input class="form-control" type="text" id="query-owner">
				    </div>
				  </div>


				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">开始日期</div>
					  <input class="form-control time" type="text" id="query-startDate" readonly/>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">结束日期</div>
					  <input class="form-control time" type="text" id="query-endDate" readonly>
				    </div>
				  </div>
				  
				  <button type="button" class="btn btn-default" id="queryActivityBtn">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" id="createActivityBtn" class="btn btn-primary" ><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" id="editActivityBtn" class="btn btn-default" ><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" id="deleteActivityBtn" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				<div class="btn-group" style="position: relative; top: 18%;">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#importActivityModal" ><span class="glyphicon glyphicon-import"></span> 上传列表数据（导入）</button>
                    <button id="exportActivityAllBtn" type="button" class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 下载列表数据（批量导出）</button>
                    <button id="exportActivityXzBtn" type="button" class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 下载列表数据（选择导出）</button>
                </div>
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="checkAllBox" /></td>
							<td>名称</td>
                            <td>所有者</td>
							<td>开始日期</td>
							<td>结束日期</td>
						</tr>
					</thead>
					<tbody id="tBody">
						<%--<tr class="active">
							<td><input type="checkbox" /></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">发传单</a></td>
                            <td>zhangsan</td>
							<td>2020-10-10</td>
							<td>2020-10-20</td>
						</tr>
                        <tr class="active">
                            <td><input type="checkbox" /></td>
                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">发传单</a></td>
                            <td>zhangsan</td>
                            <td>2020-10-10</td>
                            <td>2020-10-20</td>
                        </tr>--%>
					</tbody>
				</table>
				<div id="demo_pag1"></div>
			</div>
		<%--分页导航--%>
<%--			<div style="height: 50px; position: relative;top: 30px;">--%>
<%--				<div>--%>
<%--					<button type="button" class="btn btn-default" style="cursor: default;">共<b id="totalRowsB">50</b>条记录</button>--%>
<%--				</div>--%>
<%--				<div class="btn-group" style="position: relative;top: -34px; left: 110px;">--%>
<%--					<button type="button" class="btn btn-default" style="cursor: default;">显示</button>--%>
<%--					<div class="btn-group">--%>
<%--						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">--%>
<%--							10--%>
<%--							<span class="caret"></span>--%>
<%--						</button>--%>
<%--						<ul class="dropdown-menu" role="menu" style="min-width: 60px">--%>
<%--							<li><a href="#">20</a></li>--%>
<%--							<li><a href="#">30</a></li>--%>
<%--						</ul>--%>
<%--					</div>--%>
<%--					<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>--%>
<%--				</div>--%>
<%--				<div style="position: relative;top: -88px; left: 285px;">--%>
<%--					<nav>--%>
<%--						<ul class="pagination">--%>
<%--							<li class="disabled"><a href="#">首页</a></li>--%>
<%--							<li class="disabled"><a href="#">上一页</a></li>--%>
<%--							<li class="active"><a href="#">1</a></li>--%>
<%--							<li><a href="#">2</a></li>--%>
<%--							<li><a href="#">3</a></li>--%>
<%--							<li><a href="#">4</a></li>--%>
<%--							<li><a href="#">5</a></li>--%>
<%--							<li><a href="#">下一页</a></li>--%>
<%--							<li class="disabled"><a href="#">末页</a></li>--%>
<%--						</ul>--%>
<%--					</nav>--%>
<%--				</div>--%>
<%--			</div>--%>
			
		</div>
		
	</div>
</body>
</html>