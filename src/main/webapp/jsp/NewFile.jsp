<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员主界面</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-select.min.css">
<link
	href="http://cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.css">
<style type="text/css">
#index-big {
	margin: 0 auto;
	width: 90%;
	height: 500px;
}
</style>
</head>
<body>
	<div style="height: 80px"></div>
	<div id="index-big">
		<!-- 教师信息显示表 -->
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading"
				style="text-align: center; background: #7AB8CC">
				<strong>教师信息表</strong>
			</div>
			<div class="form-group" style="margin-top: 10px;">
				<button type="button" class="btn btn-warning col-sm-1 control-label"
					onclick="addTeacher();">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>
				<label class="col-sm-2" style="text-align: center; margin-top: 8px;">请选择查询条件：</label>
				<div class="col-sm-2">
					<select id="teachertype" name="teachertype"
						class="selectpicker show-tick form-control" multiple
						data-max-options="1">
						<option value="1">教师工号</option>
						<option value="2">教师姓名</option>
						<option value="3">联系方式</option>
						<option value="4">教师性别</option>
					</select>
				</div>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="checkTeacher"
						placeholder="请输入查询内容（默认按教师工号查询）">
				</div>
				<button type="button" class="btn btn-info col-sm-1 control-label"
					onclick="CheckTeacher();">
					<span class="glyphicon glyphicon-search"></span> 查找
				</button>
				<button type="button" class="btn btn-danger col-sm-2 control-label"
					onclick="DeleteMoreTeacher();">
					<span class="glyphicon glyphicon-remove"></span> 批量删除
				</button>
			</div>
			<div class="form-group" style="margin-top: 10px;">
				<button type="button" class="btn btn-success col-sm-2 control-label"
					style="margin-right: 10px" onclick="check_all(1);">
					<span class="glyphicon glyphicon-tag"></span> 全选
				</button>
				<button type="button" class="btn btn-info col-sm-2 control-label"
					style="margin-right: 10px" onclick="cancel(1);">
					<span class="glyphicon glyphicon-tags"></span> 取消全选
				</button>
				<button type="button" class="btn btn-primary col-sm-2 control-label"
					style="margin-right: 10px" onclick="back(1);">
					<span class="glyphicon glyphicon-bookmark"></span> 反选
				</button>
			</div>
			<!-- Table -->
			<table id="ShowTeacher"
				class="table table-striped table-bordered table-hover"
				style="margin: 0px auto">
			</table>
		</div>
		<!-- 教师信息显示表结束 -->

	</div>
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="../js/defaults-zh_CN.min.js"></script>

	<script
		src="http://cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//初始化显示教师信息表格
			var url = "${pageContext.request.contextPath}/studentD/stuDetail";
			$('#table')
					.bootstrapTable(
							{
								ajax : function() {
									$.ajax({
										type : "post",
										url : url,
										data : {
											"checkType" : "stuid",
											"condition" : "xml"
										},
										dataType : "json",
										//contentType : "application/json;charset=UTF-8",
										success : function(json) {
											console.log(json);
											alert("查询到的条数为：" + json.total);
											if (json.total != 0) {
												alert('查找成功！');
												$("#table")
														.bootstrapTable('load',
																json.rows);//刷新表格
											} else {
												alert('查找失败！');
											}
										},
										error : function(result) {
											console.log(result);
										}
									})
								},
								url : url, //请求后台的URL（*）
								method : 'post', //请求方式（*）
								datatype : "json",
								contentType : "application/x-www-form-urlencoded",//如果是post方式肯定要加这句 
								toolbar : '#toolbar', //工具按钮用哪个容器
								striped : true, //是否显示行间隔色
								sortable : true, //是否启用排序
								sortOrder : "asc", //排序方式
								cache : true,//是否缓存数据
								//dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
								//search: true,            //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
								strictSearch : true,
								//showColumns: true,         //是否显示所有的列
								showRefresh : true, //是否显示刷新按钮
								queryParamsType : 'limit',//查询参数组织方式
								minimumCountColumns : 2, //最少允许的列数
								clickToSelect : true, //是否启用点击选中行
								uniqueId : "teacherNo", //每一行的唯一标识，一般为主键列
								showToggle : false, //是否显示详细视图和列表视图的切换按钮
								cardView : false, //是否显示详细视图
								detailView : false, //是否显示父子表
								buttonsAlign : "right", //按钮位置
								columns:[{
									field:'classid',
									title:'班级',
								},{
									field:'stuid',
									title:'学号',
								},{
									field:'phone',
									title:'电话',
								},{
									field:'name',
									title:'姓名',
								},{
									field:'id',
									title:'id',
								},{
									field:'state',
									title:'状态',
								},{
									field:'age',
									title:'年龄'
								}],
							});
		})
	</script>
</body>
</html>