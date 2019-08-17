<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%> 
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理</title>
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
<table id="mytab" class="table table-striped table-bordered table-hover"></table>



<script type="text/javascript">

$('#mytab').bootstrapTable({
	method : 'post',
	url : "${pageContext.request.contextPath}/studentD/stuTable2",//请求路径
	striped : true, //是否显示行间隔色
	pageNumber : 1, //初始化加载第一页
	pagination : true,//是否分页
	sidePagination : 'server',//server:服务器端分页|client：前端分页
	pageSize : 5,//单页记录数
	pageList : [ 5, 10, 20, 30 ],//可选择单页记录数
	showRefresh : true,//刷新按钮
	clickToSelect:true,//点击选中
	queryParams : function(params) {//上传服务器的参数
		var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
		   limit : params.limit, // 每页显示数量
	       offset : params.offset, // SQL语句起始索引
	       page: (params.offset / params.limit) + 1, 
		   name : $('#search_name').val(),
		};
		return temp;
	},
	columns : [ {
		field : '',
		checkbox : true,
	},
		{
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
	var htm = "<button id = 'del' class='btn btn-sm btn-danger'>删除</button><button class = 'btn btn-sm btn-warning' id = 'change'>修改</button>"
	return htm;
}
 
//查询按钮事件
$('#search_btn').click(function() {
	$('#mytab').bootstrapTable('refresh', {
		url : '${pageContext.request.contextPath}/studentD/stuTable2'
	});
})
</script>

<div id="modalTableAddStu" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">添加学生</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div id = "addStuInput">
     姓名<input type="text" value="" class = "form-control" id = "name1">
     年龄<input type="text" value="" class = "form-control" id = "age1">
     电话<input type="text" value="" class = "form-control" id = "phone1">
     班级<input type="text" value="" class = "form-control" id = "classid1">
     </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  id ="addStu"data-dismiss="modal">添加</button>
      </div>
    </div>
  </div>
</div>



<script>

$('#addStu').click(function(){
	var url = "${pageContext.request.contextPath}/studentD/addStu";
	var name = document.getElementById('name1').value; 
	var age = document.getElementById('age1').value; 
	var phone = document.getElementById('phone1').value; 
	var classid = document.getElementById('classid1').value;
	var insert = {"name":name,"age":age,"phone":phone,"classid":classid};
	var jsonData = JSON.stringify(insert);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
               console.log(result);
           },
           error: function(result) {
               console.log(result);
           },
	});
})


</script>



<div id="modalTableAddCourse" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">添加课程</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <label for="inputstu" class="sr-only">STUID</label>
		课程名<input type = "text" name = "courseName" id = "courseName" class = "form-control" required="">
		教师名<input type = "text" name = "teacherName" id = "teacherName" class = "form-control" required="">
		上课地点<input type = "text" name = "place" id = "place" class = "form-control" required="">
		上课时间<input type = "text" name = "time" id = "time" class = "form-control" required="" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime())%>">
		
		
<%
   Date dNow = new Date( );
   SimpleDateFormat ft = 
   new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
   out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
%>
  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id ="addCourse">添加</button>
      </div>
      
      <script type="text/javascript">
      
	$('#addCourse').click(function(){

			var url = "${pageContext.request.contextPath}/course/insertCourse";
			var courseName = document.getElementById('courseName').value; 
			var teacherName = document.getElementById('teacherName').value; 
			var place = document.getElementById('place').value; 
			var time = document.getElementById('time').value;
			var updates = {"courseName":courseName,"teacherName":teacherName,"place":place,"time":time};
			var jsonData = JSON.stringify(updates);

			$.ajax({
				type:"post",
				url:url,
				data:jsonData,
				dataType:"json",
	            contentType : "application/json;charset=UTF-8",
	            success: function(result){
	                   console.log(result);
	               },
	               error: function(result) {
	                   console.log(result);
	               },
			});

	});
</script> 
      
      
    </div>
  </div>
</div>

    <div>
    <button class = "btn btn-sm btn-primary" data-toggle="modal" data-target="#modalTableAddStu">添加学生</button>
    <button class = "btn btn-sm btn-primary" data-toggle="modal" data-target="#modalTableAddCourse">添加课程</button>
    <a href="" class = "btn btn-sm btn-primary">删除课程</a>
    </div>


</body>
</html>