<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />

<%--js部分--%>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>
</head>
<body>







<div class="panel panel-default">
    <div class="panel-heading">
        查询条件
    </div>
    <div class="panel-body form-group" style="margin-bottom:0px;">
        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">姓名：</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" name="name" id="search_name"/>
        </div>
        <div class="col-sm-1 col-sm-offset-4">
            <button class="btn btn-primary" id="search_btn">查询</button>
        </div>
     </div>
</div>
<table id="mytab" class="table table-hover"></table>



<script type="text/javascript">

$('#mytab').bootstrapTable({
	method : 'post',
	url : "${pageContext.request.contextPath}/studentD/stuTable",//请求路径
	striped : true, //是否显示行间隔色
	pageNumber : 1, //初始化加载第一页
	pagination : true,//是否分页
	sidePagination : 'client',//server:服务器端分页|client：前端分页
	pageSize : 5,//单页记录数
	pageList : [ 5, 10, 20, 30 ],//可选择单页记录数
	showRefresh : true,//刷新按钮
	queryParams : function(params) {//上传服务器的参数
		var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
 
			name : $('#search_name').val(),
		};
		return temp;
	},
	columns : [ {
		title : 'ID',
		field : 'id',
		sortable : true
	}, {
		title : '学号',
		field : 'stuid',
		sortable : true
	}, {
		title : '姓名',
		field : 'name',
	}, {
		title : '年龄',
		field : 'age',
	}, {
		title : '班级',
		field : 'classid',
	},{
		title : '操作',
		field : 'id',
		formatter : operation,//对资源进行操作
	} ]
})
 
//value代表该列的值，row代表当前对象
function formatSex(value, row, index) {
	return value == 1 ? "男" : "女";
	//或者 return row.sex == 1 ? "男" : "女";
}
 
//删除、编辑操作
function operation(value, row, index) {
	var htm = "<button>删除</button><button>修改</button>"
	return htm;
}
 
//查询按钮事件
$('#search_btn').click(function() {
	$('#mytab').bootstrapTable('refresh', {
		url : '${pageContext.request.contextPath}/studentD/stuTable'
	});
})
</script>








    <div>
    <a href="changeCourse.jsp" class = "btn btn-sm btn-primary">添加课程</a>
    <a href="" class = "btn btn-sm btn-primary">删除课程</a>
    </div>






</body>
</html>