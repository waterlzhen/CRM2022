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

<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
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
			pickerPosition: "top-left"//日期的悬浮位置

		})

		//给“全选”按钮添加点击事件
		$("#checkAllBox").click(function (){

			$("#tBody input[type=checkbox]").prop("checked",this.checked)
		});

		//给id为tBody 的子类元素添加点击事件
		$("#tBody").on("click","input[type='checkbox']",function (){
			if ($("#tBody input[type=checkbox]").size()==$("#tBody input[type=checkbox]:checked").size()){
				$("#checkAllBox").prop("checked",true)
			}else {
				$("#checkAllBox").prop("checked",false)
			}
		});

		//给 创建 按钮添加单击事件
		$("#createClueBtn").click(function (){
			//初始化工作
			$("#createClueForm").get(0).reset()
			//打开模态窗口
			$("#createClueModal").modal("show");
		})

		//给“保存”按钮添加单击事件
		$("#saveCreateClueBtn").click(function (){
			      	//	收集参数
		var	fullname       =$.trim($("#create-fullname").val());
		var	appellation    =$("#create-appellation").val();
		var	owner          =$("#create-owner").val();
		var	company        =$.trim($("#create-company").val());
		var	job            =$.trim($("#create-job").val());
		var	email          =$.trim($("#create-email").val());
		var	phone          =$.trim($("#create-phone").val());
		var	website        =$.trim($("#create-website").val());
		var	mphone         =$.trim($("#create-mphone").val());
		var	state          =$("#create-state").val();
		var	source         =$("#create-source ").val();
		var	description    =$.trim($("#create-description").val());
		var	contactSummary =$.trim($("#create-contactSummary").val());
		var	nextContactTime=$.trim($("#create-nextContactTime").val());
		var	address        =$.trim($("#create-address").val());

		//表单验证
		if (owner==""){
			alert("所有者不能为空")
			return ;
		}
		if (company==""){
			alert("公司不能为空")
			return ;
		}
		if (fullname==""){
			alert("姓名不能为空")
			return ;
		}
			var regExp= /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (email!=""&&!regExp.test(email)){
			alert("邮箱格式不正确，请检查邮箱格式")
			return ;
		}
			 regExp=/^((\d{3,4})|(\d{3,4}-))?\d{7,8}$/;
		if (phone!=""&&!regExp.test(phone)){
			alert("公司座机格式不正确");
			return ;
		}
			regExp=/^http:\/\/([\w-]+\.)+[\w-]+(\/[\w-./?%&=]*)?$/
		if (website==""&&!regExp.test(website)){
			alert("公司网站不正确")
			return ;
		}
		regExp=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
		if (mphone!=""&&!regExp.test(mphone)){
			alert("手机号码格式不正确")
			return ;
		}
			//发起请求
			$.ajax({
			    url:"workbench/clue/saveCreateClue.do",
			    data:{
					fullname:	fullname  ,
					appellation:	appellation  ,
					owner:	owner,
					company:	company ,
					job:	job,
					email:	email  ,
					phone:	phone,
					website:	website ,
					mphone:	mphone  ,
					state:	state ,
					source:source,
					description:	description    ,
					contactSummary:	contactSummary ,
					nextContactTime:	nextContactTime,
					address:	address,
				},
			    type:"POST",
			    dataType:"json",
			    success:function (data){

					if (data.code!="1"){
						//提示信息
						alert(data.message);
						$("#createClueModal").modal("show");//可以不写
						//	窗口不关闭
					}else {
					//	刷新列表
						$("#createClueModal").modal("hide");
						queryActivityByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'))
					}

			        }
			});

		});

		//给“查询”按钮添加单击事件
		$("#queryClueBtn").click(function (){
			queryActivityByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
		});

		//给"删除"按钮添加单击事件
		$("#deleteClueBtn").click(function (){
			var $checkedIds =	$("#tBody input[type='checkbox']:checked");
			if ($checkedIds.size()==0){
				alert("请选择需要删除市场活动")
				return ;
			}
			else {
				if (window.confirm("确认要删除"+$checkedIds.size()+"条记录")){
					var ids ="";
					$.each($checkedIds,function (index,obj){//id=xxx&id=xxx&.....id=xxx&
						ids		+= "id="+this.value+"&";
					})
					//截取字符串
					ids =ids.substr(0,ids.length-1);//id=xxx&id=xxx&.....id=xxx

					//发送请求
					$.ajax({
						url:"workbench/clue/deleteClueByIds.do",
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
					});
				}
			}
		});

		//给“修改”按钮添加单击事件

		$("#editClueBtn").click(function (){
			var $checkedIds = $("#tBody input[type='checkbox']:checked");
			if($checkedIds.size()==0){
				alert("请选择需要修改的线索");
			}else if($checkedIds.size()>1){
				alert("请选择单条线索");
			}else {
				var id=$checkedIds.val();
				//发起请求
				$.ajax({
					url:"workbench/clue/queryClueById.do",
					data:{
						id:id
					},
					type:"POST",
					dataType:"json",
					success:function (data){

						//被修改的市场活动id
						$("#edit-id").val(data.id);

						//填充模态窗口数据
						$("#edit-owner").val(data.owner)
						$("#edit-company").val(data.company);
						$("#edit-appellation").val(data.appellation);
						$("#edit-fullname").val(data.fullname);
						$("#edit-job").val(data.job);
						$("#edit-email").val(data.email);
						$("#edit-mphone").val(data.mphone);
						$("#edit-website").val(data.website);
						$("#edit-phone").val(data.phone);
						$("#edit-state").val(data.state);
						$("#edit-source").val(data.source);
						$("#edit-description").val(data.description);
						$("#edit-contactSummary").val(data.contactSummary);
						$("#edit-nextContactTime").val(data.nextContactTime);
						$("#edit-address").val(data.address);

						//打开修改模态窗口

						$("#editClueModal").modal("show");
					}
				});
			}
		});

		//给“更新按钮添加点击事件”
		$("#updateClueBtn").click(function (){
			//	收集参数
			var id 				=$("#edit-id").val();
			var	fullname       =$.trim($("#edit-fullname").val());
			var	appellation    =$("#edit-appellation").val();
			var	owner          =$("#edit-owner").val();
			var	company        =$.trim($("#edit-company").val());
			var	job            =$.trim($("#edit-job").val());
			var	email          =$.trim($("#edit-email").val());
			var	phone          =$.trim($("#edit-phone").val());
			var	website        =$.trim($("#edit-website").val());
			var	mphone         =$.trim($("#edit-mphone").val());
			var	state          =$("#edit-state").val();
			var	source         =$("#edit-source ").val();
			var	description    =$.trim($("#edit-description").val());
			var	contactSummary =$.trim($("#edit-contactSummary").val());
			var	nextContactTime=$.trim($("#edit-nextContactTime").val());
			var	address        =$.trim($("#edit-address").val());

			//表单验证
			if (owner==""){
				alert("所有者不能为空")
				return ;
			}
			if (company==""){
				alert("公司不能为空")
				return ;
			}
			if (fullname==""){
				alert("姓名不能为空")
				return ;
			}
			var regExp= /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (email!=""&&!regExp.test(email)){
				alert("邮箱格式不正确，请检查邮箱格式")
				return ;
			}
			regExp=/^((\d{3,4})|(\d{3,4}-))?\d{7,8}$/;
			if (phone!=""&&!regExp.test(phone)){
				alert("公司座机格式不正确");
				return ;
			}
			regExp=/^http:\/\/([\w-]+\.)+[\w-]+(\/[\w-./?%&=]*)?$/
			if (website==""&&!regExp.test(website)){
				alert("公司网站不正确")
				return ;
			}
			regExp=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/
			if (mphone!=""&&!regExp.test(mphone)){
				alert("手机号码格式不正确")
				return ;
			}

		//	发起请求
			$.ajax({
				url:"workbench/clue/saveEditClue.do",
				data:{
					id:id,
					fullname :fullname,
					appellation:appellation,
					owner:owner,
					company:company,
					job:job,
					email:email,
					phone:phone,
					website:website,
					mphone:mphone,
					state:state,
					source:source,
					description:description,
					contactSummary:contactSummary,
					nextContactTime:nextContactTime,
					address:address

				},
				type:"POST",
				dataType:"json",
				success:function (data){
					if (data.code=="0"){
						alert(data.message)
					}else {
						//更新市场活动列表
						queryActivityByConditionForPage($("#demo_pag1").bs_pagination('getOption', 'currentPage'),$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'))
						//关闭模态窗口
						$("#editClueModal").modal("hide");
					}
				}
			})
		})
		//页面加载完成，刷新线索列表
		queryActivityByConditionForPage(1,10);


	});

	function queryActivityByConditionForPage(pageNo,pageSize){

		var fullname = $("#query-fullname").val();
		var owner = $("#query-owner").val();
		var compamy = $("#query-company").val();
		var mphone = $("#query-mphone").val();
		var state = $("#query-state").val();
		var phone = $("#query-phone").val();
		var source = $("#query-source").val();
		//发起请求
		$.ajax({
			url: "workbench/clue/queryClueByCondition.do",
			data: {
				fullname:fullname,
				owner:owner,
				company:compamy,
				mphone:mphone,
				state:state,
				phone:phone,
				source:source,
				pageNo:pageNo,
				pageSize:pageSize
			},
			type: "POST",
			dataType: "json",
			success:function (data){
				//显示总记录条数

				//遍历activityList,拼接所有行数据
				var htmlStr="";
				$.each(data.clueList,function (index,obj){
					htmlStr+="<tr>";
					htmlStr+="<td><input type=\"checkbox\"value=\""+obj.id+"\" /></td>";
					htmlStr+="	<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/clue/detailClue.do?id="+obj.id+"';\">"+obj.fullname+obj.appellation+"</a></td>";
					htmlStr+="<td>"+obj.company+"</td>";
					htmlStr+="<td>"+obj.mphone+"</td>";
					htmlStr+="<td>"+obj.phone+"</td>";
					htmlStr+="<td>"+obj.source+"</td>";
					htmlStr+="<td>"+obj.owner+"</td>";
					htmlStr+="<td>"+obj.state+"</td>";
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

	<!-- 创建线索的模态窗口 -->
	<div class="modal fade" id="createClueModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">创建线索</h4>
				</div>
				<div class="modal-body">
					<form id="createClueForm" class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-owner">
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
							<label for="create-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-company" value="动力节点">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-appellation" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-appellation">
									<option></option>
									<c:forEach items="${applicationScope.appellationList}" var="appellation">
										<option value="${appellation.id}">${appellation.value}</option>
									</c:forEach>
								</select>
							</div>
							<label for="create-fullname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-fullname" value="杜某">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-job" value="CTO">
							</div>
							<label for="create-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-email" value="hao123@qq.com">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-phone" value="0511-4405222">
							</div>
							<label for="create-website" class="col-sm-2 control-label">公司网站</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-website" value="http://www.baidu.com">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-mphone" value="13498791279">
							</div>
							<label for="create-state" class="col-sm-2 control-label">线索状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-state">
									<option></option>
									<c:forEach items="${applicationScope.clueStateList}" var="clueState">
										<option value="${clueState.id}">${clueState.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-source" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-source">
								  <option></option>
								  <c:forEach items="${applicationScope.sourceList}" var="source">
									  <option value="${source.id}">${source.value}</option>
								  </c:forEach>
								</select>
							</div>
						</div>
						

						<div class="form-group">
							<label for="create-description" class="col-sm-2 control-label">线索描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-description">描述信息123</textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="create-contactSummary">联系纪要123</textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control time" id="create-nextContactTime" readonly>
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>
						
						<div style="position: relative;top: 20px;">
							<div class="form-group">
                                <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address">上海市浦东区</textarea>
                                </div>
							</div>
						</div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"  id="saveCreateClueBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改线索的模态窗口 -->
	<div class="modal fade" id="editClueModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">修改线索</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
					<input type="hidden" id="edit-id" >
						<div class="form-group">
							<label for="edit-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-owner">
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
							<label for="edit-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-company" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-appellation" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-appellation">
									<option></option>
									<c:forEach items="${applicationScope.appellationList}" var="appellation">
										<option value="${appellation.id}">${appellation.value}</option>
									</c:forEach>
								</select>
							</div>
							<label for="edit-fullname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-fullname" value="李四">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-job" value="CTO">
							</div>
							<label for="edit-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-email" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-phone" value="010-84846003">
							</div>
							<label for="edit-website" class="col-sm-2 control-label">公司网站</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-website" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-mphone" value="12345678901">
							</div>
							<label for="edit-state" class="col-sm-2 control-label">线索状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-state">
									<option></option>
									<c:forEach items="${applicationScope.clueStateList}" var="clueState">
										<option value="${clueState.id}">${clueState.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-source" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-source">
									<option></option>
									<c:forEach items="${applicationScope.sourceList}" var="source">
										<option value="${source.id}">${source.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="edit-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-description"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control time" id="edit-nextContactTime" readonly>
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="edit-address"></textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="updateClueBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>线索列表</h3>
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
				      <input class="form-control" type="text" id="query-fullname">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司</div>
				      <input class="form-control" type="text" id="query-company">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司座机</div>
				      <input class="form-control" type="text" id="query-phone">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">线索来源</div>
					  <select class="form-control" id="query-source">
						  <option></option>
						  <c:forEach items="${applicationScope.sourceList}" var="source">
							  <option value="${source.id}">${source.value}</option>
						  </c:forEach>
					  </select>
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>

						<select class="form-control" id="query-owner">
							<option ></option>
							<c:forEach items="${requestScope.userList}" var="user">
									<option value="${user.id}">${user.name}</option>
							</c:forEach>
						</select>
				    </div>
				  </div>

				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">手机</div>
				      <input class="form-control" type="text" id="query-mphone">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">线索状态</div>
					  <select class="form-control" id="query-state">
						  <option></option>
						  <c:forEach items="${applicationScope.clueStateList}" var="clueState">
							  <option value="${clueState.id}">${clueState.value}</option>
						  </c:forEach>
					  </select>
				    </div>
				  </div>

				  <button type="button" class="btn btn-default" id="queryClueBtn">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 40px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" id="createClueBtn"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default" id="editClueBtn"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger" id="deleteClueBtn"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
				
			</div>
			<div style="position: relative;top: 50px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox"  id="checkAllBox"/></td>
							<td>名称</td>
							<td>公司</td>
							<td>公司座机</td>
							<td>手机</td>
							<td>线索来源</td>
							<td>所有者</td>
							<td>线索状态</td>
						</tr>
					</thead>
					<tbody id="tBody">
						<%--<tr>
							<td><input type="checkbox" /></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">李四先生</a></td>
							<td>动力节点</td>
							<td>010-84846003</td>
							<td>12345678901</td>
							<td>广告</td>
							<td>zhangsan</td>
							<td>已联系</td>
						</tr>
                        <tr class="active">
                            <td><input type="checkbox" /></td>
                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">李四先生</a></td>
                            <td>动力节点</td>
                            <td>010-84846003</td>
                            <td>12345678901</td>
                            <td>广告</td>
                            <td>zhangsan</td>
                            <td>已联系</td>
                        </tr>--%>
					</tbody>
				</table>
				<div id="demo_pag1"></div>
			</div>
			
		<%--	<div style="height: 50px; position: relative;top: 60px;">
				<div>
					<button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>
				</div>
				<div class="btn-group" style="position: relative;top: -34px; left: 110px;">
					<button type="button" class="btn btn-default" style="cursor: default;">显示</button>
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							10
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">20</a></li>
							<li><a href="#">30</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>
				</div>
				<div style="position: relative;top: -88px; left: 285px;">
					<nav>
						<ul class="pagination">
							<li class="disabled"><a href="#">首页</a></li>
							<li class="disabled"><a href="#">上一页</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">下一页</a></li>
							<li class="disabled"><a href="#">末页</a></li>
						</ul>
					</nav>
				</div>
			</div>--%>
			
		</div>
		
	</div>
</body>
</html>